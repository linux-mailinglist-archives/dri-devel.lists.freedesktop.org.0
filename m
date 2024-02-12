Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1417851940
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 17:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7E510EBD3;
	Mon, 12 Feb 2024 16:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EvSbM/Aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1204610EDFF;
 Mon, 12 Feb 2024 16:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2BLAY/bKMKQJd/MwXjr2iQwSEtSLD02wPgM/ZcuAxR14yzxnnYE1XfDRxKIdIBTNW0YUYVCozD+46cUH3yVG8me9egotcODKBNw5FP12o4ID1unX3iZMY9zLXN2G/63yVOYAALx11yVzNyhxfNoeUZDn1eSGyEC2qYha3gpCg+uS9zby8y9Bqh0IdYgrYxaYUsBtLd03WjCoXnpzY2eCgdiFS4DCfsLDUaJtyQQUzCWWZPJPB9NOiEdP3R4J+rNht44LGHrMbhUm4ag5QHxYQff+wjTf3A7DbZP7ZzE+rtXmwaLsSP7dm+6niiXls07uDWqsb0PTqK6YpI0Hv6B2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWvisoDDPrjELF0J08m9VyVmtr8yMEDaJxd90x+PuQk=;
 b=Gv2lS3/coyGhETNCrKyLpUj+7bpgq++IJ+TDDTT9YxUo7hRYkW+Qn/FcVnPAkl5k5hssg6/Rj9a+8JEwElscsII87lBDBvFvF7jzHHc+mvwvcT9CJlVbtMzXdEkrRSiI1KRBQUZGKCtLbDc//at0ZAQt2/EabzqnfSjyLOtlvkmOabE5rMkcy9hVETAqv1nHOF/KKBGx3UXXXiOdlOqzDgjp+ZvFdtUj7MWSbprMM+n5Ss1nieKBZbZOwKQhAMNK7dm0ovCQhHlq6xZrm0JP55vugzyGO7crpv252OpEBwLVGC9+qYmivf/pjfm7a2OnTAVdYI4bNdMs6BockH3EBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWvisoDDPrjELF0J08m9VyVmtr8yMEDaJxd90x+PuQk=;
 b=EvSbM/Aqd2Fb2qx13i4Z5JXwnVaq/1vrbF8mZZtFTGd1M4VmV4TZ1pUXuTgbewQv2PRv2TNkLnz8c7hqVznW2OcWDFCYFtPDjWhPpLefmN/kJ9bnmI0tNHfWTq8jGueyDiSNe/IVyWPFWJmO2EiAWYTh5E4wcQOp/kwYx6n6DtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Mon, 12 Feb
 2024 16:31:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7292.019; Mon, 12 Feb 2024
 16:31:15 +0000
