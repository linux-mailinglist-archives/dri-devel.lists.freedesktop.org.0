Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6065FA2A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 04:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24F10E832;
	Fri,  6 Jan 2023 03:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA56D10E830;
 Fri,  6 Jan 2023 03:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAaCG5iLf4/BudRx3N3wKfHqeZZl3Mo6AJ3632r3cfLzJ7bQm/rf/LfJ7y7rP3vJvXu9GF4oSCpM6SKtkgDFOKjZPN2pd3i9J3ubdzYZr/OvlKq8I9Q9OV9rDR1YH33WBSIqo9J4tHQhWgAvzBKBuDsR0y55I8MlU7cfnYZzeT/SBvS3ZCT+WZu5kg9NWhR6FkRUzGHurj2geH425j/Af8UnAgSNLJHwfXHz5JxQ/aq0Tb3VeJL3gXvBgYpFavPk2Rm2slKVoDCfzRp+rtTvSzUGaHGn4RyX/4NIhMUQbDmsrW7t4Dp7IpX+9v3X7x/bFV9HQ/LYcYtUySt3QVE++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y+61hD3rnMiEWhltoQiXUvF4kEcPkdLCG3XJFjDnzA=;
 b=jJyb4RBTGL8k2IsXrqBzZ9x1zcWbxC65tpOMsnlomGXC6qRp1+gWGIId5tiIzr2f3w5WQINBDSZlPd1NWGz3KOfEnZ95xNzuoRrVaz2HTuKpa426+au6DMmjibzJ7eQhtZid7biLkeqcHlWTbhafO9M30Q8nGqTEEQJEHy2lsa+ghV5TLR0A6z8DQUXhmNOhCwrPWS1dSg2DFmeEu/a1mIk7tHCPbcEnd+/IK45ZdxV/KgBwjAtEDL7MXMd+9lfYQvDS514EU9EIwTT+k5J+3eUyP4pWo3a63DOFpJj/ADh1aPQiLiVkmaHzpcqjPWtF6atDLWZBGUfQklcsjKSywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y+61hD3rnMiEWhltoQiXUvF4kEcPkdLCG3XJFjDnzA=;
 b=M6XrX8xIA8EhJhKZjKBOG55zvTh2xDRj6NAHJsa+6VN1we0fbwOknf/YIqk3denHOPteqD15bLMwF9lDwn/Rwks2XK4/Rx63vFeK/RWbkNNwBl+wafNxDFnTx1VrB+SnTeAJEeER/2rBW0rr8QniJKB10RqHcuU2PBnT8T/P3qY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 03:27:32 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 03:27:32 +0000
