Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4A638CD4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 16:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8F10E0CF;
	Fri, 25 Nov 2022 15:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C88010E0CF;
 Fri, 25 Nov 2022 15:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSGyTZhGkro603VcI8ogHbCBxTM268xQHLkVHpHgqRocMWb6SCkHIIhmS28oJrF1WK1WL7AXvFyyz7ADGkxmwPrQJB44+eQC7y3ydIstaq+fsaNQTpzk5kAuJuAA308f8htlZm9hpHjokh/OG14xN0bRRBQXzpftpBvWnkn/Iw9txJ1z1euV5hMb7ckFGvNDrift8gF+mPmPi0QRIV+9SKLl6mYqYW6foYwVwBAQpTgdqTj1EL6giAWYJbTaYt0UOk8bkpJyP2rIzwiJHSe8ZVSjgwgmSoIZfOsoYtvO+kckL87mBiLudfzWBRpg47vbEVIQW2ptjLUtez3M3fB9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNboWNx0mRHkKnZtRUR4zFiYqJjNh65spPDTus6UrYE=;
 b=KWbIk1XYle3l6E00Q5VJ0yYbCmAhubNCmvb46XoSuaI6fDf+8OWW/3PNkYYoDxZ5uC5rqD0m6wKQC1wS4W4jRrAARAeQ0MBKZfG9JZLniWC4AoNxvbcvIJaYr/whYbfL42baCpRnejl4ccMbSMskEqkfTFt68+XwYW0PbdHW7xGEpAoY2UMUWVgGVNZXyc5awQXh32dZ8q4Bdy8tuiFO2C5qtH2T8WJ7vejVjKTK3ILrPEoENZKevtQm4b5bR14ZPDQ/DVvuCljxSWUIIIArfmMO90rUez4IJqhDO1aQ0xRP81u98Jtzl6YX0Gmyrsy2T73CPlC5R7OKcTbW7SZoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNboWNx0mRHkKnZtRUR4zFiYqJjNh65spPDTus6UrYE=;
 b=v8ZYfwKH9uj+9aizI0i03JrkrZnlfzahBnyisd1TEJ9G+RY0kqwvwe3ui3oL0Hnmr/JgqviiS0dRHFHOIID2qhfrX8FFMxjTJ4Tc6PyUFywIBFnJq4iyHvLU8JHYm3X0vyYNeEjUlRojbRdFvkFy/xs/KNjOxJo+F0DifMjtPXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 15:00:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%8]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 15:00:13 +0000
