Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F9739F299
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26A6E045;
	Tue,  8 Jun 2021 09:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE036E045
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRhgwiLt5vv06q2lJCrR4djmK4xjUQFUOw25DRmQkuBL1r6RpJQ+xIhHWhfMT2I1+UgGrPywzOpZzwCJ8z6U6ImzTJQaF1tPBeybT6oXg8NuVT+3h80/lxc72Wyff5/ok1RL1EO4CvH5GWiaRyZdsVEoboiU/wPZTg+7tfrRIe12P1FZTu4UOz1XOGn/F2+H3bmkZE1LUe+tfxSRFJJIRV5I+wukQT1mYGnDf5VEpU0EfepiNlSwXQDVpsaCKtVkqEgalxdn1+5a9Euh5WqY7Ehwhd23n5SraYb43DBqFoNA3cnnKo5Gynsa/XjfYfZ6hBYjJY/xVms86EdR78RsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pal/choECd0SriaQ7U4ZlUAzGGIVio7oTy6TniqA7Kw=;
 b=JRoyaTDMdrKkceYL0hOYbBQgk3TE62/MxnbbYtkKHnjP2ww0L+O8W36v0swiVCmd8onTWxCYaDHhE5ZTPknJB3791M7G4t1/nK7YUYVHeBWQx+LYG7Fs2JtXuqnKE4ZTODhJQBzhmkD85PdOhGTHyh34JBVvRd6l9cFPJIiBUJb4zQFDHfFALoxSsyaK/YMOMLqoziz7V4QjQcyctz1w3VcalrgiC6UE00zHrULLzEbrJI+Cl2R1TfdYzETRM8zotFHD2KYrXYB+Vj0SuOAQ8J/iha3IxnZCm+Ch59qhjg80WHapQ6BBb8UdAslVvdwvxo/OBgjOQcPGeOuE8R+qDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pal/choECd0SriaQ7U4ZlUAzGGIVio7oTy6TniqA7Kw=;
 b=t21oBntT5aoaASu6R0wjfKiFhysoSaN/7T0eqyetA1txjB9qO1HODjLwy7/rIcX1XyStc8MlBvbotdlnQwZ5CObRSqbJG4eFAvjDKyALf8tAFh5tNpPTkARp7eVCVjMKGJFnOakkOBcQX+8P5TKmJExm4Z7MiRrkmK7Ra1HYqWU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5446.namprd12.prod.outlook.com (2603:10b6:8:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 09:40:36 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 09:40:36 +0000
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
From: "Das, Nirmoy" <nirmoy.das@amd.com>
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
 <552ba90e-0136-1008-2f0d-5501006b007f@amd.com>
Message-ID: <df1b9679-1780-3905-4b25-9e73c1ca1320@amd.com>
Date: Tue, 8 Jun 2021 11:40:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <552ba90e-0136-1008-2f0d-5501006b007f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f2b:6400:c449:165a:413d:7e84]
X-ClientProxiedBy: AM9P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::19) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2b:6400:c449:165a:413d:7e84]
 (2003:c5:8f2b:6400:c449:165a:413d:7e84) by
 AM9P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 09:40:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e55ef3-9cbc-420e-b935-08d92a617831
