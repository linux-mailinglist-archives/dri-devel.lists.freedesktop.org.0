Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A145A4D23DD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 23:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEF010E218;
	Tue,  8 Mar 2022 22:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5E10E218;
 Tue,  8 Mar 2022 22:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqM8r6typeKCb38xyRjnjP0PGD6FYyVc8j+R1FbEfHt4ZJ0AjPhybpJRqdZqm1nAeTb397XpHREI7MQUNJpw+df6ueZd7Cu8r6kcOhOC2rJpuSR/ilBeeA4Bty4ecdVBl1Nf532wKNvH46yAlbBcv7roo/AAENAFrMTSXARz2/qCRAjhpFHAZYSpgiBWkfszmItBW7pRpfj7rFSCDEtr+IhduYKQrTjsczlhQgFc+i9+WD/seEHqq2Ui2HOvC0dt/jif6okmd7PKsx+LL7oN4aVxKetQaf65/sxxlTtAb+by47+CoXJzgQ2GcC3iuUKSMKBl9vN9yVUGVyqtSMWuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az+WsThJ1SpnH2Tnmv10Dg0jpZCHcBuRHbVJmahdcu4=;
 b=oFyH1C+ZncQCRCBoa6B7w9S16O7fgY+cWQPuBm8kSBemp0Z05NG6fTBROsfTBODAfOtC/PTzLb1DyK3KNZP2h40zjgWfy42Jd/P3+MNE8nhTVRcfaE+nix/xitb45loJ8OyZp7Wj734DAJ8LqiLp8uAznA4MongKQPuWEqPa6Qe7o6wQEQrZQ9kk/ctnoYXMMNTHEFppsPlNT5dZxuEtsBLZseOJonhg/eDxVSapRCbMtbtdkfKJEaao+85Gj7P9JK0NfHPxIVM8NGrqkY6ltIvnqQWAV1hf4BKnHa3vgY7Y5D7GodDidBWjpGkRh7ZygyiEOhp3Gd8aHqHfuTPeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az+WsThJ1SpnH2Tnmv10Dg0jpZCHcBuRHbVJmahdcu4=;
 b=mNuq5vuxNzgktB++C2GZyO85aMuQgF2koq4YPzG1ZwgWe6cNe1lVm/OAk5zdSwBOK1xn39+P/1fKlKBm+Gwq7pFZBMWh0sYLXhj72Fg+mfZfSIjlur9fHvUqnU9MB/Xj82jsT+yLRQwIdvQtRaGINgVVd8ZTa9hUvLtWJxVsvwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 22:07:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 22:07:09 +0000
