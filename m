Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F6314A10
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AD86EB49;
	Tue,  9 Feb 2021 07:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F756EA83
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 03:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiFPOz4T7dxwT8tzU8PdOSpoiLOf/eYkXpwTI8JSM5U17Se7ZR9noVE4Z2xhLhqYXRRD6o9hL9uHPAZQbEcXc+64rYPe76b8LvT3MXPT2n0QLIhHQax7Sv1KyC2wA4RTrryMe7py7O9HuyQ/VszZtzOqVbn8PoaOcXoW+jqZk5VjlVijh9/pC71eXwT29n9WLGqDtQ1cMRbpwV3GslTf6YCwAQoZM3fahA7xRoq3LOmd5VfynatPDQDl/2LYU1JEBpe1Akr5I1nMtwy9iIfXZcxuwlRuxhqLVhbU8T9GrLeFsdm5tA4ZoKAQTBR5Fk5M/DCpGIubSrXrsebW1QYpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVay+iM5ekvb8keR5decgIqoUQTYbnOWlBS795ARz70=;
 b=D00Ig65BXJYBiZgP8RK8vsIGeurQo4Nr9R8RzMcQ0mmecqXq1ZoqN5gdfUFFAUdgYip2pP2gVaGszUsxEg0B1U6jnp/V+4+mTxhBC+KxCuQz+ArUYV98P90xYzB8H1mOdl5gCvTCVFkS1GKRQsr2IxTaEC8k26aGUmbu0asyHFACSnQgEs/z4t/FmmO7DFt5O7VPK5wTgFDZYipTqyZGnfWifOrwsiHJc5yZRuL2RwDTI2wAmgmzlULq3x9tXkHrw0tAt6D9W1AlKJrmCJXQDhrKL5nBetFWAj92nTToGEXUG6Nlir8mwB68i9Kz8lOt+7u/fZYDsjCVB3n3VNgnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVay+iM5ekvb8keR5decgIqoUQTYbnOWlBS795ARz70=;
 b=OmkHimhyjtQ15l8qQDo14xToEoTcMqnFVIp4lCjGyLozSrnjopB6XFIxBcxsL+xSHsC36SAD7Y4uRBX6VG1XeXwnR+c0lzLTwTxhvtiwAGwIjpnF31A2EbfFWSFfrSk6WRJCasl8KQUFISpZ2wESGLmGu2HgA7YZ2aHuU6M9PeQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB0070.namprd11.prod.outlook.com (2603:10b6:910:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 9 Feb
 2021 03:09:28 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.027; Tue, 9 Feb 2021
 03:09:28 +0000
Subject: Re: [PATCH] drm/tilcdc: send vblank event when disabling crtc
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jyri Sarha <jyri.sarha@iki.fi>
References: <20210129055831.1702862-1-quanyang.wang@windriver.com>
 <1c6bd553-ee27-c93b-59e6-8d3c8368213a@ideasonboard.com>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <40037f81-2444-1fe0-f5da-194f2a3d3f22@windriver.com>
Date: Tue, 9 Feb 2021 11:09:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1c6bd553-ee27-c93b-59e6-8d3c8368213a@ideasonboard.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 SJ0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:2c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Tue, 9 Feb 2021 03:09:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d57f7b39-5c65-48bd-2214-08d8cca81c79
X-MS-TrafficTypeDiagnostic: CY4PR11MB0070:
X-Microsoft-Antispam-PRVS: <CY4PR11MB00703BC427DF4EAF7D1B73B6F08E9@CY4PR11MB0070.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02Hcfw72PDwKE+uKd8ZmUP7x/e+/pXS39p46ZfC4PM4shcdp/up9dxMNhWdrTXw5Z6pO8+IARDnHKpy5H37HJCNMUpHZPDp3/hbH747xHlw1Xeuy/UZT5rfej3Ko6BjsxH2ZIoiDFG9gi9rx/Ag51TTjX++ySepYLdc8Du5grAw+0xrSj1Wu1JPo1otZttJxxdAS6ETKZwe+Q/rDmR5yp8TysOHJUtXSoLLMydSH+uFVHGMEPj9+EILlSEMQQ34/yo4JwCgpyxfhFURLDbRMGxTGGsJNGDsw1QT2z036xpvvrwD6gVuZ4doV1gR9+Gt5644KdGHCTiqiywkT0Q/IqBw1j/utB49CdHSO+Afiwz9qiiIg26YfF2pjGPndKamoszSwBUuxnEHN1OI4enr7ChVWnaMQPs7ap8qMVcIZZptks4FqMvL12rRmewGKsQhkOHWfNC/P7KFpqElti7wJgUJLug9vFxYF2fh8Ugx5at7isp9JJ6YB2r/IHL5Ui2XPuSQ8QV2MoiaoWs2WmJ6Lpp2Q2oU5+VjB1cJIVmlhS71BsVT2+SxaX6KzVYg+0HwH+UoCb5tiNNUqcwlUZuUstT5Zt6zvPvGA9aFLslGoOHRhRrea3/dVcpvKXQfVQe1R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39850400004)(396003)(346002)(136003)(66476007)(6486002)(8676002)(66946007)(66556008)(186003)(316002)(16576012)(110136005)(4326008)(2906002)(86362001)(26005)(52116002)(478600001)(6706004)(6666004)(5660300002)(36756003)(83380400001)(8936002)(16526019)(2616005)(31696002)(956004)(53546011)(31686004)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alJQSEY1MUhmUkRXOEY5OVNFNm94Tm81NkhvZDF3QkFkYjBudDhCK210bU5j?=
 =?utf-8?B?ZkdibVJLTWpZOEtXdXlYbnhZd3UvLzhyQ3oxV3JaWFJIejRiY25vRm5GcDNM?=
 =?utf-8?B?eW5ScFM2NzdsMDlwVUZQaTVOSlcwaVg3cE5UdTJJenZRODVJcVNWOE9jeVdH?=
 =?utf-8?B?eWRWaHZGMzFzeDVsOGpndVArRUx5Q01DUEJmdVB2TitZN2ZYdWxSMFlyMlMy?=
 =?utf-8?B?SHJQSnM0Z2w4OUtPalliQW14TWl6QjZuSWN1MnZ0VGtHMWdTTlgwS0VTdmd5?=
 =?utf-8?B?LzVVZE1KeFd6aUNZZkkzcTFqTnJ2MFN4SzNkZ3BkRUEwbTByd1F0Ymw4NUR0?=
 =?utf-8?B?eGljNURjRmNnK2UzdjBwRUFqb1R3ZnVndXY2VnNDVEVOVTUxOGlBYU9pbGVv?=
 =?utf-8?B?VFowa2x6NTdYN3hDTWtUMnVUM2FYN1lsdzVQQ2hGVC9UOC9OQ2tWbGtkTGVh?=
 =?utf-8?B?WkRjV2xVS3ZYR0RZK0NCZFdTeUZ6ZGFZK3Q4U1FIMGU2TTZRSTlZMEhmM0pD?=
 =?utf-8?B?SGd0ZDYzUUFwWVpTaEt6T2YxSDUwdjdzcTdKcys1Q0RrUHZlMVdXNG43WFQy?=
 =?utf-8?B?bzhJQ1NEUG13blh3bUoveDBlUFZKS1BrVERVWkh3M1k0TXJNWVEyS3IyZXgz?=
 =?utf-8?B?OE8zZkRxWmJpRDJTcE9wempud3ptbHh1dWNsM2dhZEsxZFpSUUZ0TXdLM0dL?=
 =?utf-8?B?YWdBMXpLZlB1NktsdVo2NUpQanFxY0VEWkdCYm42WU5sWFFpalZnR29kMEc1?=
 =?utf-8?B?bGpyUVR3bThtdnR0ZUg3RVlNY1htejdla1ErOGtnYU1MRUFOODRrdkY2NmpE?=
 =?utf-8?B?QWJING9rOW0vVHFya2l2NE56S05GTjRibEFWNFZ4NWk1TFFmRUxnd0I0S1E0?=
 =?utf-8?B?VmlEdWNvSU05TnlUL0VHSHJsTTIxOVVaRit4US9sanlETkhmNVAvUWxnSzVP?=
 =?utf-8?B?QStkTXVxVGxHNkptUTYrWVpqNFBaTWVTa25Cd21WbkRmcTkrWnRMZXNnQkJq?=
 =?utf-8?B?ZEFEaEpaZzBybU55NHNlUnkyRXhHRnlTODRaQzlGbkJTOUxINVp4UDZuVFZw?=
 =?utf-8?B?MkpZS0UyNVpwNVpHOHhYQnNNdjlFaU1qZUFQTTFWdVcwNHUwclRkNWJIWE5m?=
 =?utf-8?B?MGQzN2JjSkwwOUprQjQwcnAya2pDWnNqZkRyTVNlckhXTXczSFhFMWFQUFA0?=
 =?utf-8?B?ZWFNQmdTQnI3aXZzY0xYbHJlSVJBWDJkMTZSaFNsQndQelhNRGNrK2h6ZjhV?=
 =?utf-8?B?Q1NlZTVjNFBlS1JkL1Q4akVxUFo0VS9FQmw3eTNoUzJPelhlMDJKak5ZNk14?=
 =?utf-8?B?SFJmSmlFWGxmWjBJcG1QdlhSRW1nWVdzYVRDcDdZUFVkcFlGWmU5dHVvdytN?=
 =?utf-8?B?VDhlTEZGQUQ5SHcxVXFVWFU2eUlJT2NtS0VVOU5FUHlWQkNYVUFoQ1NpbVE0?=
 =?utf-8?B?R3BVbEtPcnR2UnJtVlRxQTZ1RHNRSnphMDcyYUhzd2ZmWjR5TVBTeklSMzdN?=
 =?utf-8?B?VFYrT2JOQnc5dWo2UTBsVXJnZHlkcS9hK1JZSlpOVVQrc2RnZVlaNWkySVZx?=
 =?utf-8?B?WTVNcDkwc2M5QzBVNjRaN1EvNjdOMWwwa2hPaTEwMFVpbE9uc1dRalpBQkhI?=
 =?utf-8?B?Umx5RUFlK0dVd3JFa09sUEhCSE9YTjBuZDJyNUUvWmlpVmxjV2dEY3N3TEdK?=
 =?utf-8?B?QXVRYjdyVVFqb3ROdDd1Q0JhUTN0Y2xqWU5reks3b25UN3ZrQXNDMGNpS2dT?=
 =?utf-8?Q?ASAm3U/9za9F/S2S/B6ecL5S5CBAZf5HBgOzVAA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57f7b39-5c65-48bd-2214-08d8cca81c79
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 03:09:28.0665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9ETY2oR21zJcBnMK1+1XOoDex0tS0buopfBzPpbcEO0qG6FiBSQLdv2u1mzLjxjPzXcYorrK0uhUKbrrly3ClfGBY8o05x2vHsgj+GnuxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0070
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping.