Message-ID: <7af346ec-8473-2a37-0fb4-220a42529a1e@amd.com>
Date: Fri, 25 Nov 2022 10:00:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC 0/2] drm/connector: connector iterator with filtering
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <cover.1664966047.git.jani.nikula@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <cover.1664966047.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0035.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf0d3cf-6dd5-4b6b-94f5-08dacef5c02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zuCXu/l1jaevsXaE57t1LloS7iGT64JtEl5iIljHUaXRtxtdvn9nVDv2zdyqjVmZIpbJLW6ygs3yPv4eT5ZmJtjmieNpVDlETf03bQ9P8DfoQGOg2TLrfRAloUa1gxFUZMFlXoPCkJL6TU4cbcNt59h/kifeoFmn0/zlB54k7iqkZn4Tvz4lHHkg3W2vBbmWwC1uRRyjQhJUR2/iQRLB8O6ULAgqVb+3NkxWxYiJuEbfH5qXOGKGI71BhzC9l/r3nSJM0aLcqCwUK/hJaMMe998gPk3WWhO+ielQhXoAq++tIpq0TJGsRj1lnxSK7QdpnifyU1KnOUqMfjEdy66ENnNq+y36pZOig4ICh6DvJqkeqCP9nxwHctCJdbIHp5cEVmKPbm10YLZRvA0qkizliatej7T2y/09US+wNncGU56X5czRK/27VSFXIBtfYxeR//JoHDfSDFZnsRtZfIdQMSUcES+K/MvkUsXFWmoM1lMZHqotepv40TOQAA5UtjUoTLoz2dJlQB8Jb0fcuQ+mYUjv63a5NNyt43uV7vtSolHv381hNMMw/Gsmrek1Q8GFmIs0c7DNkD0sTkimcuC8LE7lrcJ/DZfbWe+UL48sNVSl6/LAiOsfFPdmUD3CVqB9bBkM+8PIThgGl0dmWUntE/iNXS6VuDzh267cUfuGLBpVoHwst77JLBn3rE8GgJJW5vURxs6xiIkMhYFKyrxdwQQQ9XekOA60WJs1eZxVIlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199015)(5660300002)(44832011)(66574015)(66476007)(36756003)(6512007)(66946007)(8676002)(54906003)(53546011)(26005)(4326008)(316002)(2616005)(186003)(41300700001)(8936002)(38100700002)(66556008)(2906002)(83380400001)(31696002)(86362001)(6486002)(6506007)(6666004)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em43V2NVQ2Uvb2tNaFZiSjR1ZVZiSjVGbWp2OGpuQjJjd3pNSS9pdWY3RzFt?=
 =?utf-8?B?dzF5UHZIelBrV3ZlNXVRQ0YyR1BqV0J0SkVlYlR2dVc4Z3hqdlJGNHpXWkxD?=
 =?utf-8?B?OGpKN1M5ZUYrZkxROGRXTHh6dHpwNEorRHJteVhqcll4UklMOTdkQkNCMGNw?=
 =?utf-8?B?RTBONVQ1TUhmRkVLZVhIRTdYbkMwZlNwZDZka3dPQVdsTnFGQXBGSno3VlRq?=
 =?utf-8?B?Zk9ERUVGUGZJK0tMTFBIOHZlUlUvUUFkZm9tTlRpd3MrY0V6ZGV4Q1FWQm4x?=
 =?utf-8?B?U1pCN1ZQa3pBck9iVG9vcWpWU2txalVrdWxlWHpGeWlBSXMvNFBhTTFUb2xM?=
 =?utf-8?B?eSsyVU4wTXV0dWgxTFhuQUVBM0NTSFoveUgxYUtiWWpqcWFLUndjb0habk5B?=
 =?utf-8?B?L1I3ZHVPSTErWUk2cnJ5bWxBZ1hiRVlKTFE3OXJTckZjZzlsRDE1RzBtRjJR?=
 =?utf-8?B?M3lQR3F4SFE5bk9iVmZWZS9iekdpYzdlNCtDZVgvYTIzNXA2cmxvai80MTZJ?=
 =?utf-8?B?Q0MybGlmRmpyLzN6VVNKUi90c1V0b2pkV0VjVnNMYmd5dmRCME14MDlQUkZR?=
 =?utf-8?B?Szc0VGhpUytMVm50cVdXa3pLbXRDb01jN2lpdWpndi9taEhIS2lybUJNbGEz?=
 =?utf-8?B?OWJSdnRlQnlsOU40U2ZoY3NYaWRiUGdoYytvTEp3YUtPVkNjY0N1U21HRm9V?=
 =?utf-8?B?RGpsSDZScjZlN1FxRVdGT3ppVmhwZFVHM2JTU2JoQzZVcWhyN1VwNjdGRUV3?=
 =?utf-8?B?WktXdmdLUXo1UVRmUGZNR205UHJnMEVXN1RYVmFkZUFRS2FXSzFDeDRYS3lr?=
 =?utf-8?B?U0FWVExPTWRVc1R5ZWIzWkgyL3ZhMUUrbklYY3lDT3NkM0FIZDN0N1dpcGxT?=
 =?utf-8?B?NVNHbktnUTZCZDBJUDJJTWpsNFZDODBqYjBUOVpWWFhFa1YxdEJWTXNpRTBP?=
 =?utf-8?B?NmlKRTNFMTdkR3FaTVdYV0VSUVkzVUx3Kzc1QVg5OGlUbDVYcndVS2w4NXpY?=
 =?utf-8?B?UHZyUllvT2E5RC91MU53U0tQOTd0QjdNK2RUWjQrT0haOUJsWkx3MXA1QlV4?=
 =?utf-8?B?Vk1ucDRyd3oxamdPNlo0Q2xJWk43STAzQnk4YzB6Z2RIUjg3b0EyUGJQclhv?=
 =?utf-8?B?VG1idzR2eWFFeEswemdDc0IyRXNhQmpIeU1KazF3b1NlRUxtRVZJRVF0UE9k?=
 =?utf-8?B?a3ZBR0hyRmhyRzZwQ3c4dXFZbGFtSjUvVEtOMnJ5SFBWRk56ZWVObENUTyt0?=
 =?utf-8?B?c1lEQ2lLSm9xTkhwb1NONUU4cWpUNytIWXJyUlZmTzJLbjB2M3NxR25NeUYr?=
 =?utf-8?B?VjNzQ0JiUE9kSHBSajVVSWlCcHNEUkRsMUQrdHdvMkJjRXVXN3pkTERWSWQx?=
 =?utf-8?B?amVwTGR2cGFTc0ZnSnRTSGNkbjVYUVh0RUdWdGtFWE9YM29MWXpwZy9ITEJz?=
 =?utf-8?B?c1MwUmx5dFh6VGg0R0p3bS8xaXZFaTlLY3hteW5YZ2QrOExnUXRWcklWaHpj?=
 =?utf-8?B?SHpGOTBxSXlldTM1cXcxcE1UTmFieEdoZE44U2xERlZQSjRKWkkzMGJuS0x6?=
 =?utf-8?B?ZEVkWUJvTDhXZjBDN3FhcXZ5dlJKOVBKeXh4NjdtVXo0WHozTG1abnhuL25U?=
 =?utf-8?B?REExTVphVVBxMk5vcUhXamkybkUxRHFPNm9JVTNyWlhackpBczBDWFNaYzRn?=
 =?utf-8?B?WjBJSTBaZTl0ZnRySDBjTHZwRzRCU3VDQUFrK1VZa2JLMm5Fc2F2aE50a09K?=
 =?utf-8?B?aVFSUVV6RlJ3amRwMEpwNTZ3S0dsMzk0RkhYa1NQODQ2bVIyQ3pZMTZuNyt5?=
 =?utf-8?B?YUlUQS9maWZDYytXWDhYZ0VPZlBpNE9FMHNpUnMxcEgzdWQ1cndXaFIreVhz?=
 =?utf-8?B?ZitNYkRvQ0FiakpRZHlNdlQyOU44SEF5NTVVUkh5V3g0c1JWWFJ6T0R6RkNN?=
 =?utf-8?B?amFJTVdvUlc5NExuMlF3YXIrN1E0T3RTUEhiTUlvU3hwbWd2anQ3OEVDd0RW?=
 =?utf-8?B?cGN3eWtLalptbUFid1NxSkgyTHNhdUdQR0JiTlVJRFpncXUrODd5VkJQdEsx?=
 =?utf-8?B?aS9GS0Z5WnQ4bWVMd0FpWkgyeHNOejlrVHdjM0RWUWdhRXBiUHBMQUh3WDdt?=
 =?utf-8?Q?pDoMOsd4pYS2wEjc9jsnBij2C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf0d3cf-6dd5-4b6b-94f5-08dacef5c02d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 15:00:12.8493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpQWun/LR0QM9TzYQhF9GNS6mev+sg0comFehAXb2kWw0hjFc4q/w/5fWXU8lU2ytBuAlONDhaTsChhpvtpAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
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
Cc: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 06:51, Jani Nikula wrote:
> Currently i915 assumes all drm_connectors it encounters are embedded in
> intel_connectors that i915 allocated. The drm_writeback_connector forces
> a design where this is not the case; we can't provide our own connector,
> and writeback embeds the drm_connector it initializes itself.
> 
> To use drm writeback, none of the i915 connector iteration could assume
> the drm connector is embedded in intel_connector. Checking this is
> tedious, and would require an intermediate step with
> drm_connector. Here's an idea I came up with; filtering at the drm
> connector iterator level with a caller supplied function. Not too much
> code, and could be used for other things as well.
> 

We've been trying to hook up drm_writeback_connector in amdgpu and
this would be really helpful. I've had to do liberal sprinkling
of "!= DRM_MODE_CONNECTOR_WRITEBACK" all over the place.

> Mind you, we'd still much rather modify drm writeback to allow passing
> the connector i915 allocated, instead of the current midlayer design
> that forces drivers to a certain model. Working around this is a bunch
> of error prone and tedious code that we really could do without.
> 

I think this would be even better but also be much more work and impact
every driver that implements writeback. FWIW, there was no way for me
to add writeback connector handling without KASAN. Interpreting the
connector wrong in one place leads to memory corruption and
undefined behavior and is almost impossible to spot without KASAN.

This series is
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
> BR,
> Jani.
> 
> 
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Jani Nikula (2):
>   drm/connector: add connector list iteration with filtering
>   drm/i915: iterate intel_connectors only
> 
>  drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
>  .../drm/i915/display/intel_display_types.h    |  7 +++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
>  .../drm/i915/display/intel_modeset_setup.c    |  6 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
>  include/drm/drm_connector.h                   |  9 +++
>  10 files changed, 89 insertions(+), 26 deletions(-)
> 

