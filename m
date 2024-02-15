Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0E856BBE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540F10E18F;
	Thu, 15 Feb 2024 17:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5cTflcLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DCA10E18F;
 Thu, 15 Feb 2024 17:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpsx4P030np9HnS0BjZLT8bZqXyAuq2UV6JENc3OuJ2pdK2v71ubvXCmh0NOG8P2XpnM0bLnDEwbJUhhkNRGtd0X+gEpTjWGu99xD7rCxVbfPoGsQ/A1ksnJFa5yvK/B6Fix41mhwK0LrwB7DXaqvjZz6kcX+d60yJzHrsKV8iGYyU8K31n2lhwKPp/XOKTGLUBgO6Nnnj/zcGKWbxdTxkYWFITXxCcQlbawySf3sgWxBTl9taEzML+sxbIvSh7RfHkE6NSYy/xRmecTCIuz4XjtJ1mS6yFxiQDLg/rpru7ysALhOsVtpS10fNnagRZFd97vwdDEKe1tg2ygdnfgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzUa3dZ7g9/8g3vBhplQg9+oi0Qd4m1BdUJ49JC2QLg=;
 b=Y7osP+g9B36BIQ8qeFTtT/NLTZUJjvioGfhxnWrLFvhNq6LSy1XfWQTKuXbs58OuYmDnler7hZse3EwVH71lqFVvqZwYbUzBSaY9GvDCHGk1n2neze5CZOlYqMnuDoRoK8VXGzP6eRzK+Msa2BgKj8Wnn3ntYrE6z1g/pBr9KhacqgE/v4X0dnRyuG55/jZFRTIWFyI65WiHvQ1zGW+zbqNefkr2kvVBk2YLfr8l2Dzc8USE0E3PCmOLBsECNNzVIL+otfBJSCP9kjOJ7yGuYhJLLlg44we+24swW062Fwi/XVJzeGNekXFRtGRJaqJLgMVZTLUiBgAKhIQTNJInUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzUa3dZ7g9/8g3vBhplQg9+oi0Qd4m1BdUJ49JC2QLg=;
 b=5cTflcLXwZaop4tB3RVUzWmq70ov4I7SCK1iDcuofvwHcsO8l0uxjlaZcp0BW3910HcN34yvaxfUfJaWqLN1MfTIPtgMOq2mB+Hu0h2nTNL3CdkowrlKVffi3x7rcIRafqxieXizUL1D2BiPith3fAy/yFa7Y8PI7oKqHU9GfZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Thu, 15 Feb
 2024 17:58:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 17:58:29 +0000
