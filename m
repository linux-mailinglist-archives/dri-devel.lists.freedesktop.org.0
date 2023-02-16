Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2269A288
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34F10E1A2;
	Thu, 16 Feb 2023 23:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6592A10E390;
 Thu, 16 Feb 2023 23:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh5WeTfadghgHWHm8QnkFXypxRlbgvT83wrby7tSt1z9dppaopV8XcpoTA52kKwz8pXupwUDm4K5PEk2V6UrCm97K9nE1bPnGiPs8mEiLKgfU1HDh7FGx0nG6g1j7DYJLyaXtw5YQoma125s3fbiD7p2/10FYehmwq+zFhttd4k3Ml6wuFGwGs+Y4j7poHgm8pc0NfskcAk7llofo7YyqoORt2rq3VSDG8q+AZBqymmSVAyKpughJDKnlQ6B6GjmG3lJl2SKu63tU8dJqwBhjqxchX9AI6NxMCHBbCaLmtPt62df6wPteIv8cwTBAx2cEaHYOXv0Koc2dBhkpl4Gjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDxNfFqddn6doptEGqee7i6OPH3p3s5G/+Sq8oHLGeo=;
 b=eNfvKpfIZMuCwKmd/UPODWPcAiIKFs/KDm8vUU2wd+OKnp/rWQagKhh+MXLdSr9efMplOc+oVRFqpFHjygUeGIVewAZ1xQzdbwRwfGJ2jD3+uoSb/SoQLNfWEWRbJOF0/oa9T9HaHAj5Qwxp872IvBpw+jU9IfzuIxqsM7BlpMvs6v7hp7dIDL3XaHdpysczlV4AkAfdb4Cf8t8xugRxQPbB4lFIN7ankCZBSfw5BUVIJwM1eMDuQR3uRa3MOjObi3eyKSBTEJCMSZYfGmSlOs6PtKQrE+J9j7yhzQxiA/U2uPidxUz+dJGz5Y29deecevAhb9Aq2t2K9ilx/B90Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDxNfFqddn6doptEGqee7i6OPH3p3s5G/+Sq8oHLGeo=;
 b=vjpK26cRb4/eQRkqfkzEYe01KF50ri7VL96JGwFLzu6YYotTZ+yy58Yp7wqlf3xzaY3YOILh1NsPEDR3etH4XgKSF6eUfq153r4XSeUiYVaZp3h2BEERGd0eH3w4wQsdxMvPYsKt7QaNq9MGUcbbGUeW6I4TPMwcit/F9uDoRcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:44:53 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:44:52 +0000
