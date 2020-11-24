Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A842C2829
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 14:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6226E43C;
	Tue, 24 Nov 2020 13:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CC56E43C;
 Tue, 24 Nov 2020 13:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ2JLmyJUumT3dVWRf0yEFhiKOjPbcgJGbhyUBbP/+omfaFoINGa/OqdC75JBz4sPRNH6Fxctwn66XzW2TN2OqCam0SacQ3pScagoTGQTR6dVOSWJ6/bnGJEqJ7960nJY38vqvZU6s/sPNy3bB55kUyRmYXBazn2qG2Q/Lf5gUaq/aEzLVHsvz5vruT4uYWr4hLZ5APpAMSLL0WCrpTckwSaTknzjydBVG4pIWnIaHF+bPgbr3tASz3UtuRfDoax3VJk6TgVaTXkNr93eT2rd5Hu48J7xKjeFbUQxipZSYqIH3DPA3WltFNThVkGEEiyXPFZ8659cVnxoaWr5g69bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHnIKvKNlaRq4BGhdhsObMaHHmWtoD/cSLNFUfNBIF0=;
 b=WBvZKaIrXPpUwAzDLtLDWILlirghVPaOeUThkDUK5VJt0eFJpYjBnlifpZ87Y+3CayhQaDzb7j/pSFwqiFN/xYi5+Je247bSI6rmcERoftrPWfBYeFAE+wobhpUjqpCyUO6HTH+X2MMC5EDDOQZjy+fKP56nJipnileGw3V9/IcllyNUZ6K44WwqvQ6bBVfH3GVK2rM15kI+my7AVXDNXZoLLUmL565DURdd+uTibADT7QGf5EwEw+FmmfumcGOpWnn5d7zqNjR4Ozp5/4LOapT8uCqRb6AxWqmtZV3RIIa1yvjaCLQtJPhuJ9sF+qLbGs6HzISqsSzOQF/ycthKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHnIKvKNlaRq4BGhdhsObMaHHmWtoD/cSLNFUfNBIF0=;
 b=oBHEaZLfnQknXkcjyM/shVfvv8LLEKA/DtdBubXGK97azVNFW43lxk8bAkoKMslil0Mkr0CnkxWNDkB65TZG2xx4cf+xAbBWYHpQWuQaEAZI3+k8L4WuBqtufsXhBEOuYiZ4QjJStxvUxs+VNhg2N5UlHxEcdVeKskwlrN59N7o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4536.namprd12.prod.outlook.com (2603:10b6:208:263::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 13:36:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 13:36:52 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
Date: Tue, 24 Nov 2020 14:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 13:36:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f26870f-042a-4a22-dcd0-08d8907e00a9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4536AAE06B974BC29C9ADF6783FB0@MN2PR12MB4536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zG5AK108hDxIvaXTe5sj+cI6UgJWU69KSnswZ07OzUD1ZNuM0BiAsagOVj73pIplwBYJkuctan6SC1wxfXAO/lGr9Sv6/KDtwe7WNegO/EBwZabK6AMP4MZ1rMlT22KHMfWu8AM+ZhoTxWnl4rVTr110g6olDMtjRLTOMRoNZEVRGhVIkRqdRkb3sA1h/QoQBomvM1yf3UlagK+D+j2cCxEM7+5zkwTe2MWMw9QMB96DWzxdynke5p1sQ3fvAAIrzhnTkLPqhbbYBs3i63KoIOGAgh4gFiNwgJxxIxX9VwSIF0mL84oFZdUYov5JSgbMAc5I4BcQlLXQkfWxSVa7ySLr8IGNtT5nG/sIDpERbbl6Tzignd7tJXif/R18WQ8o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(8676002)(2906002)(5660300002)(478600001)(66556008)(31686004)(66476007)(6666004)(2616005)(66946007)(316002)(83380400001)(8936002)(86362001)(4326008)(52116002)(36756003)(16526019)(186003)(31696002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzJyU1N3Mm5DWlpqYkhuaWp4VjZaNkZ6Slppa05TSm9BbG9kY0swdGpPWGtl?=
 =?utf-8?B?VlZDZXA5T2o2QjBOK1BIWndMZEhpSkxQVXljeFBtTExvZVhOWHVUTkJ6by9l?=
 =?utf-8?B?TnJtUVJrUFpCREVxMkVwaklmMkVDS2I3T1BkeCtqZy80V1BPZWljUHRpdTVj?=
 =?utf-8?B?N25iVU54Ym0xMjR2ZThsbW9pMUt1MFJrMWs5dmRPUFBQYUN5ajVDYWlSU2NY?=
 =?utf-8?B?ZEYwL29tM3hheXh1WU5QZ3lqS2paNFNjVHFyM1BXRDhYdGRaNXM5SXpkU2Rs?=
 =?utf-8?B?Ris1TFJkQndlWGZWVFh1dTNlTnlJZVlDUlo5bzEwbFdINDduVTFHUlVpUUsv?=
 =?utf-8?B?WHpHaHhEUE5pWGI3KzVKR2VORXdQM1NlUmZRaC9qUWtpUzZhSk1zblVyeVpF?=
 =?utf-8?B?bFdLMndidDNuV0dHNzFkMWwrZWJOdHFIU0ZyUnBGcXBXVXFCTlFHZVFwcUZn?=
 =?utf-8?B?UnlhaTNaRENPQ1JzU3p0eDU2SHVpcVRwandwYWNlUFhyeWpPNG83THY1R1h1?=
 =?utf-8?B?dnZtWTRGZzlDeGoyQlVlRDRxVlQwWitaVkMycE12THNGMVhGWVl6eFFaRWJN?=
 =?utf-8?B?TDN2UG8wZzhiZGZZbWFPNWcyVVdrcVJSR2F1ZHlvQWpaaDZQQmdKQmpMQzdI?=
 =?utf-8?B?QmxUR2hWTmFxNWVkeUo4WmpxRWJSaCtYZk0vSXQ4bHVvamsva00yeTU0cGJG?=
 =?utf-8?B?QURCdXdTTm1pazJKcmZnZCthOS9QMjRiT04xU0dFUXVSUVYzejBUUGR5RS9I?=
 =?utf-8?B?Q21zVGgwbEZ1b1l1Yzh5aXJNUC9sTFo0bFRnMEowSjVRMXRpc3VIQkNKcjln?=
 =?utf-8?B?N1ZCczR5VE5aMmZUVzlIWitienFkcjlUdjlyc003OFNwZXFDNHR6eW02eUw4?=
 =?utf-8?B?UytOSmN1RTB3UHdtZ1NFeUNXUEc2UmNaWEp2bVVoZHpubE5NM2VDL1lvdVE3?=
 =?utf-8?B?cGoraGdTbWNYSEZSMG01Rm5sRHFaaGtiZTBZOHQ4TnVIS1ZtK21FZjNoeERi?=
 =?utf-8?B?MXloRkJvVUlSN0ZzQjFtVVVvRnZRZXdVTXdzZTRXYk41VDRyd0tGdWtXRE90?=
 =?utf-8?B?bkJnRUUrY3ZQTXNBaVBDcWlvNHJpQWdqaVF1QURNN1QzZkMzVU9ZQUtsM2NI?=
 =?utf-8?B?dlFRTHNqSTRGNkIxeTIveDRGcVdtaTB5UW9Rb0NSOERieVRIcjgwVXVaWHI1?=
 =?utf-8?B?MHNjblAxTFhHdWZaZVlWT2ZDQ2xWait2MjZFYkV5eFUxc3hxSWxFNlg2SVJY?=
 =?utf-8?B?RUFCZmRwanlRbjdBVzZTaTBXaENqNTg1L1ZvdWhaQkF2OGpKTWNMN0M5eGNM?=
 =?utf-8?B?bjFXekFRMjA1VHgvVjI1V2tpZjdNL3JLVnJiU3REcTViZUh3S3ZKN0s1eVlr?=
 =?utf-8?B?UHJqT1NOSmRNZmdmOFZMSmtQQkg1NVplekVXTy84L2cwNTgvSnhkS2w3Q3VJ?=
 =?utf-8?Q?PpuuYetj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f26870f-042a-4a22-dcd0-08d8907e00a9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 13:36:52.6345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ1ijvhgUSs0Y8GyroE9a/n1zu0KDnPNktNZXc1GKMK4wvrxJxE+W0Jzd4ZtcqMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4536
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.11.20 um 13:15 schrieb Thomas Zimmermann:
> [SNIP]
>>>>> First I wanted to put this into drm_gem_ttm_vmap/vunmap(), but 
>>>>> then wondered why ttm_bo_vmap() doe not acquire the lock 
>>>>> internally? I'd expect that vmap/vunmap are close together and do 
>>>>> not overlap for the same BO. 
>>>>
>>>> We have use cases like the following during command submission:
>>>>
>>>> 1. lock
>>>> 2. map
>>>> 3. copy parts of the BO content somewhere else or patch it with 
>>>> additional information
>>>> 4. unmap
>>>> 5. submit BO to the hardware
>>>> 6. add hardware fence to the BO to make sure it doesn't move
>>>> 7. unlock
>>>>
>>>> That use case won't be possible with vmap/vunmap if we move the 
>>>> lock/unlock into it and I hope to replace the kmap/kunmap functions 
>>>> with them in the near term.
>>>>
>>>>> Otherwise, acquiring the reservation lock would require another 
>>>>> ref-counting variable or per-driver code.
>>>>
>>>> Hui, why that? Just put this into drm_gem_ttm_vmap/vunmap() helper 
>>>> as you initially planned.
>>>
>>> Given your example above, step one would acquire the lock, and step 
>>> two would also acquire the lock as part of the vmap implementation. 
>>> Wouldn't this fail (At least during unmap or unlock steps) ?
>>
>> Oh, so you want to nest them? No, that is a rather bad no-go.
>
> I don't want to nest/overlap them. My question was whether that would 
> be required. Apparently not.
>
> While the console's BO is being set for scanout, it's protected from 
> movement via the pin/unpin implementation, right?

Yes, correct.

> The driver does not acquire the resv lock for longer periods. I'm 
> asking because this would prevent any console-buffer updates while the 
> console is being displayed.

Correct as well, we only hold the lock for things like command 
submission, pinning, unpinning etc etc....

>
>>
>> You need to make sure that the lock is only taken from the FB path 
>> which wants to vmap the object.
>>
>> Why don't you lock the GEM object from the caller in the generic FB 
>> implementation?
>
> With the current blitter code, it breaks abstraction. if vmap/vunmap 
> hold the lock implicitly, things would be easier.

Do you have a link to the code?

Please note that the reservation lock you need to take here is part of 
the GEM object.

Usually we design things in the way that the code needs to take a lock 
which protects an object, then do some operations with the object and 
then release the lock again.

Having in the lock inside the operation can be done as well, but 
returning with it is kind of unusual design.

> Sorry for the noob questions. I'm still trying to understand the 
> implications of acquiring these locks.

Well this is the reservation lock of the GEM object we are talking about 
here. We need to take that for a couple of different operations, 
vmap/vunmap doesn't sound like a special case to me.

Regards,
Christian.

>
> Best regards
> Thomas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
