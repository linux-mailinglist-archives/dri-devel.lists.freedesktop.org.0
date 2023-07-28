Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC47665B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992D110E677;
	Fri, 28 Jul 2023 07:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DDB10E677
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWAJuP8qDZ1URwz1NAJpR8lp1Z8en/Fhq/f4otsTVxj2wKlcEg2DseGOf3E3KvPjZvnAjdb5o7m3kizzY+CoZ/wgOeHBLSiX/ydc2ziA98HdnMnNGQdjYHgK6lwlm7uhpw+vwI2HjJ9XmqQ2/9GR1BFrcGhiJN2KDVpLhO80Dtmf1MKF5US3z54rIksAEGjbQnZV3wK1F4zyMTf3BZvMgtzKCczBUtdyfyNN44geXUvFeH1hT6jexS/Qqj58Bl3dUMDjFZxOV7ZO9cw/R4U1ZD9Po9C050DRguQTmIJy3XepZ+H7OBHdkNnEq94Akj/h/LKrnl5jH3jjSxJEZtOLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUtRkU2qSJu3pyoknVwthFs/x9px43gzIplaqesgUWE=;
 b=E9l04td+0PhSRf0xR/KbcWJU1XoWMcDhjhTjJyWtRCtmlcmgagItQSOp6eTTQ1N7Z0WrfAXUYHhBX1fDsGiGt68mEY/mM6FVXgjHOkjck9jePNFSD5gbRhYlr6q2/gYrwR8abev77qWV8XXxMu0Q1NYLNAEMzq5kraY904QxrOXwa0/C4XjJmDPJddJkf5Dqrhr+AFrAgAou4LDPohi4qo6iAtxHrhHCXlOFpyEaTQQ1PRagxp6NTQ0/09vcaSQzZ1wk2uoAYIoOlZWvEDkfiP0+Or7K7KTvXXUgJ+vi63T9fd1m/aEBE0XRu6418u258mdSARulWe+QNBGDdRjm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUtRkU2qSJu3pyoknVwthFs/x9px43gzIplaqesgUWE=;
 b=PVAVWr2crAL7KjMiKafhs1ffMRS7xUYYkghrovcihSx0Brvx8OyUbCa91SdjwpVqIx/OREo2owDByHG3wDPaMWcWq7DceluRBRbSLWeLDoO+G32OI/ZCV6YrMQ5d/nByZa+5YCPUlUPOCeWtJbbRt/RUMcLT1hBVV+G+vYvx8IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:48:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:48:37 +0000
