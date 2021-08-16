Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330523ED3BA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCD589DA5;
	Mon, 16 Aug 2021 12:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E59689DA5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEIN/kf4unbhHXoRLUHgqnzgT1uhHQYDRqFrm6BETjzC348IU+IEItO3c9XAEIuRi8VQg+O6/CK4bhLY1snZZ8BuLPMOqzk5QDAiEi9xzDGAPDsHxTfRi0r0joUtqHkThU1itxImoY4o1pSYEootw4DDHQaRyRgPNCzE3jaMBJaBYuQLvwvSa8nrmOFtwsrjXYOQgkENM4cWW0SwHLfGd94z4FXat2WAx0EYc4TtlrW6SCZhDObAo1zZe5ymNTsPOc9DW1wk3xV2Rda3rhWJ88BXNULPzDswrzsNke/EA7DViL4cdxdkkdrOOjl/7j4JrE3KMMgl/k0RcOuVAaUneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pi9Q+qHS/sXlQhZmsRJmWxznRSSmtm1C2dtyENnjNU=;
 b=C6q9gIOnlrD6s2qt5b5TBWoS/+n62g4MIwXy+kEFF2BACPLNAleHteTEZb0KEC2mmTVyC0HGj5l5it1ReZxkE/Jrf9qsQRpNz5Cez14HKO8Nwq/X8kLq8o9GYn6GmiqZBUI+KEMkS7SI6cQzRgkmvg7Jx6JmEbyp/tbFt5z78lbgRY4kx/LQdKPq329Ypa9CowTwq1eCetCEdFwM6sYmJY3Auyl//JN5Fli8NhT8Cls1u2G0kejXzS5/7trRQ14d/kosFuNqB9Oh9PUj0h64bhawyWkB6av6MRCfqck8HMws9RUseFSWw9BAjmfMCc3rwa/j3gdlislAPv6TPzbbzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pi9Q+qHS/sXlQhZmsRJmWxznRSSmtm1C2dtyENnjNU=;
 b=5MgQbCPFOZLc+xDwAZyrYX71uraYmhYGi75Z5kX+5vfPETtXTjsHNwfl2NvFDxIWtdPfPiJYCzGnnehsLqQCF1TwNdSqk88veTFIFg+d/mvsnKfVWUO1MGmn1FWZLvlpe89CAvr43/CnHDFGCl2ldikMOqJ7vxfEXPbSBSfQOsg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 12:12:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:12:58 +0000
