Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC27EECEC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 08:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C24810E71E;
	Fri, 17 Nov 2023 07:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D3810E71D;
 Fri, 17 Nov 2023 07:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv6BkZngwwvSFeCykVfBLnksKjplAJfxGtXFcKSagUjj9++ypr8dkAkC1EyqOSxUNRXT+0mZEZ0RbCVlTo29xDdSPZEFwijPKiChyc/kraLhVpSilPd1tlYubRRkNZ3db9909ripOevHUSHSzpIlhLKJ7DEG21Ba0LqBfQrVC8EJD8fNDpErueA3jElMvbfl8b8vSx1F2JXaTTv8MPs+JYdqOx0QEz7CrVCDJPPH7kkPkpHqQAjQTOnvn04LomBWSodQfK+TR+5fk2MDLZfT/rPCXQNqoiaho7KYrpt2nUshHvIAjCjHVPpL+5B0mciJSDTDU3tJx7NCtUn0cN43+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1UrPXe2seOTfH3+NTqXq8SokxHXOiudUojy+Uydynw=;
 b=UD2PV1ugM8CbQtKvYCtoBtYD3/dEM8i9CJGpy6JD1QMHmPOXHZEY87XIsXDkz26VKiEzNgUMxLkGpwQWaUwvmcRQx0E3kA4oXbM3m1e4Ibxmkm9Ve3gAkzkKvmVurR3b3LhKhbsCJaybJaMkVjQDcVTkAAp46F/BQSRqNKansxhUYBrkr92n39DkmrVZxiJZPQSEOE8tlBB5rpDeHcvSNZog3lk6t2mIVWlFSdIfCVIYw82g6wypa9XDj5+L/1tIN/oitNJ+LEFr7CpX+j5NLFcxx3LUHy+mXuKdpMgric0B6DF7/4XIaIiTQuU9oG2ewF+siia5IJqRIlLXdUqHAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1UrPXe2seOTfH3+NTqXq8SokxHXOiudUojy+Uydynw=;
 b=4e6W3sv1YQczSWbWzD/SQp58ihSEEJIWW629Yd9K1jkiyPlLq1sN9VZ6DjMo4HvEbpXwCKRj8teAz0Xd2/nWK9j4VYjDHVbKPG2Cd5B93924b2jLnkvvXEL2kh2c11VfOPlAiwZhVYMnBfWZP2asS1f4oAqGWH5wLNuJR7uWyKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 07:46:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 07:46:58 +0000
