Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C639F290
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127436EB7C;
	Tue,  8 Jun 2021 09:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8DA6EB7F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKhpON6mqR30XH+oi1QhHnuPP9Mr3GVr8JyWCPRWL8z3spig8CGN8jjgUuBSO38PHq42nJzUNaSIOXFvNN3xrB9IjLgBy5VJzl+ay83C+OFWrLsZL/hxkZT3MFyil1JM8WAQdE7kzbPrL3VBi309v3j168FNsdyTfBa0aVrikdjO30fTyMesYjgCkgmY1BCe3GY1fRsXRB3FfVJin3IZhdNj5+JtgxO+CDOlvkifPgjpq8AhjOi87LTZceAGr4NMD+ACKCjUvW265Kk0C2L6Z14Yh49CK+UgEhO7tWQ56jN2UZvsar1rnhL+k3XYCfvjMzEnDX4qmtJUnVEXlL8Y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qY5h/eXZGQrotO8BuMfq6NcAiDCCqmsn2jGjnzmTLc=;
 b=l26Hhi05JRDhKIoXxcnYfx6A8Qsfii7c5u+iE2IXmL0SqjphC5mwi8biBSmEfck1ae8dTjiO6EHG2eG/TFVxP6V8WraiUhgQffers/kr8pxhf4z7ubZPbHVpk3V3pF9tIY1BostavXXqvZMJmT5hxSDNAJSQ64/mAbMgaYKs+EBm0WhcNqG8CTMHrblyi4z4tcFzKzKoPZY2EFOCDaYhqM7uILpdOv2lM2mMiLlw7DR3Z1VVcHaXsj5ulfIOFJLN39gTC8rl2M/8FCXUsDWWTJA5CY9YhzxtKKS8BjDMLaP+vKnRzKo5Y4uC9HAXb0qp2y/v5m9U1KShayg0DrQCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qY5h/eXZGQrotO8BuMfq6NcAiDCCqmsn2jGjnzmTLc=;
 b=jeonADnUA3jqlcME103y9CQL1qar8mwcye31xOVSaYST7yxzznoZuPBoAYkidpNF3BTSV4i7rFcmSsEFWx3w1UAKBS0Xcklq6KYLtVkU3LRt0HQFk3TOHgSXX166WYHRgGrvXcOaFnUt5PBxIHxwrqxVpMMEwDYfkfl3ai3vt7k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5038.namprd12.prod.outlook.com (2603:10b6:5:389::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 09:38:07 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 09:38:06 +0000
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
 <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
 <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
 <adb183d0-fdcb-5b78-a814-76683b6200ff@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <552ba90e-0136-1008-2f0d-5501006b007f@amd.com>
Date: Tue, 8 Jun 2021 11:38:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <adb183d0-fdcb-5b78-a814-76683b6200ff@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f2b:6400:c449:165a:413d:7e84]
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2b:6400:c449:165a:413d:7e84]
 (2003:c5:8f2b:6400:c449:165a:413d:7e84) by
 PR3P189CA0088.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 09:38:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dde6217a-1984-4d69-666e-08d92a611eeb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5038:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5038E04DAD268FE570A4A92D8B379@DM4PR12MB5038.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NojjNK9gtbD+iJ4vhlKuCwbOdtua2rO9WfgWcJR2buSZGWnaZO1nk8126mqZjRBKKntUTnyxBIp9KFE35UrbVNw9SPf8qY8U603Ccii5fIfBnd71D3p+xB1pjbB/ER58nuX5YWQjZydZL6mBPhUIbuF5M0ABQs//MVO8820Psjez5aHz1N9ppP5StpI0x5Ufp7ywDceoOP6lNT/f/0YtO64iCaRMIXPFPF/vKUr0jtPEdLpqXznKD17fTwqF5AP3TFFDGNHYZFhYhtzmO0rF1aef1T60NuAJgg6yNlMBx+A/hVY+M501od3IdFplTx0znQvS5XTLmTNEgyFwO3gZXhKxxAHgbyj80o0Vck3GRd/IPa/teGWl11uI4XzEafDXGeHzmk2P5y+yHHoU8hhtAa6FWy+su65P/uWaG+qgw0Y1Q/7Z7AvpFKNLYaoPbkRoex1oEsxE7uH3f7PxqlFHu9KP+iS85CoPslNZHpQ0PiJ60zntmZeTiAf/uh70Q9c6CX3mV/2Bue6TnDCFxRQQIGVaWesB7uNVTdrhfAjlTSeSGtuRxsUfLnnENHTJWvbyeTsDZObVNIGE87YmaWjg3HcmHMvA3MZMYiN0+QGlEm8YGLeAErnpmVsaQ/2dlfprjON3LNLE3FhHOQwI7y5pD5e94XyQ83eUnwsd0VfsUtNG1TS8fTF4mPAutatjuGao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(2906002)(52116002)(478600001)(53546011)(110136005)(83380400001)(2616005)(38100700002)(16526019)(186003)(4744005)(66946007)(36756003)(86362001)(66476007)(66556008)(5660300002)(8936002)(6486002)(31686004)(316002)(6666004)(8676002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENlYllHYVZzUWtpcWVleEdjcnkwOG9yQVlvSDRaSkpTdmcrd29IenNDOTZ4?=
 =?utf-8?B?ME5WRHhnYWJ5b0h1MFUrMmMySGVoL3pxOVB3SmI3V3JIbkthUjRtMTB1UU5n?=
 =?utf-8?B?Q0VCOG9zUjFsdURXSmlXQll1MWpSdUlrRW1pNFdWY3Uzc3gzWnJlYitWU2Vk?=
 =?utf-8?B?ejZqdWEyZmJxdFJBV2h3dTc2YXc0TG5obm9WbDR5V0tlT3g0SUUraFdTblhC?=
 =?utf-8?B?R3c0aXkrK0ZpM3RXMHZQTUUxVnRkRHFOMTNESnpiclBmRmRVYlBpQ0tnMFVI?=
 =?utf-8?B?dGhTb1ljaXJmT2FUdWtNVTkzZHBwTHJzc010dk5tQXRHN3BVaXNMYzlQWjF3?=
 =?utf-8?B?ZWtWRUMzMmI0bGVBclExWmlrd1MvMStubjVDUFdNMGQrUnVoWkYzQ2YvaE8v?=
 =?utf-8?B?bWNDN21FME1IVEc5VmpyS24rckQ2Qk4rbXlKdm1VTGZISzV4K1hzZDdxQWc1?=
 =?utf-8?B?dHBLSUlqYlREQy84VFVJVStla3ZFK2VRWFhQNjJTeVEvUUpDSENiQitMR3BP?=
 =?utf-8?B?YTN1YmpXZndhN2RpYTIva1B0WVZMR1QwS3lnbnNTeWxCbFZmRllYNEJzSTZK?=
 =?utf-8?B?WXd5eXc2TGJzVmUvZC9mVGN3dlhUWmUvdWRMc3cwVDVhTExDU2w5a1dmVTU4?=
 =?utf-8?B?cUY1bWRPYTBLVUJYMDhqQXAwQkJlZWMzU1drM0pXKy9PcE5rdlh5ZjVSMTQ4?=
 =?utf-8?B?VFNIanJTNThEdml5TlJ4YUJ4WmpRaVJhSlRwaW94S1V6eldzMzc0QnhJNmxT?=
 =?utf-8?B?YklQdlBqUm5oYUVoclN0R0RIRkorUk5KSkFOYkQwaWd6SEk4VC8zMjA3S0pD?=
 =?utf-8?B?SWN1VlVOT0lYUE00SENPbjJxcWh5cWdnMER3L3NYeGdkTEhselloc2NTTEc0?=
 =?utf-8?B?QnlmQlIvOUZTN1cvY0pOOXVwK2dEZ1NXYm5ROW1vVDFST0laTEJ3LzNYcEdt?=
 =?utf-8?B?SDRwdzBGWDhKRkhEYXBXLzM0am9xeklpZk5ySGJPU1dEWWNPdEIrbDAxOHdV?=
 =?utf-8?B?dGJxbkpXclROb0I4NVJYVGtSMTlMY3cvZ2Yvc0h0VzJNd1NxdDFZNjI4UEkr?=
 =?utf-8?B?bUozUUVpd2hxdjZEK2x2akc4b1kvdnZ3LzhFMHJZY3pKbkM4akFudEtMOUZh?=
 =?utf-8?B?Ti8xMkVqTEUrd1lpWlMyTUMwNXhHa2lOczlrOWJTV1oySUlTM0tZakFMZjU2?=
 =?utf-8?B?bHFKQjBFd2NndGc0OWpDZ3NyV2pTajNUVFZUTWVWY1NJK0tNcHZrbzg4aEo2?=
 =?utf-8?B?SUJaUDVkTktaZEpseFBER2RZQUc4R0hNZVg1UE5iZzZSZTJ4OUg3dndZRXFk?=
 =?utf-8?B?RTdsamhTNStLd2dOOU5XeHBaNytDUEt4bFl5anc5c0dHMDJMck5BWThNK3Ix?=
 =?utf-8?B?RXBVS0Izdm9MWWpRc2N5V016cmhHWmdRYi9nZ3hYOExmZVFJdTh1cXI1bkRv?=
 =?utf-8?B?blB4QURYSjE4bDFlNE4xeFVBN1JsdEpDdFU5ZEY3K29wc0VNaEJSNFFKZ1Rx?=
 =?utf-8?B?L3diN0lKUjlvQnBSWndhVGYzNTRnN1dOV3YvTGdqZkh5b3RuUitkQnpqMWpY?=
 =?utf-8?B?dHAwQVhIWGtnaTFUdy9YQ0MwMStMTWdpcitBVjEyOEs1K29lekhTUU1yVmRC?=
 =?utf-8?B?cUFkMS9FNWFQcWpQRVhQR3JRc1ZOTUg3Tkp2M2E4bDhmQ09Na3B6bWlBOGx0?=
 =?utf-8?B?OEYraWN3VjcrRm82aXlxUC9NRlI2aWhqM04rQkY4L1k1VXczQnNTWmNYaEE2?=
 =?utf-8?B?RHEvUXYvV0k5REVzWGM1ekFkT3hvbVNRcmpZdlZnQzNiUE93ZEY4cVE0SU9n?=
 =?utf-8?B?MEhCVVA5VkMzcEhwMTVPZ3NMaEJEYk9meVc1TzloaWdySm9sQjFDeEdIRUo5?=
 =?utf-8?Q?C/g6VW3XeP9Fh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde6217a-1984-4d69-666e-08d92a611eeb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 09:38:06.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojLJE5KkvaI7kpIhKMBFXYjnY6eGrZPIaUhb6uYWU+VNkhbgNtONgAFJTh18DdUR61KEXLLWxA6eSbh/k85BhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5038
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/8/2021 9:21 AM, Christian König wrote:
>
>
> Am 08.06.21 um 09:17 schrieb Thomas Hellström (Intel):
>> [SNIP]
>>> Do you have the log to double check?
>>
>> Unfortunately not, but IIRC it was directly from vmw_move().
>
> Nirmoy do you still have your vmwgfx test environment?


Yes!


>
> Thanks,
> Christian.
>
>>
>> /Thomas
>>
>>
>