Subject: Re: [PATCH 0/1] Fix DRM driver initialization failure in kernel v5.14
To: Huang Rui <ray.huang@amd.com>, Dan Moulding <dmoulding@me.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210813165014.31106-1-dmoulding@me.com> <20210816062018.GB1179183@hr-amd>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d99f6a6c-0c86-5520-4f57-f868c834a6af@amd.com>
Date: Mon, 16 Aug 2021 14:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210816062018.GB1179183@hr-amd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0110.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f9:c3d:bbad:9698]
 (2a02:908:1252:fb60:f9:c3d:bbad:9698) by
 AM0PR02CA0110.eurprd02.prod.outlook.com (2603:10a6:20b:28c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Mon, 16 Aug 2021 12:12:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bccbbcbe-355a-4fe1-a79c-08d960af2f97
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB438996DD1FEB93B48FB9C8F383FD9@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PD81u5i4WlL+W9nSkcAw3iaQ8p0E7qeTDKkTYYnjHY9W3MC9Q73QtqJ3JKFwHIPcjp3MGxO6Ie/v8hk/j8AYue9EZPk1TDeQ98KA1Dq20TeDXv0o6OkmJYSXXpxtxSjhmhJ/gaoOMzomrImU2MF+QfdH+RZg77qAb2o+8a3toE+h0kd1KfbhwO5GY7Z7S7GUsEg+ROzyUvmF66gY4LvLbENzMOTcIolKflT0vDsMKCfVUCkP0aPs0TOmWOU3/UEzzJ91/4B5zxFr1xOKeOzBjcBM1oatKfivLTMyseMUpEaPwOEtQCl9UTMSTQvyYXt0KzJql8XHxeW4z0RKKfe4ooJzQN3CstgbpYavIVkC7fsJYVExCmabU4NLh8jlAIa4jyfxUzVcwVb2ieZvBsZZFe/9OdE/tRsvXa//TcSMGKdMCX2eBnjqE4VexBp9ymTpDWaLHnFDFstOgfBcn33aBF1ymE9aAFadc71bIl5noofaxNRJOhoSI+67MhPDyFw+Pv/BH90RGgtsElLV1QH+qp8KM95myodxRwIHSGwyiOd1XlEaYx6a9zqrXNDP5ykO5XgBmYZtDGEZf2ZNBinQ0DMiQvccYxKLXdgSgvt+nN0cufzCXf7+REMq7aYkTVQQd7vQaUzs4mEhY2f/raarLWgaEnuFsUodnAs8tLbrIlSr3fJONihIEicLfpbEPSuVvx90s6BdURqbLKhEHikqXjAl2TIVGoq7JfVSBpRgw0+HbHedDryHCsNsk2WP7ZwD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(8936002)(31696002)(2616005)(6666004)(8676002)(31686004)(83380400001)(6486002)(508600001)(316002)(186003)(110136005)(54906003)(36756003)(5660300002)(66946007)(66476007)(66556008)(2906002)(4744005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1lkWkRhWWx1emhQK2RxMHpXQTY0Y2U4OEM5Q3FkTzlkUUhrSkFhaFR5d29B?=
 =?utf-8?B?U3gxUWNXa2FwSERIbHFHMjNlQm9EMUFIQ1pSUnNoYk9qRXptUzVGSHNsNHlk?=
 =?utf-8?B?TU9wT3I5N2ZHUHlGZmRhNXdUSjZvckM3N0VvMTRaaFgvMEQ5cGZZZTFHVHZT?=
 =?utf-8?B?WXFicUhvUFN2VC9kZzdlcTMwTGVNdkFmNjc2cmlXbWJYaVkrQVNnMlhib1Bj?=
 =?utf-8?B?dlR3VXFzWVFESXZydUdsa1ZNckZ5VTB6eEpLOGFGRDVTRG9kN2FOZHhGdTVu?=
 =?utf-8?B?bXlUM1c0cm42OUFUNkxUWEIxYTBOWjNPcDZXS2VxUFR2NXM3ZzAwTW9oem5h?=
 =?utf-8?B?cXJuaTRyYUpQY1phWVptS1NCTCtVdndBYmFPaStZaitCek5EdmRQc2hua3hD?=
 =?utf-8?B?Z2ttUkVJTU9hSFFxODN6RWFYenhCVE5ldWFQczlyTUk4dmM1VlkrRzl6OUg2?=
 =?utf-8?B?a05vdjdaYUVHeTJCTzdEcmQrMStxZ1lVQTJIZ1lDVlJvNHZGTGQ5OFEzZlh3?=
 =?utf-8?B?TWFsWnNCTU5vd2N4YThKU1JoWFpnWjdwYTNZS1ljMGRMZStyVmY0YUFHNTRy?=
 =?utf-8?B?bmtDdnU3ZTlRRktoYTMxd1FVNVZTK2RvblNFTkxyS3R6TDRtYkNvQ0cwaTc0?=
 =?utf-8?B?N0dNaDd5UloxZ20yODZSY2YyVHlScnc1cUVZaTIxdnZnS2FmQ3VrWEdleHh2?=
 =?utf-8?B?WVQzNVVPY241aE9qRE1KdEg3czFHTEk3VHNHWWova2ZPUi9pS2lLcHNZSTg5?=
 =?utf-8?B?OHNwQyt1ZCtkWDhjNzd5cVFJOXhKbFl0TG4zeVVXUWpIdnU3MTR5WXEzZmFQ?=
 =?utf-8?B?VVhxd2dQUmhEL0tYdkVBaEpKSGRhZGcySWJJS2dVRmVuTWdveVVhdHNBZnNH?=
 =?utf-8?B?Y1drOHFXeFd1bUNaS2J6MzdPWTc1WUJlSjdFekNMZ045QVdON3kwUW95eXhi?=
 =?utf-8?B?UlhXMUpsR0xyeWVrSGhxdVc1WENaRUpTMVRGTk43SXdXWjdRbTgwZy80cWwx?=
 =?utf-8?B?RmRtNkkwd2x3SE53U2I2NkkwMDh2R2VXcDFnTTlSamx6WEg0UGtqbVZPY0tx?=
 =?utf-8?B?SWpHRXVBYzZXRnQ0dXpVMzc4SGt2NTdZbjhmRHdaSVZtOUV2ZmZyQmtZMEhy?=
 =?utf-8?B?aEQyVXlXaEVqclZVVStlTnZub05zVEZBUUVsa0prcWt3aGxmU2FnbUcvait1?=
 =?utf-8?B?REV6cEkvODBac2VDaXppeE83Q1VycStZUjgrQzZpT21EZjNZSWt0bXJiQjlh?=
 =?utf-8?B?S2swQkRkb2dzdTBkL3c2VlRxRURyUHQ3MzdVQS9sblJTOHZnQ0lMc1lqOUhz?=
 =?utf-8?B?dWdrZGJRTGREZUlUcC82c3J3cWlVeU9CNGQ1OGVFRkdiWkxmUXUrdXZ5OFRS?=
 =?utf-8?B?NXp4bVhVNVVhUEtBRjJQZDRJbVZiMVRqNW1Zc3Fqa2JhdmdyU3h6bXdWM2or?=
 =?utf-8?B?c29JZXZqMmJ0QjVDOHFsYkV0VDAwcE9UMlFkYkREaTZlMGtNZ1NGcWRWeXlX?=
 =?utf-8?B?TUlLNUlGbkpCSVhxazB3c0N5ODcyK2p1RFErNVdCNmV4Um5lR0loNlZhcjhJ?=
 =?utf-8?B?YmtDbnMvZW5UaFgxRmM4ZUZDTTJPdGRYUkdkenNFZTVNOGY2U0hyVU5rQmVy?=
 =?utf-8?B?UFZaQnlZMHdJT1k1bmJvaWhVYUc5RXFCRndhNkFXUUpjYjRYdVdRU2UwbFVa?=
 =?utf-8?B?Y24vRGsrbmFsbkZpZEtYaldUNXBLTldEd0ZYaVM2Z0s3alJNTGtYbW5vOWcy?=
 =?utf-8?B?VE1aWjNzRXV2TDVzd041S0dhUWdQcGNYWHd1RjNIZkw2MzNYS0I4THdlTVNF?=
 =?utf-8?B?dTFTNUpqaXIzK280Q1pPRituYlNGOGJKS0xyQndYSk1jSVQzd3NYbXA3MFJu?=
 =?utf-8?Q?VDuxj+gvlO02K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccbbcbe-355a-4fe1-a79c-08d960af2f97
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:12:58.4756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brDVVkJy+3Njc9I3ALzn3Y3SGusjCi2OOFnrSJSbTO3LD2ep9M3MeQINyxeFR10n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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



Am 16.08.21 um 08:20 schrieb Huang Rui:
> On Sat, Aug 14, 2021 at 12:50:14AM +0800, Dan Moulding wrote:
>> Just a friendly reminder that this fix for a regression needs
>> review. It should be a quick review.
>>
>> It would probably be good to ensure this gets in before the final 5.14
>> release, otherwise this is going to be a very visible regression for
>> anyone that uses DRM and does not use debugfs.
>>
> Just took a look at your patch, it's ok for me. Alex/Christian, could you
> help to apply this fix if you have no concern?

Sorry for the delay, just came back from vacation today.

Patch is pushed to drm-misc-fixes and will hopefully still get into 5.14.

Thanks,
Christian.

>
> Best Regards,
> Ray