Message-ID: <43bbd12b-4754-92d1-4000-1ba928d2a8d4@amd.com>
Date: Fri, 28 Jul 2023 09:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, alyssa@rosenzweig.io,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b72c003-ce33-4dae-c304-08db8f3f0cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvasP7egU9mH/wCNSwzBUPmTiIfccNEtCtPnt2h+1D9wrk3iWHk9u8+htqzSEcqMfhsnv0PgeKimM7BIEwTtN5b/F1W44L3venjzgnULcbmkajoeLS6krySHWDoa4OhMU10vwW0wgXc7TFRhZcXpfYZ3X9hCPgrXwL5clfwyQ78NoDSsqLz5/3yE+f8U758VhZulVWAeCUpnSW/Hi5y4rDIzSdkVXW6jCnepuV1tf4pFZWytjiH7RhwXSPmOV6nLMgIkArxzo30F8h3sZsarpj8N9NEDH0gu+RJ1RbLVALkZqsKBsHU3jiudp/cX+aa3/MlJbi6OXrKvudfUs99WoRdT5FoCBNYFo3gK2X5sIjZ8H6LKA2Lfx38TxKDs8oow/Jyl8/wfU2oEwDZt6AvNdjvr4q15sf4X1xWaiv0XouhdUHAG1RMn90yF8BemVuvJTqc1S09h/mSUTvKofP5UwmYOMNb1fLHfOP19yq0kTkRYn6B+Vxp2yMBlK/nXzmjW50nloVvRve/cyQJZCUukkZiApPmpdAanVCEbP5Y5pSvdHyOvrG41f8/ldMLjmkwBAMb4R98K5/dnqYfU3K9yjI0FKe8lyMbJybqKUr7EEGM1ve//PEfUSr2gF0Cc4bCR0nPjKLm65+mi3qxrLcz2eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(2906002)(316002)(8936002)(8676002)(7416002)(5660300002)(4744005)(41300700001)(36756003)(86362001)(31696002)(6512007)(6486002)(6666004)(478600001)(6506007)(186003)(110136005)(2616005)(66946007)(31686004)(38100700002)(66556008)(4326008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cExDWitDTTN6Q0Rmc2Z2SkUyVU92bTVDSVhLZDVQc3VycVB3VW50cm1zbDlq?=
 =?utf-8?B?ajJBMFZVUXdtVm8wU1FON1MwRWlpMHpUTFBDNTNGODlDVE4yc21sNmpXTWNB?=
 =?utf-8?B?bGlrRjNuOC80U0tuV2dUbDhSWWQ0d29jTVJJRnArbStyUjZpeUU1Sk85bGky?=
 =?utf-8?B?WjlHQzUyWnZ4ay9lNzZZb1BJMDhydGxJSlBlVm1Ka2pMMXRSa2k4Nm1ITVZs?=
 =?utf-8?B?aUFwZ2tpVEFpNWpZOG1BWmpOSUxPOExpTFhWK0Y2NjkvZEQzZ3lRbXNvRDky?=
 =?utf-8?B?TUJPaWhGK2l6VG85VXhwT250djNMcDNvbFdYei9QTXQ5OExlZzFKdDRXS0xu?=
 =?utf-8?B?Ym04SDIxVzNBUHZsS2dEczlZWGZlSllHMktWOFRPQktUbFBTTHlQd29lTDhz?=
 =?utf-8?B?dDdna1gyZ1NRZ29MSm9VWlBCZ3A4Uk1EajZtQXpKU0tMOFlzS09OT0xCZmNU?=
 =?utf-8?B?MVVuYmJSR2ZWS3NKNnp6VnNWeXljUGNKZXBOMEo2MWFEQnVCMUtFLzdiTE81?=
 =?utf-8?B?dTNmcU5OY0F5d3dsRzhwb0tHbWVMV0xybXhCd3ViMWJLeVc0YTZBZUd2a21m?=
 =?utf-8?B?VkFEdnRlUGJwNGxCU2s5SCtwY3F5M1ZLdFJ4TExOR0xMU05OdkwwaWc3bVQy?=
 =?utf-8?B?WkM0bVRITEhoUjN5R3pNYVZ5K3FEMk1SbzZGK3hldmNFY2ZWSW5oNWR1OU1a?=
 =?utf-8?B?eVhXMlBIZnZKL1FkVU9nNjFGM1pvR1ZxUVdKVFV6K0l0TEFKSmtBK3RTYXRB?=
 =?utf-8?B?V0VraTlxUmh4Y2Vxd0k0Qm5qZkNVZGIxRTcrS3VFODh3ZkJIcHFQSmNDeVo4?=
 =?utf-8?B?MVdDaWliU2h2Z2N3cnRlekszeGQ3K0NKeUV1U2xKalJoOVRwVVBFMERqckJF?=
 =?utf-8?B?S01lU3dLbnZYOUpocnZjUFZjdWNZaUNYTlhaL0dmQXdqcVVhNVJjcTVKV0Rm?=
 =?utf-8?B?OTNBSk96N3dtWHc5ZlBkNjR5ZlhxVk4vdEk2MzF6b25WNXNNT3NtN0ZwZm4v?=
 =?utf-8?B?c1pGTXVIU2hTcFBTaUtnU2hkZ1lVUXlKS3FkbDBONW43dnFIZUhCOW9nS2Fk?=
 =?utf-8?B?TC8zdVBtQUVsdHlXMzFudkxyd1I0TEZBb1FEc0k2d0U0YkZMcGZncTZPK3J4?=
 =?utf-8?B?bGNkU0wvOGlLcDZyNzJldk50L25lWlNvSUhHSGQyMEtieHhiUFF2Skh5UXIx?=
 =?utf-8?B?c1VHVUd2ZHkzTjhxQXl0eHB6aDdacVExb1hZaEYxYTlRQWRjMG5tV0VYUTlU?=
 =?utf-8?B?R2JCZDZFOEtxbEZkeEtrMzFGSlNtSjRtdXQrWG8zNk8xNVdpTmpnMmh6d1Nw?=
 =?utf-8?B?bUg4ZjJZMWpDNytkakxDNXpaUmp3Y1FNam82MTd1N1BoYmFuZno0M0lZYXJw?=
 =?utf-8?B?M04vUmp2Z2ppNHo1OVhXT0VTR3kvMkJPemlBZk90ZUJXWDVEK0Y3dUxKRkdG?=
 =?utf-8?B?QmdFcm83b0NoMWxRc3BWdHM3MHJLS09hVCtLZWhLQ0syVmFlR05rQS9sWkhi?=
 =?utf-8?B?dkhxQmk4TUdqY0paZ2k4ZGU3ZDg3RTQ0cnh5WTExQk1UMnFvaHRxSVFwZkkr?=
 =?utf-8?B?bndSV0Jpc3RjWHVNMERob0QwTy9iQ09nc0lBMHFqbE9Cc3FJaHJnNTB1eTJS?=
 =?utf-8?B?MUNidjZhUEtTMmRiL0VTa0grRkxRdlcwdHJZcGFMTWlXemZBdkE0anEvblJk?=
 =?utf-8?B?UFNLYVRGZWVzd0tpcCtOdkZhVWZWZWtWdWs3SzNYd3NiZ0JpNXBUUmErR0RY?=
 =?utf-8?B?cTRwYVBiSGVmZmdpQ3MxQ2dxWEdtUXQrL1hEZ2Y5TDBpTzhOL1BoYWJ2R3ZX?=
 =?utf-8?B?ZkpYQkZOVFFMTVZ3bUNXdktFemtwQ2ZFMm96Q1cvU1h2bGcvNTg4NXllQVQ1?=
 =?utf-8?B?VTd0aDFzZEJWTjJlZzY2UEVrSkYrMVNaVFVUSXRhbUtyWlNCT2IwOWFWYXgx?=
 =?utf-8?B?cnVXS3N2MkJucUU3cVUzMHZLNGlTdUdMajJTQmF4YXU5U1NDQ2ExOHdwN0R5?=
 =?utf-8?B?djdib1lEdDVwRThreE0wV2txRnFhMlZMcjRBVUlRMUcwdUl2TUlRRGNBYkp4?=
 =?utf-8?B?TW1ITmtVOUs1MU5QVjlBUlZiRm9rWU9rVHdsQnBzZW5sQ0w4alhnWmNJdGFS?=
 =?utf-8?B?NFQwS0hIMEJwV0tCZHVFRkhRUENpS2s3SExFTUkrMk0xWU9hREppalRBR3Fm?=
 =?utf-8?Q?4qRhexDC1i7ZMBGtqDtLZZ84o/dC32xmpw1EWn2YGJWE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b72c003-ce33-4dae-c304-08db8f3f0cdb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 07:48:36.7282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEG6lPIx0Kb59e+dn1Jr6z24CZHg6fpPchrFtKLR9/kJjjYba5cjBdoAVUxLeQbd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.07.23 um 04:35 schrieb Asahi Lina:
> On 18/07/2023 00.55, Christian König wrote:
>> [SNIP]
>
> I give up. You are ignoring everything we say, and rejecting 
> everything we suggest. We've already explained why drm_sched doesn't 
> work for us. I'm tired of repeating the same explanation over and over 
> again only to be ignored and told I'm wrong.

I'm not telling you that you are wrong in any way. What I'm pointing out 
is that your solution won't work upstream and you need to take a step 
back and think about why this won't work.

>
> I'll start working on a new, much simpler Rust-native scheduler based 
> on the workqueue Rust abstractions which are in review.

Please note that when you are implementing a dma_fence interface you 
also need my acknowledgement to get this upstream.

Additional to that Dave and Daniel might have objections to this as well.

Regards,
Christian.

>
> ~~ Lina
>