Message-ID: <8f12536a-7864-44f9-ae0a-d3219c9d0cfe@amd.com>
Date: Fri, 17 Nov 2023 13:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] platform/x86/amd/pmf: Add facility to dump TA
 inputs
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-11-Shyam-sundar.S-k@amd.com>
 <ef47873-9c61-65c4-4b4f-deef1959de71@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ef47873-9c61-65c4-4b4f-deef1959de71@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4eb8a5-810e-4c80-f107-08dbe741604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bchubKRTWjj/nrnZMlfRM5FHzEAeWkLzx6RtwYaMDKteE9VESv68DlPkVXMvKQqxJ4sFgS9FozasxQVeLn+bf6rwKC00pL6OXScLVAA3vONcqkEuVTVb8GrywGGyT5LFpDjKP1OCGILYra9Klr3eywexhRsuWUEHOFak5FHt+a5z2rutQT68HuOLnFtI+M0JuhX92JP73UNNxP6h+aHxW3TRCJrvIvAlso0UfR3ZgKWLttwd3CGM+gDWuynCtMaMXarDonZTW+Tbt8u7r5p6x79vK6OT5KEqRIINPLQaG0cWTQUSVl/JYAfbFzysyPAqkIRvM3zTXlNfjez7il88XEGLUg6aNndlLmyQaw/UpLzrFhWlmcqfLpxsNO+DQ65BIo1fURksS8KaZ6ckIWtbaOLRMDse0XID69hf3v7Ajxi8aPJvK7Yf2aV9wckUU2We2Xz028cb3O20socNA/YyxxhLhyYUKd2JZHcREbhZT6z3FE6sZVD4/9gEwYIjlT3qYmvnsJp14l92G2YQ2gpDxFOU/OlYUhpbujqSHaaCO/0s6YwnvXpyMdpddvW1wALKnGayVAhOwtkB+Ho/+ehKNz8x2TYp0qxViJTrvSh8lze3Yr4qF7ujlUA9O/+s0b6vNUPoL/AkdEyqqUYzN6yyZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(2616005)(38100700002)(66574015)(316002)(66946007)(66476007)(6916009)(66556008)(41300700001)(8676002)(4326008)(8936002)(36756003)(31696002)(6486002)(83380400001)(478600001)(26005)(86362001)(5660300002)(2906002)(7416002)(6666004)(6512007)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNhUDFjNXVVc21yNGhqWnpkOFlaeC92T0g4Q0t6TUlSSnAya0hyR0VXWlZQ?=
 =?utf-8?B?NVR5S2ZDMlFkajdVa0ZzTFFqcjNFemlHUFR4V1NydFFTb2pvNi9kVlcwQ3ZY?=
 =?utf-8?B?alc1WGtueXRGWEs5dnpVL1oyQ0ZadExjY0FOMm9kdG5VOU1RV01RRFpJS3Fm?=
 =?utf-8?B?TFN4UUNXQ0w3eEtWdTFNUmRnaVJobVZkaHQ3cnBld2ZQR1E4UjJSNXZHcTMv?=
 =?utf-8?B?MDNBc25qZ0hDSHZDamFzSjFQVU1jbFBuSm5Jd0dxQkxvVks3ZGc4c1JuQXpW?=
 =?utf-8?B?RHMxRTVPc3BrSXQrM2FwNWF0WkNmaEJhU2dXUkIzem9HR3lRUytnY2hFbG5O?=
 =?utf-8?B?UTd4bFdyeU9mSjFmSWhjM1BEeGhMRThCdzFReTlIRjBZV0poSU1KZ2Zrd3hl?=
 =?utf-8?B?LzMxbjF3cEN3UW5mSldWbXVTSzdrZ2VSajh0b1U1bzNEMVhHV003UlhqM3Bu?=
 =?utf-8?B?THAzd1k0Um9zc1pVN3RzUjdRR2tFcWlJRDFMSzIwRWFqTS9TZjJyaFBzbWZL?=
 =?utf-8?B?NHFLS1lvMmRQQmhCV2tMQUFlYVlMRG9ya2lka0E5UVlZTUFWZ0RBV0ZpSWYw?=
 =?utf-8?B?Rjlha2FXY25vRzJjUjB6cVczUFdqY2lPL2Z0a3Z4UlVWQXZ4TGs1aTVBVC9i?=
 =?utf-8?B?ajM5SDhPY0pNTExqZEp5a1lRcmhrQ0prMWY3TlBsSkRQSkxWMGQ5dkxYU1hS?=
 =?utf-8?B?WWg3d2lIRXJUZURkS3ZYclN1RHNjOERJSDE3RTBkditGdFI3Umo3Uy9NZHZN?=
 =?utf-8?B?eVVoZ3N6TEsycmtyRHo2d21HODBrMEx6RTBMUzBkeWZPVGQzVENTbFZJcW1O?=
 =?utf-8?B?RUs5bWd0ZWdwcWxPYWdvcmExMi8zZng0WElSTnZ6bEpZQU5mMVpFTm51SnpG?=
 =?utf-8?B?UVBrTjVnU0laQ1Z5ZUZHcmVUMWpVWDJXRkZYWUF1L283OHp2eUQ5QjQrMFBS?=
 =?utf-8?B?RDUrSVVwS0FSUExya2llMW85YmdwKzc2Zi80Tnpzc1d5cTFWSXMzd0owQkVN?=
 =?utf-8?B?b0s2MWZ2UWhiM2U3SE10eUNOd0ttS05LdGZFWUtkeFBZMWdtMDM3QXdGSVJZ?=
 =?utf-8?B?WDMxRng2OUpWWWo3ejdCNnNrZ0Y3Y3EwODVmSGN2TlhNUmhmU2ZYTHpPUk5h?=
 =?utf-8?B?SWxOenZ1cktoeDZmT1duNTV1cE1FcXEvK1p4YTJRR0t3bExJbjJyeEk2ejZx?=
 =?utf-8?B?N0FZaTJqUzlQQTJWajRvRVRGNmZMZmNRTllEZFM1bmlMU01ickpEUjNMcjFE?=
 =?utf-8?B?MElqMS9sOENKVWViVFl2anFBaVU5VzJVdnIxZ2FlVVk5VXE4em9ac2thMVFw?=
 =?utf-8?B?QmFndXpvWUZqWWhVbzM5ditYWDJUdjlsTjhiVngxVHBCV1pSWFpGbjVrMnQ0?=
 =?utf-8?B?QkdLQmZuak8xSWlnaWZuZVdrYUlQZm9VakE5Z2JPL20xcVRiajhrZEE1Y0kv?=
 =?utf-8?B?T1V2aEs2YjZmYzBrMHcyekNuU2sxOGtORERxR0ZlYVZJbnlPMWV3dytIaGV6?=
 =?utf-8?B?QU1hRzFVYzltZEd3Rk45cGNBdi8zRWJ4UlJmK3kyVFlGZ2lLTkZLNWdpY1hr?=
 =?utf-8?B?WVB0Z0I3aWVtZVl1RU9SZ3lsbDVhVXRBWjdhTnB6Zzh5Z2l1cjdPVWxuZU96?=
 =?utf-8?B?dGlLc1VlRzNUZldzNkNVRW11bXdObnVmakZMK3dlOVVTNzBIVTVsMzdjZHNu?=
 =?utf-8?B?bzU5Rk1LR1lOVmxta2kzWktta2I0UytlcjlMNFJsMnJjMkg2OXl4TVh5V3pi?=
 =?utf-8?B?WHdDeFhGUWdHRFlvSTdEWHdRM3VMNkZ3Njgyc0x6UVBxT3lxb1RCSU5LeCt3?=
 =?utf-8?B?SjVseWVCbE1EZ2FFWEZPdVo5bmU5azA4ajZBNlhRdnM1T3NaempnNWdDbFRV?=
 =?utf-8?B?R3JJUXVmVlh1aDczcnV4SXFHZ095bEVqbVlOWWpCMENteEZZVmFIbW9Ob1ZH?=
 =?utf-8?B?UTZMM0Y4ZVRYZkJ4WVJGL091eDZacGZheGNnVTlENzRROTI1NlV2MlU0bURB?=
 =?utf-8?B?VkdoY0NjR1ZjNTJjVWV5SW5RZVN6cnhaaklFNmZIbkFuSGMvQ3ZXVnp2UXk4?=
 =?utf-8?B?cndxOG9sWFZzOU1MSDF3YmJmYXdzb1c4cDk2c25ZRXlFNmpZZWIwZ3Q1ZzVL?=
 =?utf-8?Q?vpYD5L17oa2Qm0UCETvOVPcIs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4eb8a5-810e-4c80-f107-08dbe741604e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 07:46:58.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmbnmSAiPtiZlVrDJjh12ZbFn3YtVEibmgFPaRgfL2meIN0phZwcnNgEs1+lcuNXmjSBwWP34Rakj7m7s6GmkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ilpo,