Message-ID: <3782c8c3-de17-08d3-7979-93993c877f0d@amd.com>
Date: Tue, 8 Mar 2022 17:07:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/amdgpu: Add support for drm_privacy_screen
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com
References: <20220308205638.1744064-1-sean@poorly.run>
 <f19cddab-1053-39e7-10f2-5a775b452b4e@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f19cddab-1053-39e7-10f2-5a775b452b4e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 820fe59e-4fa2-491f-2a05-08da014ffd2e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB47059205D91F184005B5FF638C099@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwsx+l1KCcGqnbBcuJuWsUd3lMfpwfjgibysPtRTV1DVfcYFDHnms7AV/oZJm7NGkacfB65qkxMXU4HIYI+cSGyqEs+ZzzNSQuFzqW2AaOEld6U8R8NkhwfvQzT2TErqcLRjJytz8unckr8gS7xyWTukz1Tcked2HplTQBEhE1sM0/4dNokM+9ZZPjEyRVopuw7Yq9HZT0ibIu1O8jkj4WBqfwIKaj/bv3u/bRw0s47p4dMVBm70FcTFzBaNXIgbckt5OVoWa2bWsDNzVaJJfrm4hhk3j+ju/9PaTDZfpn506o4JASRMazGYq/3kvcSZPUI2/nY+m3pcer8bFBKg0HPW5g8nfgz9ol5jpSxcGL/oP4mFkRZSHkiAzhqpFDy1Tb0L4B0jaRrvojF3KzemgfAjFI1JaET/zarQfE+FfeouDaRb+QKJChTACzake1edBGY7A5yn3mcY56yhL17wDSBEg5TZxTCWl14JbYV3RUEnY3BfjG73XoKcWjN5jPr46hsQyL9bvSXHMsN95PmslzmqOYVd+T02cXiaTYXX1ucVMY9X+XO49oDBCrsydo3TCCjzlW9++DCOJy48v1Snco2uWwOr6e4jZEcOCH9NNM0RF2txk3YJCzv1T2I60YqN3HD28j0kDYjAGJUq9bPMP5wyAhxUyC5EDjqUE2aW9DXLzQa5fUCtq9EZccFXQywxWUIh514BrMddxQbFNtfZx/hDPu19mX1uAMrSdw2/rNDcLWPugrNtjLXdnYe96D1P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(44832011)(31696002)(8676002)(6486002)(8936002)(5660300002)(6666004)(86362001)(83380400001)(4326008)(508600001)(66556008)(110136005)(2906002)(316002)(2616005)(66476007)(6512007)(38100700002)(186003)(26005)(6506007)(53546011)(36756003)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFQ5NDhZQVVVdjJ2cTRma3FrNkQ2cWVIUFBBSGxLRzl2MnpNeDhmNzR0cUJ1?=
 =?utf-8?B?bUhZc0NuVVJqQ2NsaXRRZ29hTVRnVUJaNHJHYmZtNmV4dVBJcEpVQzZpZ0tj?=
 =?utf-8?B?cWlRV01rRk44S3hGWllEZVAyb2ExdFQ2V2hydG01YUNCdEJIMUs3RE9iV2ZQ?=
 =?utf-8?B?R0dEbzVRblpKc0F1U1lHalMvcXl4VlA0dURPZTU2WGgxeG8xUHRzdGZnYmRJ?=
 =?utf-8?B?WU1OTWZaVFlubDZweFRma0t1QU9paUZmM05FeVU5elBJUjZDbk9KaHo4dkUy?=
 =?utf-8?B?YVFSV1ArVXVWWDRVSUNqZnhCdzRuVUZjbVJOQ2Q2c1d6d3pOdHduVmlXaE5K?=
 =?utf-8?B?R2JRQ2FTZWt5S1JXOHF4eWFtK1BWNmgyUm96S1FCcTM0bU5zaml3dFBZSTNR?=
 =?utf-8?B?SElhZ1l0YkpST0dYV3ZWZ2FQanZDaUdpVDFEb3BManV2dHIwTy9xRVg5Nmdx?=
 =?utf-8?B?MWVZK0xPdE1aS1VWTUxmQ1NlWFhrZlpnb09UbUJLOVhya1pIT3VuUVUyUENm?=
 =?utf-8?B?WmpucTI0M3JhVnIxQVZWVy8wYmtZaTBLemtZN082NXFhbDYzS2cvMThna0Na?=
 =?utf-8?B?VUFhc1RWeWd2Si9ZN2g4NFFRVHFSUlVBMURNUzZyVTJhQ1luZ1FnR25iamV3?=
 =?utf-8?B?dXJza2ZVbHBtalcwMVhYS0ZRSlJFckNpdEQ5RHNiTnBJYzJkUDhhcnVWdGZt?=
 =?utf-8?B?UTZ0SjNBMFJtajJielNQNC9DTkhsbGlkT2hyR3hNV0tNQUNhMUF1ME9iZEM1?=
 =?utf-8?B?VmVKZ24yczlOSGhiZEI0V1BsTk9DTHQzcDJMUEZ3MDgwbmVNZ3NCNnlXa0s5?=
 =?utf-8?B?eENQWklUcnJQVE05V3R0ZGlMYnl2UGlVeDUxRTBvVTRRNWMwMG5wVlR5ZnY3?=
 =?utf-8?B?akp2MHNGeVFkWnprSjEvTzU1eHJScmJXTjlMMG5VZjR2MWJxSHpuUDloR2J4?=
 =?utf-8?B?b0tKTk1LTXUvcnBNUE5qeFdYS1ZzRTdWN3JlcXdCR2NTNjZUc0dLaHgvckly?=
 =?utf-8?B?RHZTYU5JK3Z6L3VCZ2liTHY2UllkWGZwN1E2M21UblVZdGc3b2xDcUxhbFpF?=
 =?utf-8?B?dGR4RTRjWWhRbThTVXlJZ2xacXJwQldoV3JDeTJmV1VDdXhqRk1vNCsyZ01U?=
 =?utf-8?B?MHJtMFlFSFI5RHhVUkIrbitZY2krL3RUT3VPQ2NPejl6YXRDYTBHUXNST1VJ?=
 =?utf-8?B?UFpEbUh5NnNpSGNIVHV3dU9GcVRGSFdzeTdqV1gvdE0xNFBsOXZMdDBiKyts?=
 =?utf-8?B?RkVGYTQvNlpaOTREZDFZMjRzWlpaaERhN0dlSnN3anh1ZFRHY0tDY0RxUWl4?=
 =?utf-8?B?MXIwck54NGpqTlkyNE9OZUlMTVhweTNDdWw2djloUi9iWlVDUmpZQlBGbkZY?=
 =?utf-8?B?ODFhSXFzTmJWUkFyakIva2FFWHFwbEp3TTZmUmMzNXhXaHZzMy8zcUJzVzJr?=
 =?utf-8?B?UG4wNURqZkIwdTYxK3EzQ3hXejB4cmRCYk9VbnV4Z1NERDZvdThLTnBpbytE?=
 =?utf-8?B?bG1abWxoMWdLNkhOS09LRHZseU9UaCtXaWhvY2ZRcXlSL25sUzlzUThRd0pp?=
 =?utf-8?B?blpBc2thdjVpUlMwTnY1ZVZ4OENiVi94YW9icXd1WkN2MVpDSzF0cmZEQ25E?=
 =?utf-8?B?R2pSL2M5RCtlbmo0eDB5dkhlODFpZno4UXlZa3NqUXBDd2VwS0NYSHRlZzZN?=
 =?utf-8?B?aEpuSUJLREE0RzI5aDdOWkRsc25STXpqamtvQnVPeFpPcE9aQ3crdnZOeDFV?=
 =?utf-8?B?ZjFWaldWZzZTQVRkc0xjek01QW9BNjU0NHB1RVJzUU9LdjROTFV4UGo5VHpy?=
 =?utf-8?B?NkoxMkZ2Umc4dDJNVHIyTXV1NnFpeTBSRDNnbnNmc1ZxOWQ3akw3K3hwT2tU?=
 =?utf-8?B?aFY1eUU1UjZ5V2NzMDZzeTd6cG9nWG1LUnprdEF4T2dIN2VjQlQ3MlVUTElu?=
 =?utf-8?B?aFRaU1MyMU44V3FleEpsUDNSOW8vem5yKzhwcytjRlpuYjhYcENKMXAxRUtR?=
 =?utf-8?B?b1RXaDkyalBBM1dQdGhDZWpuZUxjMUpzNDkvVHJYMEY4ZFEwbVl3Rm5ad0do?=
 =?utf-8?B?WjlHWGphQUduZUhVWjJNU25UbkJIZGdUUzFmN3dlZHFaQ2c4My9MMnJPWlQ1?=
 =?utf-8?B?YkZ5eDAvK0lqZWxSM0l3eWJzajFEQnFaODJSNWl5RnB4WEIxZUFxMlV3L1B5?=
 =?utf-8?Q?Q2eOz2KOGz5r27KaAHa1sWA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820fe59e-4fa2-491f-2a05-08da014ffd2e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 22:07:09.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOYuzh1grraUW4JnXoeOCw7dbC/m52UQhxbiMwmzmDVhONKXkqCxBe2Wgch0pRqwfq7cP25WChGkPnWCWUVgRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 rajatja@google.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-08 17:02, Hans de Goede wrote:
> Hi,
> 
> On 3/8/22 21:56, Sean Paul wrote:
>> From: Sean Paul <seanpaul@chromium.org>
>>
>> This patch adds the necessary hooks to make amdgpu aware of privacy
>> screens. On devices with privacy screen drivers (such as thinkpad-acpi),
>> the amdgpu driver will defer probe until it's ready and then sync the sw
>> and hw state on each commit the connector is involved and enabled.
>>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>

The amdgpu_dm portion looks fine to me with Hans' comment
addressed.

I don't know what the impact of the EPROBE_DEFER in amdgpu_pci_probe
is.

Harry

>> ---
>>
>> I tested this locally, but am not super confident everything is in the
>> correct place. Hopefully the intent of the patch is clear and we can
>> tweak positioning if needed.
> 
> Thank you for working on this, from a drm-privacy screen
> pov this looks good, one small remark below.
> 
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 2ab675123ae3..e2cfae56c020 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -26,6 +26,7 @@
>>  #include <drm/drm_aperture.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_gem.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_vblank.h>
>>  #include <drm/drm_managed.h>
>>  #include "amdgpu_drv.h"
>> @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>  {
>>  	struct drm_device *ddev;
>>  	struct amdgpu_device *adev;
>> +	struct drm_privacy_screen *privacy_screen;
>>  	unsigned long flags = ent->driver_data;
>>  	int ret, retry = 0, i;
>>  	bool supports_atomic = false;
>> @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>  	size = pci_resource_len(pdev, 0);
>>  	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
>>  
>> +	/* If the LCD panel has a privacy screen, defer probe until its ready */
>> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	drm_privacy_screen_put(privacy_screen);
>> +
>>  	/* Get rid of things like offb */
>>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>>  	if (ret)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index e1d3db3fe8de..9e2bb6523add 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>>  		if (acrtc) {
>>  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
>>  			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
>> +
>> +			/* Sync the privacy screen state between hw and sw */
>> +			drm_connector_update_privacy_screen(new_con_state);
>>  		}
>>  
>>  		/* Skip any modesets/resets */
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> index 740435ae3997..e369fc95585e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> @@ -27,6 +27,7 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/dp/drm_dp_mst_helper.h>
>>  #include <drm/dp/drm_dp_helper.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include "dm_services.h"
>>  #include "amdgpu.h"
>>  #include "amdgpu_dm.h"
>> @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>  				       struct amdgpu_dm_connector *aconnector,
>>  				       int link_index)
>>  {
>> +	struct drm_device *dev = dm->ddev;
>>  	struct dc_link_settings max_link_enc_cap = {0};
>>  
>>  	aconnector->dm_dp_aux.aux.name =
>> @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>>  				      &aconnector->base);
>>  
>> -	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>> +	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +		struct drm_privacy_screen *privacy_screen;
>> +
>> +		/* Reference given up in drm_connector_cleanup() */
>> +		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>> +		if (!IS_ERR(privacy_screen)) {
>> +			drm_connector_attach_privacy_screen_provider(&aconnector->base,
>> +								     privacy_screen);
>> +		} else {
>> +			drm_err(dev, "Error getting privacy screen, ret=%d\n",
>> +				PTR_ERR(privacy_screen));
> 
> This will now log a warning on all devices without a privacy-screen. The i915
> code uses this instead:
> 
>                 } else if (PTR_ERR(privacy_screen) != -ENODEV) {
> 			drm_err(dev, "Error getting privacy screen, ret=%d\n",
> 				PTR_ERR(privacy_screen));
>                 }
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
>> +		}
>>  		return;
>> +	}
>>  
>>  	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>>  	aconnector->mst_mgr.cbs = &dm_mst_cbs;
> 