Message-ID: <79e94dcc-5482-47a8-bd72-3dffc417a390@amd.com>
Date: Thu, 15 Feb 2024 11:58:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm: Add support to get EDID from ACPI
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240211055011.3583-1-mario.limonciello@amd.com>
 <20240211055011.3583-2-mario.limonciello@amd.com> <87eddd6d41.fsf@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87eddd6d41.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0086.namprd05.prod.outlook.com (2603:10b6:8:56::7)
 To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: e16a31af-4f16-4d67-b601-08dc2e4fb779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFtiWQYjxsDZ6fkzL59odPsVk1ejwAuK7tdcbQNwasKbQs+4iaMuUDZjjMJHGpWQbdHVjdR62BNGgfuM+qOFcoIq7sI4e28g9RsfEEXbEl2Tt3n1nAr9t0Pg4mEAo4SqlrEyM7wAyhbWnz3dOATinnRljlDLKFIc8iQS/V7JThJ+Y/nq/7n0pR5TMBl9eucN1YjCaN0Sh7MGI+t0AZjgZOmONcPmuu0OpJF11mFCoUaDqVmQo5d+AxyoWzn8NbgdkjOo75JAWaguA7N3ty7fl/Ntp5szTAaMrh0NKot0du9Rn3t5iAJXztTgQONCGRi+8Vmm7Yb+K5/Ov7SoTuJvgCI2ykxu/Mkud32frVZJGBPOnD0LHG1zvUF+9rTS1pavvjsxcWQ5v1qiIm/nzZXvn9HAYuk/+BYAJYtofGS0BZ7LEBOC34tJeCs0II9wlQu/lDAbhSwlDK7t0hjgus1gPleTfJGNdAS4B6m9ttxlwuFZZIXf5aB07x80Nh9tUE9E5sF5RGnk5bZhJxelyYr/jKqYhmedqmtqMHCURoZdb6F0gI667rpTcqeMBdGt19MW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6512007)(478600001)(6486002)(31686004)(41300700001)(2906002)(5660300002)(44832011)(4326008)(66899024)(8676002)(8936002)(6506007)(66476007)(53546011)(316002)(66946007)(110136005)(54906003)(66556008)(2616005)(83380400001)(31696002)(86362001)(36756003)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkltSTd4UGpKa3RKdzNvRU1odVJ0R2ZOZ1ZJQjdlYXFaMHhMbmErVktoS0hr?=
 =?utf-8?B?S3M3Vmx3eWtEK1dYSWc2N1dDU2NpQ0NlcFJQK095ZDJFcEI3SVRrenBsNUc3?=
 =?utf-8?B?YytYcFplaEZicjlFVVFncVJBMWF5eTRJbGRHSzJzcVIzamQ4NFB6ci9vYk0v?=
 =?utf-8?B?U25wN0p2N3pOaHlxdTMrOWdBaDF5UncvQVBiLytaYmN3QUpCY0NubTRwTk04?=
 =?utf-8?B?cjI2eDNxNmxLYVVBQXg3UTlDZHl5SU1WbnFMVWRtL05WL3YxYWtqZnZ6eXNV?=
 =?utf-8?B?ODVWUEZ4bTl6TS9wWEo5T0VBQ1ZoVXgybVhhLzYvRWEzVWtCYkFES1MweEJF?=
 =?utf-8?B?Z2JGRmZxMnQ5ZVVmcFp1bTJWQmV0SUVIcEpheHBoRllwOWY1MGtEb05WeTFV?=
 =?utf-8?B?NkhUQmY2c2ZYMnZPZFlDbEJnSDlKS1dmSzFtWVk5cmNqeGdxL256MEIwamVC?=
 =?utf-8?B?MER3ejRjUFUvUUZmc1F5TEFZQklPbjMxTUk4TTVBaUFudlk0akJGdEcwQS91?=
 =?utf-8?B?THhuSG9nOFl3bC9YMGZCM09iYzJLN2VQYVgxcmJlb2kvYkFKRm0yYUwvTUdw?=
 =?utf-8?B?QkFlMHRzdUllQTludFRMbjQ1c3dHdlY5Uk91aUMySk8yTWd5cEFiQTlMMFRH?=
 =?utf-8?B?WmNkMUI3MUZHbkNoY2ZLd2RzL2cyamhWWGNodGkxM1RjYWxyME9LNHd2d29N?=
 =?utf-8?B?clNXSXg2eW1hdGhxVzlwOWgweFRYMi9XeTlQVkdwY0ZVbGNZT2lKTU40WWpW?=
 =?utf-8?B?SnNrYTN0ZitjeGcwaHRXenlMZHR1Z3ozY2pMYWpKL2R1MlE0akFscmd1L2ZF?=
 =?utf-8?B?RTdaN0g4TEI0Z1gwRGZGUWRuNUI5Q2xWbHBtekQyQTJDQTR6V2RIV1ZWNVRE?=
 =?utf-8?B?Ri90aTA3ckxlVE51VFJTUVp2aDdtWGtkQXJGYlZvdUh1Um5hU0tQTTJiRGM4?=
 =?utf-8?B?K0tXd0w4NjZhUm9QNE42YXlJMExwQnBUekswTTNCQUtPTytlOWVBWmJaOUlm?=
 =?utf-8?B?SWVOa2c2N0h5YUxyM3FCbXRYVm9rS0FWa1lMTEphbm5DT3BGM2kxUlI5N3hN?=
 =?utf-8?B?TXU1bHVkKys2cmxIU2NKcWI4QU5SNjNPbmU2eE5qOUxkVjZVc0JJRHN5QWtF?=
 =?utf-8?B?c3Z3a09BcCtVN0c2NnowQXVIbVhUbWROTUE5dXdaM0ZMWDhTSlhNTVF5NDlq?=
 =?utf-8?B?bEthd1JMRk40bGR6dENPNVhSMVV5bFhoUzFBRUFYb25tWkVCT1AyUEx4OWFo?=
 =?utf-8?B?TXV1NUV5V2E1M0FzVERTUWdGM25yUjU3Y1VvUXZHYllHUDF6NlhGQjIxWFI2?=
 =?utf-8?B?SFhvT3hQd0lFUmlNZnc1cVpiZGRDQmVIbWxpT1hOSDBOUjFmTDhsWDhpc1VX?=
 =?utf-8?B?UHc3Rld4d2xacUxNTkh0ZjBUdlpNVWt4UmVqakJOdDR6dFNzYVBZUk9Wc3VU?=
 =?utf-8?B?QWdKdEk1cGQ1bGxJaloxK0EydWJkNEpmVWhPUHgxMlp6MFlkVU1pZkRBNk5u?=
 =?utf-8?B?NXhQck54UGZGSzdPOXlVWnMydDIrNWU3Q2dpVlFtWVdPazRYT1hTaEE3YXVY?=
 =?utf-8?B?Tk1tM09GSHVJQTRXZVNycjVNb0orSVk5QmlsUDFmRnE2Y0JCYUJSWVZ5OW02?=
 =?utf-8?B?SE0zTmloSUdLUWp0d1V2Y0IrMVg2enJrd090YUhFQXlqQkhtU3k0MkVlMnIz?=
 =?utf-8?B?VnJEdjJ4emx4bHY0Q1VJY015cVRuRmZJdXM0Yy91QVBBc2wwcEpqNE9aNU1o?=
 =?utf-8?B?aWFoZm43d1FjVi94WUhLYkNRb2FkZkJ3LzhOUk92QzJTTWdDaGFzMzkvWlRE?=
 =?utf-8?B?NHRIdGtsV0ZEZ0tlQUhKT08rR0ZvbDR6U0RzU0t4T3M1QnFNcmtsbm5wTkFq?=
 =?utf-8?B?UWk5SHdHdzR6WkZLdjdhZVM4ZURETDg2ZnQzYkpqVERIT2RLS2l5UWRYNHlh?=
 =?utf-8?B?bnM3Rnc1OWw1amZ4anBmb09xdWNGVEx1eGp3b2tpRy9nVlhvTXk2bVhuT0lw?=
 =?utf-8?B?ek4wZ0FjS2FpcDhIYTExS2o2U0tMV1NlNmFMbHdDVzlRQ0VMb1QrU3ArZjdJ?=
 =?utf-8?B?MEY0QU1zUFdVZWhkMU9DbEhrcVNOR3g3K3VoM1V5bktNRG91eGVidDJucmU4?=
 =?utf-8?Q?CPH6aX0wltKrYEvWqN4P53cC5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16a31af-4f16-4d67-b601-08dc2e4fb779
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 17:58:29.6576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsSvIprd3QzzTxYmsRW3lj16hcFlgHtzK92BEEod8WI6wuZon3YN0tcaQ3TztsgjMm/GmToPFudc9oxibxxMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940
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