X-MS-TrafficTypeDiagnostic: DM8PR12MB5446:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5446458FB63B03A303D746B58B379@DM8PR12MB5446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8mirYxS7h571w9sBIBRF+K1XpbAde2yJ0t4x1yC2KPFvQkivesyUfCjOSdc6wWkJZz/0K+6+cvJKS2dSCCusYPhJ+zwiQbzJ2AMQh02/zpgxjqwp45YEyK2SdEY4nzEbc0PPLpE9mMwAsaSDif5R8EGXWPCiG2+wt0I49RdHD2PcpRwbhvJRIaJ/CWR2Xw/iVSzElRxyONbj+sMxP3KLtaisuUjYFqU+FA+xHF2A4RNbFG8uTiGxr1wQUSE+rnUR7rgusc/GalrrpsgnT1SPUyQVzOgxyNSz5JxCyzArpunQJP9an7thyQutb/v1gbfLM1R9EEf0S+SOpvPhtzoyk2+0y/zl8P3W/V8XRzirxEY9Q8tum8AwnD4m3fx4wUED5ZdXPdgaHsXXVKHWxm/0Ko2sRNAV/ELnZtkHryxuQzjVbunMUftBmMtCuSw+MzG/53tmWb1LrYMWmPiQ70O7o+Yb9lXpKiK0K1BmFYhy1lTweSVkcvNHNXp4/MMBlgzU/9PmDNId1X7x4MpulONHgPFq+m5ZS2Uv0uHC3NkRCJQV3sZIdDWmfnK6wI5n1H5JZ30RAAuK78bU+2pflWD/MRwQIhtgd5LCakOzMEjDtMyghDMVE5yw66MCBrYSIlwMuhwrwl8lPV85TnNLKouttpvCb9Av24987oKeS7jlYQU4hzxIE+x9+Scaef7hpqs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(31686004)(8676002)(66556008)(66574015)(110136005)(53546011)(6486002)(16526019)(186003)(52116002)(5660300002)(36756003)(38100700002)(2616005)(478600001)(83380400001)(4744005)(31696002)(8936002)(66476007)(6666004)(86362001)(2906002)(316002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRiYnhvYUI4V1VuL0d5ZDRReDRhaVk1cHNsb2tXRno5ZFZUWlhJWWczS21q?=
 =?utf-8?B?c1d4VDhvSVR4MTlKUEdURmFkc0tmNGpXQm85cng5UklXMUVaOFFtWVdnbVBT?=
 =?utf-8?B?UmxVZFRRVUp2K09RWU11KzQxclh2UDdvVTNHT2hsNGxzaFRrT0NlT0JVY3Zv?=
 =?utf-8?B?WFVOZ3hrRHQ0RG44QmlnQnpDcUFONE9meU9pYms5bmFHakYxK1o1TWJkdTBH?=
 =?utf-8?B?M3Z5MWdwcGE1K2RhbStSMHZzNy9kMXF6VEd3ckVkVGlUbUkwWHpIcFgzRVQ4?=
 =?utf-8?B?UHIvd0FtRjRKdE8vV2JtMUprM1o1YVpJZm5neldyQ0RabThkckx5U3RGU2J1?=
 =?utf-8?B?L3piZndKbi9ISlV2REZ2NGo3cldtNy9aM2wwODZCcVpPSEUvbWpNNEtCQlFH?=
 =?utf-8?B?bkhZdTFNRmsxL2k1SWdCVDVRVDc1d2FFNitHZWhZWmZOUCtRVGtBSWFPZVdj?=
 =?utf-8?B?Ujd1M2dTbGhlczNIWU50YXVESjlpNTlJdVpBZlhhclRZUjk2Yll4OXdUR0xw?=
 =?utf-8?B?K2hRclRJQVNmWXZ2ajNYcjNMemgzQVhSaldMYWlZRnJJLzFhYnVGazBaeGhD?=
 =?utf-8?B?RTR2Nm1pa0ZhWktoVm1PYkhORkwvQVlPSGxJeXJ5aTNSZmlnVzNjdmVNanhS?=
 =?utf-8?B?UnloSFpKc1F2eUJsT3luanY5eGtxVFNUYXJmMytlck1ZdnoyNTJnQ2RsZTUv?=
 =?utf-8?B?UFYxT2NkUCtSRWdLOGhKSmV6ekVMMXpaRWJyQUZrRlczTk9Ka1VDSGhaVTQy?=
 =?utf-8?B?WlZjRy9GQ09kTUhkYTUrcWpIa3MyOXBwaS9FWkJIaVRhR3c4ZmZmeHEwbVla?=
 =?utf-8?B?b2RzY0drQmtrdENhZXZudFN1OGhqOE5zVncvZnd5ajEzcitIb2dCZlVOYXI5?=
 =?utf-8?B?alBzZXJGanRLNnlRTUl2c0pCRmE0MnYxQlZHaHhhNlVzWDJxdlNreGZhVllF?=
 =?utf-8?B?aVpMQUNpalVjUGtPTmlWMGp1UHBERFdJa3dua2I0VE51TEJFWm0yNTZ4b3pj?=
 =?utf-8?B?eDNnd3Zlem1oWkxLcmthVE11UHRpK1R3ajJDdnhnSG1JcC8zc2l5STkxWXY1?=
 =?utf-8?B?Wlk5Q2VPYnJKak9OWXNxZGFiNndIVTFXTE05K0hiR0w2cmxzS3pEditqY1hz?=
 =?utf-8?B?VmhnZTEwZTNZaHd2cnRjOHcydXlJaHhiSGNJZTEzbUVEMzhlZ3BNNlQ3QmFk?=
 =?utf-8?B?T2ZxRElGTHN6RDN5M3lOdW9oejdBbFIrSXVtQkw3WnJtRVNjcUhHRlFSVjJ5?=
 =?utf-8?B?b0NnbGViUVE4R0xuVU9MaTBjYVBOU2VOaUl4eDdpMytJaWh5dzhaZXBZdFVt?=
 =?utf-8?B?bFNSb1FhbFVrWlQxZTlaRHUxSmRuM0R1S1FTRjU5SnAyRkJhdElZdTNiK3ll?=
 =?utf-8?B?SXRXZzhpQ3B5bkFEVE9WZkRpcllBL0h1WFByMWs1ZHZ4aVhndm9zcXZtWFBG?=
 =?utf-8?B?c01rd05xWkpNVndWU3V2cWJNQmhsYWJHT3pYTlRBT08vZ3E5aVllRmVPbmxZ?=
 =?utf-8?B?OW4xcUxPckFLYWdlNThhRmV3TGpsZ01xamNJYmMvZyt1RmwwaEVpOXRMdmNw?=
 =?utf-8?B?OHlCYlJFNVRaend5VWtzTXcxMlprcWRSUkw1NWt3RE5sR1RWV0tNZW15K3hZ?=
 =?utf-8?B?cUJzMjFUdGcxU0hvOUJqakt3ODhINVJ3VkVtbnUzT1JOSDdWUGNhTC9ZeVdY?=
 =?utf-8?B?RU81S2VZUUptdytPZkVyNE1sYzRMMDlYbXpGUWxNekpjL0JXVDZWOGJFYXhy?=
 =?utf-8?B?Zkc5b0txS3ppTlZ4RThOVUE1S2phaDJTdVpBemM4d0prV2tpejdwaFh6aEd2?=
 =?utf-8?B?bW5wcWVlbkY0OW1XMGFDT1Fob1hFN25vbmJaVlNRbjBYbU1YLzJXd25xQWUz?=
 =?utf-8?Q?nIGEDeC8ewgGt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e55ef3-9cbc-420e-b935-08d92a617831
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 09:40:36.8256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vg6A+LIIcLEVOzIfq80q3rhQd1d3g8CQ8WPf7Tgalux5qDwHeaJvoBQm2eI/LleJkf/c6SFD7EGV3XyJ2U49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5446
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


On 6/8/2021 11:38 AM, Das, Nirmoy wrote:
>
> On 6/8/2021 9:21 AM, Christian König wrote:
>>
>>
>> Am 08.06.21 um 09:17 schrieb Thomas Hellström (Intel):
>>> [SNIP]
>>>> Do you have the log to double check?
>>>
>>> Unfortunately not, but IIRC it was directly from vmw_move().
>>
>> Nirmoy do you still have your vmwgfx test environment?
>
>
> Yes!


I will test this series on my vmwgfx setup.

>
>
>>
>> Thanks,
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>
