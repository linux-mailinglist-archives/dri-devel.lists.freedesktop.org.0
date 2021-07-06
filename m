Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA883BDA18
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522196E4F8;
	Tue,  6 Jul 2021 15:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA666E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 15:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcUbU0fF6iV0jCHvF4Oq9NryKNTd3mKLkPoOCAALLg2dAFhDRmzZpuZ/fv7AWZIKCgElpTmH75asW/MurHnMo6f8wsLUtSkgOlgdEc+KLiC3aS5C/ELH2C9J2TlIDESxzoReBxyE+Z53tuqvTuuTFddsGDaFTZPNA+O5nzQD3bG+Fbk3wrQ7aq+9ABl+Z0SQKHd9wgsvIcld8gYAnGnGdloaJJtVymtYGrGmz0grU4DkbJgn4Nrn2Q3ArfltdbPUVS1h5RZczetke43udXEAAN4jwvbmPvCAt5OsPJuY+UIJMpU1N7qA++knTuGVf+a1DXB71Mj28t66ZJgSsl1rRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JfvcJAiEra6wcoTiJNGNAiCkuY7F4bwLe39nBLg2dk=;
 b=CW3/okyXmuERz54cY5doIEUpjd35/0s+Fiqh7TM/ieLIN+lYo1EFXAPj7BLGDVuHa2hPrGcS5euo45nw7N/IxywIS1q6iC7DuYGxKIZWvF+H7CEHHuRp65H6vwpnk/z9RltYUX7gECbEvg+iXDJvd9kqRbhXkz9pZX7yRmJK5V6Tc91WKNcn0KBANCvt2scqNW4twFNdmOi6f/jmeXInHu8RMKZ2RkFdf567y4NpFoX5636GpFr/Ciqvke6WVq0h/A3QD+m9q4yEyir4ea344qP6yBE9M68oD0mtxdhXvIvgsZmCdAbfhcWWUteFgtA18VwgIpecfUg4xznz20k+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JfvcJAiEra6wcoTiJNGNAiCkuY7F4bwLe39nBLg2dk=;
 b=bAQLTVThkcfL7+Bz2jRpt5NyQO2eEZST/kFdtbRawAdjdRdlP7Tpy/+YrJHNGrh0E/UkJejXjSlSY3U3rfNVJfSUi/3kpdAdQUxAqiB9dzoOEeEIoQvy6jRUAjH5XIrNdp5hBYQACntByNk7+rPXPt0EM4nvT2jL64XseIwu7+c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6496.namprd05.prod.outlook.com (2603:10b6:208:da::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.17; Tue, 6 Jul
 2021 15:23:34 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::f55f:1a1e:7d62:8c8c%5]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 15:23:34 +0000