Message-ID: <08ced68d-99bc-4a5e-90e7-f6a4b4b20e93@amd.com>
Date: Mon, 12 Feb 2024 10:31:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm: Add support to get EDID from ACPI
To: amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240211055011.3583-1-mario.limonciello@amd.com>
 <20240211055011.3583-2-mario.limonciello@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240211055011.3583-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:5:334::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 322f7ccd-51b5-48b9-23a3-08dc2be8081f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzJTITkh27vVkHpzw46ShOEkrPZNcdOEeu4q1OUPXa30cTYrrhAI0AtL6gupCFGvEEsXltUORjXUuWNp3jOedemKyfGdQ/gvxXvFFvVk5Z5GSc3nxeJgpPjYeqGWtLKufH70X4lcBJe5NDt634iqMg9PUMgEp4W4/2hix8Aq9z5lasZCY2EfT+qp2y88nzMPlYNSphihzQ5DPKA632yMgJG1IDv04kKgvMMIPYNv653LptQBuUCrMuZtxzjtSGBHRAikloiWDwSe+JGKbAcfFqwyvB2bfFyYHJrflD61MCSPtpkPX4PBJphg5R1+t5w9LkBONRN/w/STe2uH/l9ljF7ijLYojinYLdhXEa8xNePFouRU8mOhnD5YBu9CyVc1eTMfKlDdBCKm/F+5uZVBeFB5x+6tdbtaA4x2HmxDrdnZ9nDK2GYSpAndUR6td54K4A9EOCL0O/KU3PN1jujq39Q1PY+sP9m8au6bkMM5f55GongfSGUBAWBp670DQ6NdadMhGfMppQIe8xod79ZYexmFiXfwJokARr324UHbfOGYfn6RQSDXzdYe2hSVUFCk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(31696002)(31686004)(6916009)(5660300002)(66476007)(66946007)(66556008)(8676002)(8936002)(4326008)(478600001)(6486002)(6506007)(6512007)(2906002)(44832011)(2616005)(41300700001)(83380400001)(38100700002)(66899024)(26005)(316002)(6666004)(53546011)(36756003)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdTemJYOUFIaDFYSFNNNjZzaDl2b0puMTRZbFRyRnovbk54ZGh0dnhjYlZn?=
 =?utf-8?B?MWVkVS9wdjRQWExHSnlxNUhwSEUwZmFMcUdwVjlFY0txWXBxL3NJcWowejRG?=
 =?utf-8?B?Yit0SHlWRWcyMGhpUUVZMjF0Q0dycEJYUW5wS2hEUnBUS3d0ZjArYnlLQjBl?=
 =?utf-8?B?U0d4SU1HMzQzN3ZuelgybGlRUkFtYXY4RXdFckgySjA5V3pZMzlHZEVZVVdV?=
 =?utf-8?B?UVpVUFRreWZIbnY3VHlGUXlrK3Q2QjFjVDRiQ2o5eTJYSDlvaUorbTVtQk96?=
 =?utf-8?B?QXhucGtjeWg3UmgzZHZ6L0JDVGZDM1ROODFKTzFyL2dnbVFaVThmUSt4aUhV?=
 =?utf-8?B?Qjk2VXFoY0tiYy9WcmZ5UDFhNW5nLzhtNGRBZ3NnTkVqclpUZHFwM29kQzZi?=
 =?utf-8?B?dVdhUk5xSjJsWUxoV29HQ0RBdXJ1RlgwSXNZdFZjOVE4dFFURDdEZmJkRTlE?=
 =?utf-8?B?SDUzKzU3K0lUVDMwalR1b2Y0NzhBc3hqeFNaUXRMOGhkU2FWa3FZR0NCSzUy?=
 =?utf-8?B?dzBuWlpQcUI0c2tUTTllaUxXME1MNFNhQjZzbVlQODhJVFo1SERPVTdNVGhy?=
 =?utf-8?B?bisyZGttTzZIVEprS3N6eHdoMVhseEs5eDZ5c2hTRjZ3WjRiTnpZZW1iMXN1?=
 =?utf-8?B?ZGYwYUFRR2l4WjJFSnRVNWRRT2ExNFkzVkdmdXlxVTY2SStjajdDMEcvaHl4?=
 =?utf-8?B?TDBpYlFyVTVaNkduNDg3MUtjNlJCckNxVUlObFJWY3czQWVzM1U4ZDA1cXNh?=
 =?utf-8?B?b010YjZka2lQeEN4ZTZ2ZlQ4MVl5dDc4OURSMXF4bTJmOWMrb21VaSt4VGFr?=
 =?utf-8?B?b29xRmVudzJjRmc3NENmR3hTdU5rZzZRRE91eXpHSzlNL1RhUUN4cTU2UDZS?=
 =?utf-8?B?MWpXaThCSG8ralpMRHFHUDFrQ2h6OFhqS0ZxOEJ2TUdZOFZUb0lPT3hxekx1?=
 =?utf-8?B?eUhLc3dtQ1pUVjNiS2FhcW05RHdUaG1jeVkxb3VMWGk4VUFhcTBvQU1CcWJ5?=
 =?utf-8?B?TEw2Z2tyeUUxTUFsTWhyNXU2SitYSkFDaHJ4Rnk1UXVyL0ZtR1dwTnBVY1dB?=
 =?utf-8?B?WXJiNlBKaXJnRlduTDI4L3lpaXg0TVNWWUE3S2tkb1Q4Uk5wSWlnS2tBRHNW?=
 =?utf-8?B?c2FBeVcwMENlZyszN1ZjMXE2SkZidWp2V1BsQlRzWmlMMFV1U3prbk12K0pp?=
 =?utf-8?B?L2dtcGlpVnZyY21yMjZrZTBMU2xPcUpBSnNZSFhsNUU4YnMya2UwOFBzN2lo?=
 =?utf-8?B?aVNLY0xpcVREMkRDN0w5bldPYlpJMHhXWUJQOEp3UHVZT25IVWRsbkdUYy9x?=
 =?utf-8?B?TDlYeGh2TjNpdkJrWFREZmE4RERRODlXMmVZbDkwTzR6akc5b09pNnQ4b1NY?=
 =?utf-8?B?Q1BQcXl1OG5OVXJVYkR0TTk1ODhVc2N4cUZKZmhocXhUNndBaDExV1lkODNL?=
 =?utf-8?B?dkd2V0pyd3NWbGU1K083eTNublFEbVoybUNyTWx4V0sxYkg4b21BSHFzV0Ir?=
 =?utf-8?B?QjhDcmFMUVpIcmljbnlKbTZIZ0MrL21ib1k5RGthRVJScHh1cnpKdXpxeEdi?=
 =?utf-8?B?UjkrNzlyc2NDNWR2TjR4REYxY3hrQUk2WWdEM0RTbDdjbnArcVN0elQ5Qnc4?=
 =?utf-8?B?ZGJ3OFBmR3VNUEgwSVdWOUhWcnp2RkxIL2tUQ1ZDVmdvRStIZUNMYTlXYmc4?=
 =?utf-8?B?Mk9UbHRTaXBEMnA3VTJ4OUNXR1Q5UG1Md1hqOWUzcmpoT0tMZ3I2SE05Z21B?=
 =?utf-8?B?ZFl5OGtYa0ErQW0rUno0N3kwU2VCeHd4S3ZwKzl6UUN6TjJybmlkb2Z1YzE2?=
 =?utf-8?B?ZnBwTEN2MEREeGNXU3htSzd3cnltMXdGeGhwZndoY0txQWErTW5SWHNDcVZN?=
 =?utf-8?B?YWhtNFFPSEorUWl1bnVWbk40d01BZWdDSU11aEg5ajNPU1lFakZOaHY0Y01T?=
 =?utf-8?B?R0lKdGEwYUVXdUtGSDRrMjJzVk9uVXlGQndQeFM4dWFNQ3QxcG5JWVcwQksr?=
 =?utf-8?B?UGN6RDd2Y2w4MTlhbFZkQTZuWFNQa244YjVrbkJUOXRkWExpTTBYQ0NFU3NB?=
 =?utf-8?B?NFZYbFFnek5Wdk1KVXYwVko2RWdPRGUxSitrWjdMQ3Zoczlvc3Brd2t2ZFpz?=
 =?utf-8?Q?P6F6Ax5VuPQsqgtPCjaWYXR53?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322f7ccd-51b5-48b9-23a3-08dc2be8081f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 16:31:14.9593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRfHhnVW8wQ+lyERg+UPIHmUUg/BxGlAxkX1mUUgHLjnYQdhsyRoV2cS9p4fXcCg5P+R5uYP0C2YYEAMp8UH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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