On 2/15/2024 08:01, Jani Nikula wrote:
> On Sat, 10 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.  Drivers that prefer to
>> fetch this EDID can set a bit on the drm_connector to indicate that
>> the DRM EDID helpers should try to fetch it and it is preferred if
>> it's present.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v1->v2:
>>   * Split code from previous amdgpu specific helper to generic drm helper.
>> v2->v3:
>>   * Add an extra select to fix a variety of randconfig errors found from
>>     LKP robot.
>> v3->v4:
>>   * Return struct drm_edid
>> v4->v5:
>>   * Rename to drm_edid_read_acpi
>>   * Drop selects
>> ---
>>   drivers/gpu/drm/Kconfig     |   7 +++
>>   drivers/gpu/drm/drm_edid.c  | 113 +++++++++++++++++++++++++++++++++---
>>   include/drm/drm_connector.h |   6 ++
>>   include/drm/drm_edid.h      |   1 +
>>   4 files changed, 119 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 2520db0b776e..a49740c528b9 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -103,6 +103,13 @@ config DRM_KMS_HELPER
>>   	help
>>   	  CRTC helpers for KMS drivers.
>>   
>> +config DRM_ACPI_HELPER
>> +	tristate "ACPI support in DRM"
>> +	depends on DRM
>> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
>> +	help
>> +	  ACPI helpers for DRM drivers.
>> +
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"
>>   	depends on STACKTRACE_SUPPORT
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 69c68804023f..096c278b6f66 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -28,6 +28,7 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>   
>> +#include <acpi/video.h>
>>   #include <linux/bitfield.h>
>>   #include <linux/cec.h>
>>   #include <linux/hdmi.h>
>> @@ -2188,6 +2189,62 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>   	return ret == xfers ? 0 : -1;
>>   }
>>   
>> +/**
>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>> + * @data: struct drm_connector
>> + * @buf: EDID data buffer to be filled
>> + * @block: 128 byte EDID block to start fetching from
>> + * @len: EDID data buffer length to fetch
>> + *
>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>> + *
>> + * Return: 0 on success or error code on failure.
>> + */
>> +static int
>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>> +{
>> +	struct drm_connector *connector = data;
>> +	struct drm_device *ddev = connector->dev;
>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> +	unsigned char start = block * EDID_LENGTH;
>> +	void *edid;
>> +	int r;
>> +
>> +	if (!acpidev)
>> +		return -ENODEV;
>> +
>> +	switch (connector->connector_type) {
>> +	case DRM_MODE_CONNECTOR_LVDS:
>> +	case DRM_MODE_CONNECTOR_eDP:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* fetch the entire edid from BIOS */
>> +	if (IS_REACHABLE(CONFIG_DRM_ACPI_HELPER)) {
>> +		r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> +		if (r < 0) {
>> +			DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> +			return -EINVAL;
>> +		}
>> +	} else {
>> +		r = -EOPNOTSUPP;
>> +	}
>> +	if (len > r || start > r || start + len > r) {
>> +		r = -EINVAL;
>> +		goto cleanup;
>> +	}
>> +
>> +	memcpy(buf, edid + start, len);
>> +	r = 0;
>> +
>> +cleanup:
>> +	kfree(edid);
>> +
>> +	return r;
>> +}
>> +
>>   static void connector_bad_edid(struct drm_connector *connector,
>>   			       const struct edid *edid, int num_blocks)
>>   {
>> @@ -2621,7 +2678,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>    * @connector: connector we're probing
>>    * @adapter: I2C adapter to use for DDC
>>    *
>> - * Poke the given I2C channel to grab EDID data if possible.  If found,
>> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
>> + * poke the given I2C channel to grab EDID data if possible.  If found,
>>    * attach it to the connector.
>>    *
>>    * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> @@ -2629,20 +2687,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>   struct edid *drm_get_edid(struct drm_connector *connector,
>>   			  struct i2c_adapter *adapter)
>>   {
>> -	struct edid *edid;
>> +	struct edid *edid = NULL;
>>   
>>   	if (connector->force == DRM_FORCE_OFF)
>>   		return NULL;
>>   
>> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>> -		return NULL;
>> +	if (connector->acpi_edid_allowed)
>> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
>> +
>> +	if (!edid) {
>> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>> +			return NULL;
>> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>> +	}
> 
> Hmm. So do you want the presence of ACPI EDID to determine whether the
> display is there or not?
> 
> Note how the override and firmware EDID mechanisms only override the
> EDID *contents*. They are orthogonal from connector forcing. So you can
> override the EDID, but still rely on the DDC probe to determine if the
> display is there.
> 
> The question is, how likely is it that the ACPI EDID is used not just
> because the actual EDID is bogus, but also because the display just
> doesn't respond to DDC at all?
> 

The cases that prompted this the panel "responds" to DDC fine, but the 
EDID data doesn't match what is expected to be used which leads to other 
unexpected functional problems.

> If possible, I'd like ACPI EDID to follow the override/firmware EDID
> semantics on this.
> 

So basically probe with DDC but if the driver specifies on the connector 
to use ACPI if present then try that (similar to how override is only 
used if specified by the user)?

>>   
>> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>>   	drm_connector_update_edid_property(connector, edid);
>>   	return edid;
>>   }
>>   EXPORT_SYMBOL(drm_get_edid);
>>   
>> +/**
>> + * drm_edid_read_acpi - get EDID data, if available
>> + * @connector: connector we're probing
>> + *
>> + * Use the BIOS to attempt to grab EDID data if possible.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> + */
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
>> +{
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (connector->force == DRM_FORCE_OFF)
>> +		return NULL;
> 
> If the caller handled all the connector->force stuff, this could be
> dropped.
> 
>> +
>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
>> +
>> +	/* Note: Do *not* call connector updates here. */
>> +
>> +	return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_read_acpi);
>> +
>>   /**
>>    * drm_edid_read_custom - Read EDID data using given EDID block read function
>>    * @connector: Connector to use
>> @@ -2727,10 +2815,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>>   EXPORT_SYMBOL(drm_edid_read_ddc);
>>   
>>   /**
>> - * drm_edid_read - Read EDID data using connector's I2C adapter
>> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>>    * @connector: Connector to use
>>    *
>> - * Read EDID using the connector's I2C adapter.
>> + * Read EDID from BIOS if allowed by connector or by using the connector's
>> + * I2C adapter.
>>    *
>>    * The EDID may be overridden using debugfs override_edid or firmware EDID
>>    * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>> @@ -2742,10 +2831,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>>    */
>>   const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>>   {
>> +	const struct drm_edid *drm_edid = NULL;
>> +
>>   	if (drm_WARN_ON(connector->dev, !connector->ddc))
>>   		return NULL;
>>   
>> -	return drm_edid_read_ddc(connector, connector->ddc);
>> +	if (connector->acpi_edid_allowed)
>> +		drm_edid = drm_edid_read_acpi(connector);
>> +
>> +	if (!drm_edid)
>> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> 
> This should be in drm_edid_read_ddc() not drm_edid_read(). Please let's
> not make the two behave any different. It would be really weird if one
> had an ACPI check and the other not.

OK, I'll move things around.

> 
>> +
>> +	return drm_edid;
>>   }
>>   EXPORT_SYMBOL(drm_edid_read);
>>   
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index fe88d7fc6b8f..74ed47f37a69 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1886,6 +1886,12 @@ struct drm_connector {
>>   
>>   	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>>   	struct hdr_sink_metadata hdr_sink_metadata;
>> +
>> +	/**
>> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
>> +	 * This is only applicable to eDP and LVDS displays.
>> +	 */
>> +	bool acpi_edid_allowed;
>>   };
>>   
>>   #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 518d1b8106c7..38b5e1b5c773 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -463,5 +463,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>   
>>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>   				  int ext_id, int *ext_index);
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>>   
>>   #endif /* __DRM_EDID_H__ */
> 