Message-ID: <66dc51e8-751a-d1e2-60b4-3ab27541eae8@amd.com>
Date: Fri, 6 Jan 2023 08:57:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v7 20/45] drm/amd: Parse both v1 and v2 TA microcode
 headers using same function
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105170138.717-1-mario.limonciello@amd.com>
 <20230105170138.717-21-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230105170138.717-21-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|BL1PR12MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: c1838e9f-06e1-4f21-c23b-08daef95f221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lharwf6wiy+oCpBKMhyY4HwN7qb02P7WTlSrjOFmHYq5xgFmtVkY4QN3AiFoxuEnboks4lXka22yCe93P/2phbBZGcU02/GiJW5F3c5ySelJkn2CmFkyTsGSrq3cPxYbV4topHlpNnw2z7s2VnRod7VQm9yWNmm5frq8A8Tfanhci7qNz6ybvXw6LAbO5ZmJsaK+dk5gOJmNWHH5Hd2Qbj0zMv0w+TIq6HQGO7qnSiB7BTyTJDEv4aNmugPQeC6acI3mrxTSU20GpfdLu8zMvF3tKIE6Y1rgvYfVvomktS0QBgN7zrHjcevVRtTUwAkFp2dG3P9If14glcPJnLyEqQ+bdwyjOlf6BOHUng+0DrGbBFzPGt2PrPMVL2lsqrsk0MSrjgLWc/Z7am+y5/YC6uCFNAJ0dPt0oBzQYwRG9lJfQcHwvcE8rwn308U5+FEaWnH2CiV/8Gn7CVdIE6GmrsQ4BftfLL7TtYNJUQoRY9NlZFQBvHXbhFm5+DclYldudPLoIqq3Ek+gQOiNBHZEwPvp+q/Eq57Zv9Hsh/SukNFuQLU/4l8/t0+Ryevy/26imxB3GAIy4mOMBDPt5AZndev2i9IpzL7iKmep2GTwJIjIk20ap+s0ESdK6wx+O8cluZ8jA7j56234ee0mcA2eeq1C5ojtIVeVb0hMqT/GIbwONYHi3ZYmjqFJcJqzfZSt2boVqzvFfgNWZU0gnoQjjTKeZmLOd7oBr/va2E/3zR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(83380400001)(6512007)(26005)(6666004)(6506007)(86362001)(36756003)(31696002)(186003)(53546011)(38100700002)(2616005)(4326008)(316002)(478600001)(41300700001)(8676002)(30864003)(2906002)(5660300002)(8936002)(6486002)(31686004)(66476007)(54906003)(66556008)(110136005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnVVMW1yUmlnUENENFF5d0gxL2ZXdzlpRVV4TUZvQjF4Y3A3cnBieUNCUW9v?=
 =?utf-8?B?L1lJM3F5eHJaQzJ4dVFWVC9veVFXanRzOWRHRXNnM0VNOVdUSUU1dDZZTENS?=
 =?utf-8?B?VHZnK0xZdUZtbVN4eDVYZnd3S2Z2QUNscWptWGRRT0c5RHgydmNnenlHTU1X?=
 =?utf-8?B?YkJHQUVab3lFRm8zdnhhT0lYNzBRM3Z6VzVFekczcS9waHI5U3VsTzN3RTB3?=
 =?utf-8?B?R3hXWGJTejM3R3RzRitydElaMkJJMDcyYXM2aVo4b0xXNWpPUlBhbEF4S2R1?=
 =?utf-8?B?dUVMUU5vaStWWjFUV3dWNjQwdG5EY3hxeEROakJ2ZHpGNCsxcVluNFhMd2ZQ?=
 =?utf-8?B?TXVraWtnZzBrL3FNYTJmUGFlcmlZSDd0Znh5VkZGQU9tL3pOVEFVRGswYlZH?=
 =?utf-8?B?VnkyY3hBbW00ZHFGVjJjR1ZWQ0hrcmN4WFU0VVM1cmdlZ0lnMllRdkMrMUFs?=
 =?utf-8?B?eXc2VUhBY01tT055U2EwRzRCdlMrY0NKY0FEbUg4eHhhWVdmdDR5ZlpWWnBL?=
 =?utf-8?B?TGVaNDdzUStnLy9CKy9PUEdCL2Y2dmRaL3FmL1N0ejc0c285aFFQWnZHR1N2?=
 =?utf-8?B?cFdENmtyUlZFSHFWTE5ZMG9sb3FmcElQT2dUVU1mMzlvV0o2VXhMQ3E1RUR5?=
 =?utf-8?B?UDhXUmZLSVF6YkxnTmlqZVZkYWJsMEx1ZkhpTkFRS1UyaTNjNGFFVlMzY0lW?=
 =?utf-8?B?MkRjTTJScnBIVUZDQXNLQlpiK004MkFnajFETkJmZzl0d1dLYkZVdjV4QmQy?=
 =?utf-8?B?VHBNZ1BQeUlLSHJOODdJRmhna1hXTlZGK1FkdVJsVG5NQ2tRVnFtVkFsYVMw?=
 =?utf-8?B?M1ZkYXpaVzFlSXRWL1VIeTNKRUlFaTF3ZjBtaktYQUMzcG04bG5VSXI4S2Nn?=
 =?utf-8?B?OFVrN0F1eFBndlVnSUIyTkxBdkFyS3A4bmVndEtQSmdOdkwyVDJnZ3h5K1l6?=
 =?utf-8?B?RzJFVTNrUkcyZFVDTWxNT1ZjWU1iVXFweGRCWi9SUS9NZ3ZZN1NDeVZMcXVv?=
 =?utf-8?B?SmhrNTB4SHU5ODlWT1JTUG9LdnI1K1B4cTlhT0R6Y2UzbXpvQkxwUDBDRkFs?=
 =?utf-8?B?cE9RZFkrbHhyaW5tQ3JIVC9BQlhkYVh5QzRPNmdqWUlraUhpeHI4VnVuZWZm?=
 =?utf-8?B?ZitWVUx6NUxKWDBObjRxb2M2ZEh3ZU5CL082V1lOVStLR1ROWFVvS0pvaGRQ?=
 =?utf-8?B?YnA0ankrSjNFQXRneUJWOE93V3J5U3F3OGpZTmxQclNEdDJ3Y3dkaktvaEF5?=
 =?utf-8?B?eWh6VGhLVnVVSVU3b1BvSWlrNmg1TVp4WW5sVkdkVyt6MnFzUWxTSzdhR0tn?=
 =?utf-8?B?SC9QYUY1VE43UU43RHhrZExWcDEzNTVZMXo5SWwxWTlPWmFNMHBKTHZDRnV1?=
 =?utf-8?B?eStXWVc2TEppaHd6aS8vSi9Mcm5RSE9FN0J4SFhxMW9wWkRiTzFDcTEyRkhx?=
 =?utf-8?B?RjlQQ2hxS3dCZkZPN3VqVTYxOUtYWUlXZ1IvbXFkVDVnSzh2M0lvL0tFY2JC?=
 =?utf-8?B?WHErWVF4VCtSK3hVYXhPS2pWd3pwQW5UUGNSWENMSk1pKzNMeHhoSGEvbG1X?=
 =?utf-8?B?ZlpNVi9GVlUwdGJRajJTVm0xR0dNQ20ra0Qxbnp0Qk1XandNSjdzamdEZkR2?=
 =?utf-8?B?NVNUaElIZm5nSjdiWTdiWVgzUWtlbTJNVmxQZ21vaU92YVZVaHgwak40SEdn?=
 =?utf-8?B?dTVqSTRaaWMySUNoM1JXL1J1ejNNVWhnSE5NUVNwZEx2UVhETmhvZ3MwdzU4?=
 =?utf-8?B?VE9nTWt4bFAxQjJ3TW14aWRTT21GVDJKSWQ0NGpvQmUwVTZmWVZUYW12Wmdv?=
 =?utf-8?B?NzJ1RlZDNnlacTQyZ1BDQUorMk5NMHpWVk1rVUlFdmdWU2xidGhlZ0l6Smo0?=
 =?utf-8?B?aFNkVlFNLytmclZabnBnZ21BL0lqaWc4MkxrWSsydDd0ZDFLZ2VIcnNVS2Mv?=
 =?utf-8?B?MENIOVVkcGdTdXNmZEl1b2Q1c0JEYmJVYVUxQlozdEZ6S0pwbk9ybzEvcEVN?=
 =?utf-8?B?UE5IcTlmaW5TQUNIaFd0OWlGR1dBNGdKUzEraGFPZ1lwc2VXbEZSNlB1RmtD?=
 =?utf-8?B?Sk4xaUJKdnFHdStrcFRtNE1xVGtMamlyVGR3aUtxaGNHZnB4YkFMUDhmZkQ1?=
 =?utf-8?Q?LLIaA5ab0uMmnk2K2b2oK0+B8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1838e9f-06e1-4f21-c23b-08daef95f221
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 03:27:32.0154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVGoZ72VwCY5+gQqPIRt8J6/1UgmFqw6Lj0r4QliU4dH+h/Q85Qbcm1Y+yHxwt3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2023 10:31 PM, Mario Limonciello wrote:
> Several IP versions duplicate code and can't use the common helpers.
> Move this code into a single function so that the helpers can be used.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v6->v7:
>   * Drop tags
>   * Only set adev->psp.securedisplay_context.context on PSPv12 Renoir and
>     PSP v10 which matches previous behavior.  If it should match for Cezanne
>     and PSPv11 too we can undo this part of the check.
> v5->v6:
>   * Rebase on earlier patches
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 123 ++++++++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  64 +-----------
>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  80 ++-------------
>   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  66 ++-----------
>   4 files changed, 115 insertions(+), 218 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index 7a2fc920739b..bdc2bf87a286 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -3272,41 +3272,76 @@ static int parse_ta_bin_descriptor(struct psp_context *psp,
>   	return 0;
>   }
>   
> -int psp_init_ta_microcode(struct psp_context *psp,
> -			  const char *chip_name)
> +static int parse_ta_v1_microcode(struct psp_context *psp)
>   {
> +	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	struct amdgpu_device *adev = psp->adev;
> -	char fw_name[PSP_FW_NAME_LEN];
> -	const struct ta_firmware_header_v2_0 *ta_hdr;
> -	int err = 0;
> -	int ta_index = 0;
>   
> -	if (!chip_name) {
> -		dev_err(adev->dev, "invalid chip name for ta microcode\n");
> +	ta_hdr = (const struct ta_firmware_header_v1_0 *) adev->psp.ta_fw->data;
> +
> +	if (le16_to_cpu(ta_hdr->header.header_version_major) != 1)
>   		return -EINVAL;
> -	}
>   
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err)
> -		goto out;
> +	adev->psp.xgmi_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->xgmi.fw_version);
> +	adev->psp.xgmi_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->xgmi.size_bytes);
> +	adev->psp.xgmi_context.context.bin_desc.start_addr =
> +		(uint8_t *)ta_hdr +
> +		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> +
> +	adev->psp.ras_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->ras.fw_version);
> +	adev->psp.ras_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->ras.size_bytes);
> +	adev->psp.ras_context.context.bin_desc.start_addr =
> +		(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
> +		le32_to_cpu(ta_hdr->ras.offset_bytes);
> +
> +	adev->psp.hdcp_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->hdcp.fw_version);
> +	adev->psp.hdcp_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->hdcp.size_bytes);
> +	adev->psp.hdcp_context.context.bin_desc.start_addr =
> +		(uint8_t *)ta_hdr +
> +		le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> +
> +	adev->psp.dtm_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->dtm.fw_version);
> +	adev->psp.dtm_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->dtm.size_bytes);
> +	adev->psp.dtm_context.context.bin_desc.start_addr =
> +		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> +		le32_to_cpu(ta_hdr->dtm.offset_bytes);
> +
> +	adev->psp.securedisplay_context.context.bin_desc.fw_version =
> +		le32_to_cpu(ta_hdr->securedisplay.fw_version);
> +	adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> +		le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> +	adev->psp.securedisplay_context.context.bin_desc.start_addr =
> +		(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> +		le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> +
> +	adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
>   
> -	err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -	if (err)
> -		goto out;
> +	return 0;
> +}
> +
> +static int parse_ta_v2_microcode(struct psp_context *psp)
> +{
> +	const struct ta_firmware_header_v2_0 *ta_hdr;
> +	struct amdgpu_device *adev = psp->adev;
> +	int err = 0;
> +	int ta_index = 0;
>   
>   	ta_hdr = (const struct ta_firmware_header_v2_0 *)adev->psp.ta_fw->data;
>   
> -	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2) {
> -		dev_err(adev->dev, "unsupported TA header version\n");
> -		err = -EINVAL;
> -		goto out;
> -	}
> +	if (le16_to_cpu(ta_hdr->header.header_version_major) != 2)
> +		return -EINVAL;
>   
>   	if (le32_to_cpu(ta_hdr->ta_fw_bin_count) >= UCODE_MAX_PSP_PACKAGING) {
>   		dev_err(adev->dev, "packed TA count exceeds maximum limit\n");
> -		err = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
>   	for (ta_index = 0; ta_index < le32_to_cpu(ta_hdr->ta_fw_bin_count); ta_index++) {
> @@ -3314,14 +3349,46 @@ int psp_init_ta_microcode(struct psp_context *psp,
>   					      &ta_hdr->ta_fw_bin[ta_index],
>   					      ta_hdr);
>   		if (err)
> -			goto out;
> +			return err;
>   	}
>   
>   	return 0;
> -out:
> -	dev_err(adev->dev, "fail to initialize ta microcode\n");
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> +}
> +
> +int psp_init_ta_microcode(struct psp_context *psp, const char *chip_name)
> +{
> +	const struct common_firmware_header *hdr;
> +	struct amdgpu_device *adev = psp->adev;
> +	char fw_name[PSP_FW_NAME_LEN];
> +	int err;
> +
> +	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> +	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> +	if (err)
> +		return err;
> +	err = amdgpu_ucode_validate(adev->psp.ta_fw);
> +	if (err)
> +		return err;
> +
> +	hdr = (const struct common_firmware_header *)adev->psp.ta_fw->data;
> +	switch (le16_to_cpu(hdr->header_version_major)) {
> +	case 1:
> +		err = parse_ta_v1_microcode(psp);
> +		break;
> +	case 2:
> +		err = parse_ta_v2_microcode(psp);
> +		break;
> +	default:
> +		dev_err(adev->dev, "unsupported TA header version\n");
> +		err = -EINVAL;
> +	}
> +
> +	if (err) {
> +		dev_err(adev->dev, "fail to initialize ta microcode\n");
> +		release_firmware(adev->psp.ta_fw);
> +		adev->psp.ta_fw = NULL;
> +	}
> +
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> index 9de46fa8f46c..f14fcfb9c425 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> @@ -48,9 +48,8 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[30];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	DRM_DEBUG("\n");
>   
>   	switch (adev->asic_type) {
> @@ -64,66 +63,13 @@ static int psp_v10_0_init_microcode(struct psp_context *psp)
>   		break;
>   	default: BUG();
>   	}
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
> -	err = psp_init_asd_microcode(psp, chip_name);
> +	err = psp_init_asd_microcode(psp, ucode_prefix);
>   	if (err)
> -		goto out;
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err) {
> -		release_firmware(adev->psp.ta_fw);
> -		adev->psp.ta_fw = NULL;
> -		dev_info(adev->dev,
> -			 "psp v10.0: Failed to load firmware \"%s\"\n",
> -			 fw_name);
> -	} else {
> -		err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -		if (err)
> -			goto out2;
> -
> -		ta_hdr = (const struct ta_firmware_header_v1_0 *)
> -				 adev->psp.ta_fw->data;
> -		adev->psp.hdcp_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->hdcp.fw_version);
> -		adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -		adev->psp.hdcp_context.context.bin_desc.start_addr =
> -			(uint8_t *)ta_hdr +
> -			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -
> -		adev->psp.dtm_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->dtm.fw_version);
> -		adev->psp.dtm_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->dtm.size_bytes);
> -		adev->psp.dtm_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -
> -		adev->psp.securedisplay_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->securedisplay.fw_version);
> -		adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> -		adev->psp.securedisplay_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> -
> -		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -	}
> -
> -	return 0;
> -
> -out2:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> -out:
> -	if (err) {
> -		dev_err(adev->dev,
> -			"psp v10.0: Failed to load firmware \"%s\"\n",
> -			fw_name);
> -	}
> +		return err;
>   
> -	return err;
> +	return psp_init_ta_microcode(psp, ucode_prefix);
>   }
>   
>   static int psp_v10_0_ring_create(struct psp_context *psp,
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index bd3e3e23a939..41e29b777666 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -89,9 +89,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[PSP_FW_NAME_LEN];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   
>   	DRM_DEBUG("\n");
>   
> @@ -129,7 +128,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   	default:
>   		BUG();
>   	}
> -
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
>   	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(11, 0, 2):
> @@ -140,35 +139,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   		err = psp_init_asd_microcode(psp, chip_name);
>   		if (err)
>   			return err;
> -		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -		if (err) {
> -			release_firmware(adev->psp.ta_fw);
> -			adev->psp.ta_fw = NULL;
> -			dev_info(adev->dev,
> -				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
> -		} else {
> -			err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -			if (err)
> -				goto out2;
> -
> -			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
> -			adev->psp.xgmi_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->xgmi.fw_version);
> -			adev->psp.xgmi_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->xgmi.size_bytes);
> -			adev->psp.xgmi_context.context.bin_desc.start_addr =
> -				(uint8_t *)ta_hdr +
> -				le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -			adev->psp.ras_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->ras.fw_version);
> -			adev->psp.ras_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->ras.size_bytes);
> -			adev->psp.ras_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.xgmi_context.context.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->ras.offset_bytes);
> -		}
> +		err = psp_init_ta_microcode(psp, ucode_prefix);
> +		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
>   		break;
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
> @@ -179,39 +151,8 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   		err = psp_init_asd_microcode(psp, chip_name);
>   		if (err)
>   			return err;
> -		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -		if (err) {
> -			release_firmware(adev->psp.ta_fw);
> -			adev->psp.ta_fw = NULL;
> -			dev_info(adev->dev,
> -				 "psp v11.0: Failed to load firmware \"%s\"\n", fw_name);
> -		} else {
> -			err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -			if (err)
> -				goto out2;
> -
> -			ta_hdr = (const struct ta_firmware_header_v1_0 *)adev->psp.ta_fw->data;
> -			adev->psp.hdcp_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->hdcp.fw_version);
> -			adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -			adev->psp.hdcp_context.context.bin_desc.start_addr =
> -				(uint8_t *)ta_hdr +
> -				le32_to_cpu(
> -					ta_hdr->header.ucode_array_offset_bytes);
> -
> -			adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -
> -			adev->psp.dtm_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->dtm.fw_version);
> -			adev->psp.dtm_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->dtm.size_bytes);
> -			adev->psp.dtm_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.hdcp_context.context
> -					.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -		}
> +		err = psp_init_ta_microcode(psp, ucode_prefix);
> +		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
>   		break;
>   	case IP_VERSION(11, 0, 7):
>   	case IP_VERSION(11, 0, 11):
> @@ -221,26 +162,17 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   		if (err)
>   			return err;
>   		err = psp_init_ta_microcode(psp, chip_name);
> -		if (err)
> -			return err;
>   		break;
>   	case IP_VERSION(11, 5, 0):
>   		err = psp_init_asd_microcode(psp, chip_name);
>   		if (err)
>   			return err;
>   		err = psp_init_toc_microcode(psp, chip_name);
> -		if (err)
> -			return err;
>   		break;
>   	default:
>   		BUG();
>   	}
>   
> -	return 0;
> -
> -out2:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> index 8ed2281b6557..67118e699219 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> @@ -49,9 +49,8 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
>   {
>   	struct amdgpu_device *adev = psp->adev;
>   	const char *chip_name;
> -	char fw_name[30];
> +	char ucode_prefix[30];
>   	int err = 0;
> -	const struct ta_firmware_header_v1_0 *ta_hdr;
>   	DRM_DEBUG("\n");
>   
>   	switch (adev->asic_type) {
> @@ -64,67 +63,20 @@ static int psp_v12_0_init_microcode(struct psp_context *psp)
>   	default:
>   		BUG();
>   	}
> +	amdgpu_ucode_ip_version_decode(adev, MP0_HWIP, ucode_prefix, sizeof(ucode_prefix));
>   
>   	err = psp_init_asd_microcode(psp, chip_name);
> +	if (err)
> +		return err;
> +	err = psp_init_ta_microcode(psp, ucode_prefix);
>   	if (err)
>   		return err;
>   
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
> -	err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> -	if (err) {
> -		release_firmware(adev->psp.ta_fw);
> -		adev->psp.ta_fw = NULL;
> -		dev_info(adev->dev,
> -			 "psp v12.0: Failed to load firmware \"%s\"\n",
> -			 fw_name);
> -	} else {
> -		err = amdgpu_ucode_validate(adev->psp.ta_fw);
> -		if (err)
> -			goto out;
> -
> -		ta_hdr = (const struct ta_firmware_header_v1_0 *)
> -				 adev->psp.ta_fw->data;
> -		adev->psp.hdcp_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->hdcp.fw_version);
> -		adev->psp.hdcp_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->hdcp.size_bytes);
> -		adev->psp.hdcp_context.context.bin_desc.start_addr =
> -			(uint8_t *)ta_hdr +
> -			le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> -
> -		adev->psp.ta_fw_version = le32_to_cpu(ta_hdr->header.ucode_version);
> -
> -		adev->psp.dtm_context.context.bin_desc.fw_version =
> -			le32_to_cpu(ta_hdr->dtm.fw_version);
> -		adev->psp.dtm_context.context.bin_desc.size_bytes =
> -			le32_to_cpu(ta_hdr->dtm.size_bytes);
> -		adev->psp.dtm_context.context.bin_desc.start_addr =
> -			(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -			le32_to_cpu(ta_hdr->dtm.offset_bytes);
> -
> -		if (adev->apu_flags & AMD_APU_IS_RENOIR) {
> -			adev->psp.securedisplay_context.context.bin_desc.fw_version =
> -				le32_to_cpu(ta_hdr->securedisplay.fw_version);
> -			adev->psp.securedisplay_context.context.bin_desc.size_bytes =
> -				le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> -			adev->psp.securedisplay_context.context.bin_desc.start_addr =
> -				(uint8_t *)adev->psp.hdcp_context.context.bin_desc.start_addr +
> -				le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> -		}
> -	}
> -
> -	return 0;
> -
> -out:
> -	release_firmware(adev->psp.ta_fw);
> -	adev->psp.ta_fw = NULL;
> -	if (err) {
> -		dev_err(adev->dev,
> -			"psp v12.0: Failed to load firmware \"%s\"\n",
> -			fw_name);
> -	}
> +	/* only supported on renoir */
> +	if (!(adev->apu_flags & AMD_APU_IS_RENOIR))
> +		adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;
>   
> -	return err;
> +	return psp_init_ta_microcode(psp, ucode_prefix);

I meant the below lines to come after this call. Even if it gets some 
value during parsing for other SOCs, force to 0.

if (!(adev->apu_flags & AMD_APU_IS_RENOIR))
	adev->psp.securedisplay_context.context.bin_desc.size_bytes = 0;

Thanks,
Lijo

>   }
>   
>   static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