On 2/10/2024 23:50, Mario Limonciello wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.  Drivers that prefer to
> fetch this EDID can set a bit on the drm_connector to indicate that
> the DRM EDID helpers should try to fetch it and it is preferred if
> it's present.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>   * Split code from previous amdgpu specific helper to generic drm helper.
> v2->v3:
>   * Add an extra select to fix a variety of randconfig errors found from
>     LKP robot.
> v3->v4:
>   * Return struct drm_edid
> v4->v5:
>   * Rename to drm_edid_read_acpi
>   * Drop selects
> ---
>   drivers/gpu/drm/Kconfig     |   7 +++
>   drivers/gpu/drm/drm_edid.c  | 113 +++++++++++++++++++++++++++++++++---
>   include/drm/drm_connector.h |   6 ++
>   include/drm/drm_edid.h      |   1 +
>   4 files changed, 119 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2520db0b776e..a49740c528b9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -103,6 +103,13 @@ config DRM_KMS_HELPER
>   	help
>   	  CRTC helpers for KMS drivers.
>   
> +config DRM_ACPI_HELPER
> +	tristate "ACPI support in DRM"
> +	depends on DRM
> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
> +	help
> +	  ACPI helpers for DRM drivers.
> +

Unfortunately in my wider testing this still fails with a few combinations.

This combination fails to link:

CONFIG_ACPI_VIDEO=m
CONFIG_DRM_ACPI_HELPER=y
CONFIG_DRM=y

This combination links but doesn't work because the IS_REACHABLE() fails 
(-EOPNOTSUPP):

CONFIG_ACPI_VIDEO=m
CONFIG_DRM_ACPI_HELPER=M
CONFIG_DRM=y

I'm tempted to split off all of drm_edid to it's own module instead  of 
CONFIG_DRM_ACPI_HELPER which has a depends on (ACPI_VIDEO || ACPI_VIDEIO=n).

Or Daniel, any better ideas?