On 1/29/21 3:58 PM, Tomi Valkeinen wrote:
> Dropped the @ti.com addresses and added the new ones.
>
>   Tomi
>
> On 29/01/2021 07:58, quanyang.wang@windriver.com wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> When run xrandr to change resolution on Beaglebone Black board, it will
>> print the error information:
>>
>> root@beaglebone:~# xrandr -display :0 --output HDMI-1 --mode 720x400
>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:32:tilcdc crtc] commit wait timed out
>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:34:HDMI-A-1] commit wait timed out
>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:31:plane-0] commit wait timed out
>> tilcdc 4830e000.lcdc: already pending page flip!
>>
>> This is because there is operation sequence as below:
>>
>> drm_atomic_connector_commit_dpms(mode is DRM_MODE_DPMS_OFF):
>>      ...
>>      drm_atomic_helper_setup_commit <- init_completion(commit_A->flip_done)
>>      drm_atomic_helper_commit_tail
>>          tilcdc_crtc_atomic_disable
>>          tilcdc_plane_atomic_update <- drm_crtc_send_vblank_event in tilcdc_crtc_irq
>>                                        is skipped since tilcdc_crtc->enabled is 0
>>          tilcdc_crtc_atomic_flush   <- drm_crtc_send_vblank_event is skipped since
>>                                        crtc->state->event is set to be NULL in
>>                                        tilcdc_plane_atomic_update
>> drm_mode_setcrtc:
>>      ...
>>      drm_atomic_helper_setup_commit <- init_completion(commit_B->flip_done)
>>      drm_atomic_helper_wait_for_dependencies
>>          drm_crtc_commit_wait   <- wait for commit_A->flip_done completing
>>
>> Just as shown above, the steps which could complete commit_A->flip_done
>> are all skipped and commit_A->flip_done will never be completed. This will
>> result a time-out ERROR when drm_crtc_commit_wait check the commit_A->flip_done.
>> So add drm_crtc_send_vblank_event in tilcdc_crtc_atomic_disable to
>> complete commit_A->flip_done.
>>
>> Fixes: cb345decb4d2 ("drm/tilcdc: Use standard drm_atomic_helper_commit")
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>> ---
>>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> index 30213708fc99..d99afd19ca08 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>> @@ -515,6 +515,15 @@ static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
>>   
>>   	drm_crtc_vblank_off(crtc);
>>   
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +
>> +	if (crtc->state->event) {
>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>> +		crtc->state->event = NULL;
>> +	}
>> +
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>> +
>>   	tilcdc_crtc_disable_irqs(dev);
>>   
>>   	pm_runtime_put_sync(dev->dev);
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