Subject: Re: [PATCH] drm/vmwgfx: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-graphics-maintainer@vmware.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210706072253.6844-1-tzimmermann@suse.de>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <03713285-6e55-0a2c-0123-cdb8b796bf22@vmware.com>
Date: Tue, 6 Jul 2021 11:23:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706072253.6844-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN7PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:408:20::26) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BN7PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:20::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 15:23:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b3610e-b708-4773-2ff6-08d940920487
X-MS-TrafficTypeDiagnostic: MN2PR05MB6496:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB649670B731D0CA387EE49908CE1B9@MN2PR05MB6496.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smG0l89tK5LsFzk9UK5/t2u97o7vuxxlgqlqUin11XevUMFrMXqkgI3dDOQavLLIBfkw0c/9lIVM6Vir9ZOQ9yIr3lzxShI8uEiMwHYeKT8biOYxkeN7pFc504ikSh+0KFSm0JUSMSLD1/DJb7xilI3LliCc/xa1D60kquWz42+gKKDJjBSaCiWX4IyCoSWVtSVq3xgfLHNcv6Z3I/5RvD0Nhuz9ji4HOsA+xnLSupMGgwQ7MMONIqGIc0PXWehMDpRD8j/xKzBoE1GetQQXs3jhZjJi9bzaVrbCgInwHiEbl2jHGVfzHUK/LN1mz7ZcUyOP0ANtlalKWcnAPaNqsM+MQBqQWeNuSWjMzOQP6Ynmu4pzHxAOrGBKen7KfTQ43m2YeTf2ptIkh9Kf4mQ6umHx7EK0wFHajofkAVGTkvTav3ELmnPNDu95IUSpn+TPhrIVJtoydnu5jNgHrEaXpnKDjPyERfsQarPblU0/bURQqEyA3f8/uQdqiG8rtWKaDV3pHxn1755JbQ4NrojEVwp3XXB1wIBfguNtN+mGyG92WDNL0Hlvesq55Amz+Rg09AgRI/5XmuyMVmOySuFcwjtG6hHqSsoU5qRGTIpXTEWoAraHKw49WM7htVttkBmb+L2zedDcVtWj+39XdmzqiijO42aEJVlBCqG7UXK/OXyLLuPR6kosayAcZIHZUp8j5fConTSmWm4MURFDA71R4MgVFpT0Fv8qdGWruB/iatA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(5660300002)(2616005)(6486002)(86362001)(31696002)(186003)(4326008)(66556008)(2906002)(66476007)(66946007)(53546011)(26005)(38100700002)(956004)(478600001)(8676002)(316002)(31686004)(36756003)(8936002)(16576012)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1BEbVlONVkzWXMzTFFIL3NYYVJVMis5ZVFkbUpiMzQ1bUtKNThHUmphM2ps?=
 =?utf-8?B?ZmxHaGNnZ3VaWkZjWDQydHlpd2J4b3dac20zTFVYeGh4T0JwQXJ5SGFsRkNx?=
 =?utf-8?B?SDR4czBGdWJtU2RIeE9TSDRxM2N5dGNFcGlTd0tHS0ZaNGEwUjI1SDlSU1JD?=
 =?utf-8?B?RUFwbzhGdWNEaW12Wms4WlYyOXEvNzZOeFo5amJ3SDB4RnRJOG9BQ2E5UmxD?=
 =?utf-8?B?VENDcEczMW5tVHpySjRzMEFSWVArMUFpUEk3QWgwWm5zbkF2Z2FRcmlGY010?=
 =?utf-8?B?aXdZM0loWXlsQ0VHazdxU3R0VUl2cXV0QzlsOE9Cd2Y2NW1DMkErR0RmeVRU?=
 =?utf-8?B?eXV4bGQ2ZnFOaGUwakFYNTUzZnNCbXowdDl3alpYcnl0QUtYblBRS3FOZGN6?=
 =?utf-8?B?Y0swOVJ3NUdkYS8ydGFnMUxXMmxRSG16SlVqUVExWHdDbThIcTN2UUVTRmds?=
 =?utf-8?B?Z0h2KzhPLzBaK3JTV2N5VXh0VW5HbFdKelM5M1N2ZXdDTmlrTDI4TmJ3MUdu?=
 =?utf-8?B?VG85MDNDaE42cER0YzdiNTJLVjgzR3BDeEZUcjVlRDMwbDBzL0hXM09xYjcv?=
 =?utf-8?B?QXFiUnF3bTJDaG1PQ0F5cXlzdHFXSU4wUnl3a0E1dzBWbktadDlTY1d2a043?=
 =?utf-8?B?SUlOTE5nWDFRMTZMVUxDKzlYZGZkZENVTEV1SFVtM2o0b2ozbGV5WmM2SElC?=
 =?utf-8?B?SXgwRlp3N1lzZlI0MTJaU1NXYyt0cHBmeFYxaWNPckVXTFFReElQNlMzeWhH?=
 =?utf-8?B?MjgxMnFOalFEU1h1b0pTellLbHRSRm1WNnRoYTdSZFNJU2RMbnFubTBwT0gy?=
 =?utf-8?B?U094bHVLVjlJMWRjaGh5bmQrRHg0ZCtIcjg0MDFiUnl1MHE5ZCtPNk1QNGNS?=
 =?utf-8?B?ZkFJSW1Ia2prd2g3UnNzNkNIL2ZCcm4yRWdCVjdzOTJ0M2FwNldvdnlJbGdr?=
 =?utf-8?B?cUo0b0NBVUJka1pGbkNWaEh4V3RYUVhKN1k1Qkt1cWo4OHNsWTU3dTd5UXBp?=
 =?utf-8?B?ZndFd3hQVlhRTnlNZWYzaW8vdDJrM2syTzVMSHN3bExJbWNleVFXT3E1VlRm?=
 =?utf-8?B?WE52NXRmSk91ejhReDNENTN5cjlSZ25SVFoxVDlGV2dNZE93ZmNGRUFqeDN3?=
 =?utf-8?B?cG1kUDZZQ1hRdURJdzhkWEpLc2lJMEZrblVuVVpZeFVBSTN6QWMybVVaTGRJ?=
 =?utf-8?B?QTNIS3Q0RWRZZEVFOVc5WEdrVWdrc21vNjZkZmFybS9SMitXMEVVS0NLVytI?=
 =?utf-8?B?RWpmY0NsaFF4WGJXZi9hUXVSdHBTem10ZDRML0lXU1plS1Rpc05sLzFKa3BX?=
 =?utf-8?B?RTVkN1VqNnU1eHBTb21sL0k0RDBXNk5FSDdxZjc5WjQyMXA5bjNOM09jMmo3?=
 =?utf-8?B?VmdLL0MzNXNMemVQVlh5eXEyVFRIeTkrTG5tUGRpenZmVkU4UmZwYTRKYWJh?=
 =?utf-8?B?dFhWV3FBUU5RL3hjdzBMcmlWNW00aDFCL0hxaTJiRXp3NXkvdHNnYnFkYzNW?=
 =?utf-8?B?MnhUMWZNS3U4dHZYb29sTlJYblgwcTFMazUxWnJRUm83RWJnaUpVUXNHSlN2?=
 =?utf-8?B?QTdHWGdpZEdoWm9HNHNNZXFqN1p3Ty9oVEVaaUV6M0hmeHlaWHE5VjZQYUtW?=
 =?utf-8?B?RlUxUWpCVkpESVRrQ0RxSStmdDNkeTJQTEsrUWQwTUFzcjhFdmMvdUNSRi84?=
 =?utf-8?B?Rjl4ZHlRcElUcFBmSzNpNFBaRmtMcjExc2doY21OdEpvWmYvc3NhRkJoWTlt?=
 =?utf-8?Q?V+N6Uj3DE4a9WcHLAd/XbFglsiVyv2kGKteTGjn?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b3610e-b708-4773-2ff6-08d940920487
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:23:33.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZBHFKp8Ns2tWp7OUQu9NuueOrmhU0B1ZZlQzf6fjwSM7MW+jcrVx/RQibb20VOZh12E2drbP26Q6gC0K5kA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6496
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/21 3:22 AM, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Vmwgfx already uses Linux IRQ functions. All that's left to replace
> is the reference to struct drm_device.irq. Use irq value of struct
> pci_dev instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks great. Thank you.

Reviewed-by: Zack Rusin <zackr@vmware.com>