Message-ID: <bcadb2e8-247c-1a3e-c5ef-801dbbcc3286@amd.com>
Date: Thu, 16 Feb 2023 17:24:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/32] drm/amdkfd: display debug capabilities
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-3-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-3-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::49) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ceb14e-0ff0-4876-18d2-08db1077ccda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNf9H57ENi+4E++h9RxU3NKVgUWbBXWU5pvoJ7GSICODV/f/nKuHM876QeQ5UBRfXBb3jkIzn+l8mjmixdAmmAiwzQT3zbKBvtOASsZIKAB+FKxOXtOsdO5Om/8QkKQMpIycbpVkMFHSxdO/+KdfByFdTxD0+4JHL35vSWCKvmzGoGVrP5XcS0/C0xIJQqPxBegUJKfqQnllpvD5kP6sQg39edscADapfLmoNPOLgd/A7Gp7/3FOZLNnQvnIf/B8Vt4dhI39trrOklZMZ4RzJ26aUIeIqbCRmE32tm6x4uRobO0oRViBsPvgbB0f7pFxLYNtcJnswgLrYeYrBg3lxUwUE/7GG0LI3GnwOhWtN59FCEah82/82IPg17gVDxvkQSKW0Zbw6MaA4WbJM9xXB1wbipBL/d/QwhDHjRT8utXO66Myu6yZi2ts006nV6u8n/G0TtDW9WqEFJumUuk46ClV72zOvdtxWOlp6NQkEnebN4nRkpvXn6rADsq4mph9fxsJhzXBq5ylVrQMRWvAZVXyJNycmc0V81d+xOPE0XcLq+FZU8q1zxogJCLXkhFYtZqjHi3CK4W65J3QG43mPNpixO9Tdg2NTggVy0ja/jxX60VubLu7RzZmS3jWrUq0cg60yEuB3WHWukHtXYgIKW+aUcCgA61ZooekQnFjiWxvP+FWFzEiKnv7pO/t+5eZN/UP9kvuXYfrA7C/UvYxDeneCQ3a233TLYzLN+pMMzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJQWTR1R0Z2L3J0TDFHL2pyTG9IWjZiOVF1Z3cvczVjdFVWYnhxMmh2a1g0?=
 =?utf-8?B?VzRQNHFNbUV1VUFiMWpqbkRVNldDZzFoeFVpSGpaL2ZWek5Ga1lOc1R4NW1u?=
 =?utf-8?B?S0N3blNDS3FFdVdYM002eStOdTU3R003eDZiTnk2U09sTUpkOFM1MWxEQzg3?=
 =?utf-8?B?K3NwSlo5ZFpCUkJUQ3draXNDRi9FckZlZDJ4NFFWenhZelg5Ym5YdEJGWFF5?=
 =?utf-8?B?MGlvbVg4c1pDRUZXazJxVGxRUnBlOHAwWHlvcDNtbXZ6MkF0YmpSRURSalh6?=
 =?utf-8?B?Rk5jYWMvMnhScVpGbTRia3I2cGhrcjE4Y1o4VGFCRW9nbHJSc1hsMDNGUTEr?=
 =?utf-8?B?ZW5peCswOEh2eVhGYldUREJGTDlLQTVST0pFeit6V2dNNVBPSXVGNTZwdVA3?=
 =?utf-8?B?Wk51aVViM1BCUDFiYXFselNBbjZPUmxPbEVKOS9nRVhLUjE2Q0tDL0JGenJv?=
 =?utf-8?B?OStBNkhQUURMRXJIQlQybmljK1ZoZTl2Z2VKNXk5MERBVlplMFJ0cGRmclI0?=
 =?utf-8?B?VWNqalNBcW1ldlNaVVBxcWRqWlZIbFhHWXlXWWNGYkRSMENBOXNtdnJnSmxJ?=
 =?utf-8?B?VHM2eC84YXhmbUdwSTFEUkJRL1ZuaVRkZ09Pa2crTEFyc1V0eHZWK2dKU1hq?=
 =?utf-8?B?c3crd1hTOTNYVUJHcWxUKzVaOHFHMG5keE9aU3pLdnB5MTdwT0xwV3BSQnpw?=
 =?utf-8?B?Z2xkVWR1VGhXbE9LUG1kMS9JelFEbTJRNWdVU3pXWFNyekNUVmxWM09jZ0FY?=
 =?utf-8?B?ZDhSb2RLdHh0KzBZbzlCVmFyZ2xSZ2dRRXZ0UDZSUFJYc3VrNEVlQkZMUWQ0?=
 =?utf-8?B?cVc2ZjlRN25OdzZYNzFrOHlQMEdGbTcxVnViWVg5SkltbXFYZFBpcTBJYmhL?=
 =?utf-8?B?UEIyU3BSRVZiV0NTL0lUUE40cVdpQTZTYTl1RS8vcjlUbjNsQmo1cmZ1dGdy?=
 =?utf-8?B?SGRLTXhNQXRnUWJSSjRPeEJiNVEyNXNPUjl3ZDN3Y1UwYlZYbjFDMkxDaXI4?=
 =?utf-8?B?NkU3aWVRZUExMWRmL1JTdFlpbTJvdEVBNFBudFFkVnM1bXljb0wwbFR1cE5a?=
 =?utf-8?B?TzR1Y20zVU5OR3l4em5Dekx1NmhsUVlLYmFHL1hVMzdpVzkwMEhxaDNReWRl?=
 =?utf-8?B?UVEweGF2MmtBTndXYXN1OHlKRnB2WEdkeXdvQy80OEd0M1l1ZER0bnloMyti?=
 =?utf-8?B?R3drelVOekc5YzBIR2NYNTdtV3Y2T3hvSENNM3VGQWVYLzJiLzJwWFc0Szhh?=
 =?utf-8?B?R2I5MURUNXhIbkMrWVdWWVorV0pCaFd2b2RnWlByZEhjRWNLUEE3UXQ1cHRV?=
 =?utf-8?B?WW5vTWpiaWxRMklPNFVxWjE0YkJGYVBSWU9XWXJKcXdPMURiV094NFBMdk1H?=
 =?utf-8?B?S0IvUkZJMGNlWWVZWnVDY3hCekNMeGwySzNXZFRKKzYwUFZGVk56RDlITUtM?=
 =?utf-8?B?ek5FUkc2b2UxMW5IUi9tazdZUEZjck43N1dFTVVuN3V6OFJJK3YyTGlEcWFJ?=
 =?utf-8?B?L3RzTmJ4T1dMYlhFMFNEYmhmS1lxWEpxU3hJZ0hnZTZPbEFiU3BUdE1sWnI4?=
 =?utf-8?B?WWVacDVvMWJBVDQzUHQzVk9lbCs2Y2ZSUkVnb1gxUEVhODZNNGlObDZ6M3BT?=
 =?utf-8?B?U201UEYyd0FNRER4aFZaQmVDd09INnY5ZlRVY0YrTmx5ZnowTHBBNnFiemU4?=
 =?utf-8?B?cGZYSXpVamJhR1Ird2NvTEJFVkxHbFlEbDU3bkxEWXh5cTJSN1l4dDFpZDBM?=
 =?utf-8?B?Z2NqV3l1L0VTQWVWVmpCZUFqZ0dueDV0cHlIU2crYW9mRUhhNldVVnl6bmdu?=
 =?utf-8?B?NDV0OVEyb1lFYXpzenplQXp0anVWMGhpaXhxTHBZanpqeTlJTjlIRU1qYUxo?=
 =?utf-8?B?UWxzZkhubWQrV0dsb3pjcTdVOUNLWWZvMC9MR2NlcGJzd2hreGVSNzBQRmgy?=
 =?utf-8?B?clhMcmM5YkcwVE9FZVJuenUrY3B4d28yUU5OSWw5d0dBQUtIdzlqKzloQ0JP?=
 =?utf-8?B?c3JibnRQUTJzNTEvVlFKaFU3dmZVaWVMaFFrRUlXTFNLRko4eEQybTNvNWR1?=
 =?utf-8?B?NUZQdlFEOEg5SVpGci9wY3dwWk91dHJyOVBKNmZVMEpNVXZxY0tndWZKaHZN?=
 =?utf-8?Q?UxkiYfDrxOlg4eKlBUmRKKdBT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ceb14e-0ff0-4876-18d2-08db1077ccda
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:44:52.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx0SyolPMfaEABSATmhZAnir2fZCTMykP4cQGS1k6nSr66UVbFlD1xIbCdA+00M3bVh+kQbgR/PYbyCUy4siTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> Expose debug capabilities in the KFD topology node's HSA capabilities and
> debug properties flags.
>
> Ensure correct capabilities are exposed based on firmware support.
>
> Flag definitions can be referenced in uapi/linux/kfd_sysfs.h.
>
> v2: v1 was reviewed but re-requesting review for the following.
> - remove asic family code name comments in firmware support checking
> - add gfx11 requirements in fw support checks and debug props and caps
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 101 ++++++++++++++++++++--
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   6 ++
>   include/uapi/linux/kfd_sysfs.h            |  15 ++++
>   3 files changed, 117 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 3fdaba56be6f..647a14142da9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -551,6 +551,8 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
>   				      dev->gpu->mec_fw_version);
>   		sysfs_show_32bit_prop(buffer, offs, "capability",
>   				      dev->node_props.capability);
> +		sysfs_show_64bit_prop(buffer, offs, "debug_prop",
> +				      dev->node_props.debug_prop);
>   		sysfs_show_32bit_prop(buffer, offs, "sdma_fw_version",
>   				      dev->gpu->sdma_fw_version);
>   		sysfs_show_64bit_prop(buffer, offs, "unique_id",
> @@ -1865,6 +1867,97 @@ static int kfd_topology_add_device_locked(struct kfd_dev *gpu, uint32_t gpu_id,
>   	return res;
>   }
>   
> +static void kfd_topology_set_dbg_firmware_support(struct kfd_topology_device *dev)
> +{
> +	bool firmware_supported = true;
> +
> +	if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(11, 0, 0) &&
> +			KFD_GC_VERSION(dev->gpu) < IP_VERSION(12, 0, 0)) {
> +		firmware_supported =
> +			(dev->gpu->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 9;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Note: Any unlisted devices here are assumed to support exception handling.
> +	 * Add additional checks here as needed.
> +	 */
> +	switch (KFD_GC_VERSION(dev->gpu)) {
> +	case IP_VERSION(9, 0, 1):
> +		firmware_supported = dev->gpu->mec_fw_version >= 459 + 32768;
> +		break;
> +	case IP_VERSION(9, 1, 0):
> +	case IP_VERSION(9, 2, 1):
> +	case IP_VERSION(9, 2, 2):
> +	case IP_VERSION(9, 3, 0):
> +	case IP_VERSION(9, 4, 0):
> +		firmware_supported = dev->gpu->mec_fw_version >= 459;
> +		break;
> +	case IP_VERSION(9, 4, 1):
> +		firmware_supported = dev->gpu->mec_fw_version >= 60;
> +		break;
> +	case IP_VERSION(9, 4, 2):
> +		firmware_supported = dev->gpu->mec_fw_version >= 51;
> +		break;
> +	case IP_VERSION(10, 1, 10):
> +	case IP_VERSION(10, 1, 2):
> +	case IP_VERSION(10, 1, 1):
> +		firmware_supported = dev->gpu->mec_fw_version >= 144;
> +		break;
> +	case IP_VERSION(10, 3, 0):
> +	case IP_VERSION(10, 3, 2):
> +	case IP_VERSION(10, 3, 1):
> +	case IP_VERSION(10, 3, 4):
> +	case IP_VERSION(10, 3, 5):
> +		firmware_supported = dev->gpu->mec_fw_version >= 89;
> +		break;
> +	case IP_VERSION(10, 1, 3):
> +	case IP_VERSION(10, 3, 3):
> +		firmware_supported = false;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +out:
> +	if (firmware_supported)
> +		dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED;
> +}
> +
> +static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
> +{
> +	dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
> +				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
> +				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
> +
> +	dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_SUPPORT |
> +			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED |
> +			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED;
> +
> +	if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(10, 0, 0)) {
> +		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9 |
> +						HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
> +
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 4, 2))
> +			dev->node_props.debug_prop |=
> +				HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
> +		else
> +			dev->node_props.capability |=
> +				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
> +	} else {
> +		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
> +					HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
> +
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(11, 0, 0))
> +			dev->node_props.debug_prop |= HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
> +		else
> +			dev->node_props.capability |=
> +				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
> +	}
> +
> +	kfd_topology_set_dbg_firmware_support(dev);
> +}
> +
>   int kfd_topology_add_device(struct kfd_dev *gpu)
>   {
>   	uint32_t gpu_id;
> @@ -1966,13 +2059,11 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
>   			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
>   		break;
>   	default:
> -		if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(9, 0, 1))
> -			dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
> -				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
> -				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
> -		else
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 0, 1))
>   			WARN(1, "Unexpected ASIC family %u",
>   			     dev->gpu->adev->asic_type);
> +		else
> +			kfd_topology_set_capabilities(dev);
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index fca30d00a9bb..53b9b7bf52ee 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -31,6 +31,11 @@
>   
>   #define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
>   
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9	6
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10	7
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT  \
> +			(29 << HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT)
> +
>   struct kfd_node_properties {
>   	uint64_t hive_id;
>   	uint32_t cpu_cores_count;
> @@ -42,6 +47,7 @@ struct kfd_node_properties {
>   	uint32_t cpu_core_id_base;
>   	uint32_t simd_id_base;
>   	uint32_t capability;
> +	uint64_t debug_prop;
>   	uint32_t max_waves_per_simd;
>   	uint32_t lds_size_in_kb;
>   	uint32_t gds_size_in_kb;
> diff --git a/include/uapi/linux/kfd_sysfs.h b/include/uapi/linux/kfd_sysfs.h
> index 3e330f368917..a51b7331e0b4 100644
> --- a/include/uapi/linux/kfd_sysfs.h
> +++ b/include/uapi/linux/kfd_sysfs.h
> @@ -43,6 +43,11 @@
>   #define HSA_CAP_DOORBELL_TYPE_2_0		0x2
>   #define HSA_CAP_AQL_QUEUE_DOUBLE_MAP		0x00004000
>   
> +#define HSA_CAP_TRAP_DEBUG_SUPPORT              0x00008000
> +#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED  0x00010000
> +#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED           0x00020000
> +#define HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED  0x00040000
> +
>   /* Old buggy user mode depends on this being 0 */
>   #define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED	0x00080000
>   
> @@ -53,8 +58,18 @@
>   #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
>   #define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
>   #define HSA_CAP_FLAGS_COHERENTHOSTACCESS	0x10000000
> +#define HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED   0x20000000
>   #define HSA_CAP_RESERVED			0xe00f8000
>   
> +/* debug_prop bits in node properties */
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_MASK     0x0000000f
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_SHIFT    0
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_MASK     0x000003f0
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT    4
> +#define HSA_DBG_DISPATCH_INFO_ALWAYS_VALID      0x00000400
> +#define HSA_DBG_WATCHPOINTS_EXCLUSIVE           0x00000800
> +#define HSA_DBG_RESERVED                0xfffffffffffff000ull
> +
>   /* Heap types in memory properties */
>   #define HSA_MEM_HEAP_TYPE_SYSTEM	0
>   #define HSA_MEM_HEAP_TYPE_FB_PUBLIC	1