Apologies for the long delay.

On 10/18/2023 2:30 PM, Ilpo Järvinen wrote:
> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
> 
>> PMF driver sends constant inputs to TA which its gets via the other
>> subsystems in the kernel. To debug certain TA issues knowing what inputs
>> being sent to TA becomes critical. Add debug facility to the driver which
>> can isolate Smart PC and TA related issues.
>>
>> Also, make source_as_str() as non-static function as this helper is
>> required outside of sps.c file.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
>>  drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/tee-if.c |  1 +
>>  3 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 216a9f795436..593930519039 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -602,6 +602,7 @@ bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>>  const char *amd_pmf_source_as_str(unsigned int state);
>>  
>> +const char *amd_pmf_source_as_str(unsigned int state);
>>  
>>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
>> @@ -632,4 +633,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>>  
>>  /* Smart PC - TA interfaces */
>>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>> +
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index bd5061fdfdbe..512e0c66efdc 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -14,6 +14,43 @@
>>  #include <linux/units.h>
>>  #include "pmf.h"
>>  
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +static const char *ta_slider_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case TA_BEST_PERFORMANCE:
>> +		return "PERFORMANCE";
>> +	case TA_BETTER_PERFORMANCE:
>> +		return "BALANCED";
>> +	case TA_BEST_BATTERY:
>> +		return "POWER_SAVER";
>> +	default:
>> +		return "Unknown TA Slider State";
>> +	}
>> +}
>> +
>> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	dev_dbg(dev->dev, "==== TA inputs START ====\n");
>> +	dev_dbg(dev->dev, "Slider State : %s\n", ta_slider_as_str(in->ev_info.power_slider));
>> +	dev_dbg(dev->dev, "Power Source : %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
>> +	dev_dbg(dev->dev, "Battery Percentage : %u\n", in->ev_info.bat_percentage);
>> +	dev_dbg(dev->dev, "Designed Battery Capacity : %u\n", in->ev_info.bat_design);
>> +	dev_dbg(dev->dev, "Fully Charged Capacity : %u\n", in->ev_info.full_charge_capacity);
>> +	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
>> +	dev_dbg(dev->dev, "Socket Power : %u\n", in->ev_info.socket_power);
>> +	dev_dbg(dev->dev, "Skin Temperature : %u\n", in->ev_info.skin_temperature);
>> +	dev_dbg(dev->dev, "Avg C0 Residency : %u\n", in->ev_info.avg_c0residency);
>> +	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
>> +	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>> +	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
>> +	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> 
> "open" / "closed" is generic enough that I think it would warrant adding
> include/linux/string_choices.h helper for it (it should be lowercase 
> there but that difference probably is not an issue for these debug 
> prints).
> 
> I'd also remove that extra space before :.
> 

Seems like string_choices.h does not have helper for open/close. So
did not include this change in the next revision. But I have addressed
all your other remarks in v4.

Thanks,
Shyam