>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>           bool "Enable refcount backtrace history in the DP MST helpers"
>   	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 69c68804023f..096c278b6f66 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -28,6 +28,7 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <acpi/video.h>
>   #include <linux/bitfield.h>
>   #include <linux/cec.h>
>   #include <linux/hdmi.h>
> @@ -2188,6 +2189,62 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>   	return ret == xfers ? 0 : -1;
>   }
>   
> +/**
> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> + * @data: struct drm_connector
> + * @buf: EDID data buffer to be filled
> + * @block: 128 byte EDID block to start fetching from
> + * @len: EDID data buffer length to fetch
> + *
> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> + *
> + * Return: 0 on success or error code on failure.
> + */
> +static int
> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct drm_connector *connector = data;
> +	struct drm_device *ddev = connector->dev;
> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* fetch the entire edid from BIOS */
> +	if (IS_REACHABLE(CONFIG_DRM_ACPI_HELPER)) {
> +		r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +		if (r < 0) {
> +			DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +			return -EINVAL;
> +		}
> +	} else {
> +		r = -EOPNOTSUPP;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = -EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +
> +cleanup:
> +	kfree(edid);
> +
> +	return r;
> +}
> +
>   static void connector_bad_edid(struct drm_connector *connector,
>   			       const struct edid *edid, int num_blocks)
>   {
> @@ -2621,7 +2678,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>    * @connector: connector we're probing
>    * @adapter: I2C adapter to use for DDC
>    *
> - * Poke the given I2C channel to grab EDID data if possible.  If found,
> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
> + * poke the given I2C channel to grab EDID data if possible.  If found,
>    * attach it to the connector.
>    *
>    * Return: Pointer to valid EDID or NULL if we couldn't find any.
> @@ -2629,20 +2687,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>   struct edid *drm_get_edid(struct drm_connector *connector,
>   			  struct i2c_adapter *adapter)
>   {
> -	struct edid *edid;
> +	struct edid *edid = NULL;
>   
>   	if (connector->force == DRM_FORCE_OFF)
>   		return NULL;
>   
> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> -		return NULL;
> +	if (connector->acpi_edid_allowed)
> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
> +
> +	if (!edid) {
> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> +			return NULL;
> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
> +	}
>   
> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>   	drm_connector_update_edid_property(connector, edid);
>   	return edid;
>   }
>   EXPORT_SYMBOL(drm_get_edid);
>   
> +/**
> + * drm_edid_read_acpi - get EDID data, if available
> + * @connector: connector we're probing
> + *
> + * Use the BIOS to attempt to grab EDID data if possible.
> + *
> + * The returned pointer must be freed using drm_edid_free().
> + *
> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> + */
> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
> +
> +	/* Note: Do *not* call connector updates here. */
> +
> +	return drm_edid;
> +}
> +EXPORT_SYMBOL(drm_edid_read_acpi);
> +
>   /**
>    * drm_edid_read_custom - Read EDID data using given EDID block read function
>    * @connector: Connector to use
> @@ -2727,10 +2815,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>   EXPORT_SYMBOL(drm_edid_read_ddc);
>   
>   /**
> - * drm_edid_read - Read EDID data using connector's I2C adapter
> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>    * @connector: Connector to use
>    *
> - * Read EDID using the connector's I2C adapter.
> + * Read EDID from BIOS if allowed by connector or by using the connector's
> + * I2C adapter.
>    *
>    * The EDID may be overridden using debugfs override_edid or firmware EDID
>    * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
> @@ -2742,10 +2831,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>    */
>   const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>   {
> +	const struct drm_edid *drm_edid = NULL;
> +
>   	if (drm_WARN_ON(connector->dev, !connector->ddc))
>   		return NULL;
>   
> -	return drm_edid_read_ddc(connector, connector->ddc);
> +	if (connector->acpi_edid_allowed)
> +		drm_edid = drm_edid_read_acpi(connector);
> +
> +	if (!drm_edid)
> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> +
> +	return drm_edid;
>   }
>   EXPORT_SYMBOL(drm_edid_read);
>   
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..74ed47f37a69 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1886,6 +1886,12 @@ struct drm_connector {
>   
>   	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>   	struct hdr_sink_metadata hdr_sink_metadata;
> +
> +	/**
> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
> +	 * This is only applicable to eDP and LVDS displays.
> +	 */
> +	bool acpi_edid_allowed;
>   };
>   
>   #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 518d1b8106c7..38b5e1b5c773 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -463,5 +463,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>   
>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>   				  int ext_id, int *ext_index);
> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>   
>   #endif /* __DRM_EDID_H__ */

