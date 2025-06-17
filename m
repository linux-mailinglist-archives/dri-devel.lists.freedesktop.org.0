Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81EADDDBE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 23:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9531A10E0A3;
	Tue, 17 Jun 2025 21:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KlokECci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A9A10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 21:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtoUInLkAisuIraCEH6rcjTjRgab9px6KLFJEiLWYaKRyFnweyT4B9jSFuIjz4XLe9QCe/LkDR2ObHaBtiKJpDft540dz/UNPdY34t1if7kiyqefLgShydt8FAPXjbU47h9Kt38otAWvdfOT0MT+q6BiYitf1fwZhlg+/oUKg8fnHVWXC68tj90WMQkVuIOXselF+VDbHqVcdD4RtZHUCRuZXEqEEKy4qxvPjTqisBSubd3pKQOL4Dj/RGc0UIZaFA2QSS25/HSut+a2EETXT16W7zNmr7M0SoEdj/7mUy5n2eeuBRG6QnewiNxkWsTku9LosGw+vVK70DlNUASw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xYSncnDbaRbTIDXKbMEYPKz0jYOOnAx16CsFgT32vs=;
 b=NbHJLZR5ElBzDA2dPRGrC5eCxyAuSHS2nWKzQzXhXdLoR48tnIq6JQNic8YN4zvaW+xiXMMPzSpEbKHAI5Duu3t80j62oLWvQgXgL9QwjxWuWqcb1MtfdZsMNQ+kt2W8MReSsdszv0r00pVJana7hHSfXBK5/eErvOi/rbr42pl4BMiSzOFhv8eny6CyQUUkqDPaxRK3gTd6KLjvafm4xGPY7qCfKjPx+tH2/e3e2rR9pWdsiRG19Ph5CYhYXZhLUGhoSWZG2hgdaiFiJfurmtoJbyuSi+hbVf/9B8K6iiCRVh4Pn4OnOiKhrdG3Tyn+1AL623SBf5hHLkBUmYZvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xYSncnDbaRbTIDXKbMEYPKz0jYOOnAx16CsFgT32vs=;
 b=KlokECcipfeNXfgTeUmoPD87LjwayIm/udnz8MtHNajyzoBngsw9mPBvbStxnstfZQfujKt2PmOAsfrNTmniWktJ+ROSpuehtas2k9WO7ewlLerq3IeTWh6zxf/6f9xoysM3kxrnMOAxn63o0CWEJlWjb9sF/kcu66KsIpW1jUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB5657.namprd12.prod.outlook.com (2603:10b6:806:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 21:11:55 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 21:11:55 +0000
Message-ID: <65970834-33e7-4c54-b3f8-ecf816141e40@amd.com>
Date: Tue, 17 Jun 2025 17:11:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/amdgpu: Allow kfd CRIU with no buffer objects
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, David.YatSin@amd.com, Chris.Freehill@amd.com,
 Christian.Koenig@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250617194536.538681-1-David.Francis@amd.com>
 <20250617194536.538681-5-David.Francis@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20250617194536.538681-5-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 63755484-06bb-4a1a-30c5-08ddade396a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0o1eXNXdmdET201dW9qZ3VFYjVCUXdVWmJKM0Uxdi9KeE1jTTRNREJtYTdx?=
 =?utf-8?B?M1IveUhJaUVhR3VVUGhWbEhXZWRpM3gzVW5qVzhLRFJ3Mzh5b1hMckNiOGVL?=
 =?utf-8?B?a3NqdmNneHdIbjhBYVpOd1QwQkloSGtTbDk2OVVLaGZTbGVPMTVnWlFEemJp?=
 =?utf-8?B?bk5Fb3FGVzBTWVlCMnUrbXlESDkydFhMZThXTUJMZExvblVoeDVBMHZ4OFJL?=
 =?utf-8?B?MnR3TUNRM0ZBRTl3L2J0bDVFVXVtQjZFTFVsOUdac0o5ZnN6d1RTbGZBenNV?=
 =?utf-8?B?dDJISEhDY2dxN3UwcmQ0SmhoY2swQjc2SnRYaXZoNXFNVm4rajNwOXJoYk5o?=
 =?utf-8?B?T0h4aFRMUG0xMWtOWmlacHB6RWhpdUtuakN3TUtlZCt3TGVNNXFEdDNlQitY?=
 =?utf-8?B?VDZYbGgwVzc2NmR4K2dxL2xJbUl0ejdGTGhoc3RIazQxUWVpT3ZOU2Y0V2Ra?=
 =?utf-8?B?YWIrQkVDN1VXZ3ZaYUhJUXA5Nzk3TVdLUE9FTHhhNGVFQkNUa3NJK3lNa2hU?=
 =?utf-8?B?ZVNEemZ2TlB3eUdFSnFLSTJZVG9QRW5sb2pvTmFKTmZIL3k2ZlFsYm9sUU53?=
 =?utf-8?B?RmFlamlReDc3VlkxQjFNV2cyRU5tSENObng1b3dKOWZYTE55QXZyY2VxOHdl?=
 =?utf-8?B?c20rMHdsYzNGaTg3NmE5TU5BcGRPbFdYVFl4azFaMGFnMS91aWMyMndnLy9w?=
 =?utf-8?B?UHk5VVk0Smx3L0s1SDJCNk4wVHVqbFZMN1lweVdWbkhlOWRxRi9PTklHeWdH?=
 =?utf-8?B?TU1USStoUEs4WVFOZW5HMUlueWlOK0JLS0U1dHNoS0UrZnhxcmMrRHpaeVp3?=
 =?utf-8?B?ZkRxK0dhZ2pJUjljNHFDaWpPODFHcHdGUkovMFE2a2tFbXJHb1dBbjdrMGdK?=
 =?utf-8?B?VE4xZCtqRS9JakJYOFpienZmdllyTWZwa1VzeWE3a2xKbDVNYWlZMVBtVW4z?=
 =?utf-8?B?RENkU2RaT0hhakwrUm82U1I5MENiZjlvOGRmZ2pNVnQ2c3ZaR2lKUmFFMkRk?=
 =?utf-8?B?bVAxeDh1bXdHSFl0UjdEWjNBYzk5TVlMUXJtOW1sdUgyWndRMFhNcndNZjNk?=
 =?utf-8?B?bUFGNlZmVFRkWmlacW4zS0ZiQTZ1ZVA1a2wzTTZFNjNwa1ZDTHVWeDNvd0t6?=
 =?utf-8?B?a2JNb2k0SlIwd0psZ0xnVU5qRW9uZ0dJUlpYTElOTzk2SXVqdGNMc24yT1gr?=
 =?utf-8?B?UzBINUhERzlkbDhVL1FLaElvMUoxUFJCd2FBQTltRUgrUXdSMjFrdlUwRjYw?=
 =?utf-8?B?SGwyaE0wRllBWVdXRzRSOWRiSys4VlFPcmhjdys3ME92cFFURUt6L0dQYWVQ?=
 =?utf-8?B?aVNJN1BBWXdHMDdaTS9QUUNFenJpempRa2hkaHRxZkd5M1FPNXpGdjdkRlda?=
 =?utf-8?B?ZjRuUUlESDljbDY0WElyTHd0NXA3bVB2WGtmdzdFRy9ZUkNWWHpaWEEyZ2xZ?=
 =?utf-8?B?V1UwYWtnN1FXeS9BOHBLK0JDRTY0Tys4dkhkb3prRVNleTcxOVdWanRIeGZ5?=
 =?utf-8?B?cjFpL0dZNFUzOWRUSHVrT2VwZkZRWldic0F2ejlmRkUxQ1htVFlyaHgraUE2?=
 =?utf-8?B?U1ZvUTArcHhVdzBoTjZLU1lvVUJJMkFRcWxHRXFpbTdrTTVyczhIcVc4MG83?=
 =?utf-8?B?VjgzYmgxYm1vbVJhSjIyc2d2Zmh4WE93dzl1dFAwRUpqL2hWV2dIT3pVSWpZ?=
 =?utf-8?B?SlZ1VlZzNDlNMExTb0xxQWV0Qm5kU2lKdmlwb3FFcEQzb1lIajlIREJsUkpr?=
 =?utf-8?B?azh6WExMb2xOTFVyYk54bFBxNHZRaTI2TklmK2owYWtkY29ZTjh3bElRbkNP?=
 =?utf-8?B?RXFQeGNKNjFudU9mcDA4SWxQdWJLSzFDWVJ0OGNUVmU5RURUSWxiNGFqQWpE?=
 =?utf-8?B?MElWbXRsUnRKenNZTHd2VFJZZmpsM3hnOEFFWFFFY0JQUHJlcFlRdTlJSHpJ?=
 =?utf-8?Q?b443/NrYdkE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVweUtlS0hCTEtnYnJyVmRTWjdFUldwYzlKSUdDRDdmM1BGQ2hHQS91Qiti?=
 =?utf-8?B?YWlKZ0JyeVhmc1RNa01xaEpPa25tbFB5bTRWa1pQOE0xRll0UU1JbVMxcFBs?=
 =?utf-8?B?andoazFsK0hKTVgraGtSN2xqSVg2S0VpU1l1dXpoM01vdnB0QWw4RGovb29J?=
 =?utf-8?B?VHNjRGp4YTh4RE9vZHNhT29ZY0NoTGV4a051M0VWSjhkRVZJcjRVUDQzblgw?=
 =?utf-8?B?b05QT1M2R0VCam1vRFBYV3hpcksxejhoNnFIR0hGRmVHZFVMTVlVQndrRVVQ?=
 =?utf-8?B?MHdqVHhlU3BxOWlKZWlKY1JoU3YyazNrQytDVTJTa0RFRlpONG1OUzRsVEJZ?=
 =?utf-8?B?M1VKTXhWME5zK1h0MlhncEpDbnVjbTIzOWlYNDJNVHY1SUJKT0JuQlpqZFFN?=
 =?utf-8?B?T3FwM3hrVXl1SDRNWnd2d1c2TC9LNXVTTXczVDhMOUM4TjVHakZpVkV6QUFU?=
 =?utf-8?B?V3MrcVgrSGhmUkRMbjFhdlRQWnVhSThlM2dRWDgzSmNHQ3lWRHl1SVAzVi9M?=
 =?utf-8?B?dXp4S3FOUkZlelhuU1J1RGptTjZwOHZHaXRuSnZjRzZMUlJhVzNpcmdqZk1w?=
 =?utf-8?B?N2gzdVpmZlJMS2VnajkxamFIWC9UY1M5TlhFbnpxK25waVExZ3lOcVIrcmVu?=
 =?utf-8?B?bUp3ZVp1Ui9yZEVFZUYvdWFMc2YzV01LQXBkbklYOVpwQ3FneFlEZlVaR0Fp?=
 =?utf-8?B?WWd3cytyd0oyRUo5Z1hpMFRFT3BRdy9JSkh5OWZmSW5BVWxCaXZMWWFRRzZp?=
 =?utf-8?B?YUQ1TjVHZlQxU1U4dFJDakFjUXBtcnNGWmZ4c01UMThMcHo0RDlhMGNkNzlz?=
 =?utf-8?B?bW1ZVTNCV1Z3NjFQa2tDeGNpMm1nUG5BWHhkZkhyRXE4V28zSUdZbXFrR1J6?=
 =?utf-8?B?ZXdySVZOcU5MQm1nQTNYc1Nvb2VMQ2VuUFhybzZlVTBGc1NQT3dXa1NMeGxs?=
 =?utf-8?B?TG1tRWlKTVhEUnlkQnk0cWVlb2JubERmNnpVOEJwR0pPaHUvU0dpUWkzODl4?=
 =?utf-8?B?bTBML2JFMGhHNEhYS0Y2S3ZidVZTN3Y4Tlc1Q2k0R3pyakJrSWhINE03S3dM?=
 =?utf-8?B?TUNaZ0FnY2xLWHhaVUJjWGx2Z1RFSkEydnd5WUhzQUhkaHJDQkVQUEtyUXUw?=
 =?utf-8?B?dlRhbXdTVjdVZ3pPTDRjbTBxRkRuWkNpUXlJTWliQkYwczltZm9sbThsNVRL?=
 =?utf-8?B?aXZ6T2toUWhSTkgrV1JMYzVDQmhqcVoyZFgwNlBNOG5mWnphdDVvalpXeGlD?=
 =?utf-8?B?MnVZNXRiMkx3VkNBSTQ2OVdtdk94VW05dDZPMmoyOS9HNVJrY01LVmRXMUpN?=
 =?utf-8?B?SGYyMEQ2Z1ZzNWxIdDFhWjFKdjgxem9DMVRScG9ld2d5Ny9tT24zQUhQbit5?=
 =?utf-8?B?R0IxcFZ5U2JpL1RhM3ZVaTdXa21LRnBMb3hVeWtRQVJMK2xZbnYvbmZtR21L?=
 =?utf-8?B?SU4veHhhaWlwLzZWSEdHM2paK2lpeEFSMFVtTlVESnBBTUtZOGJENTczVDZv?=
 =?utf-8?B?cWxmSzRDZ09XV3kyOFkraFV4eTdVSStIY0F4dlM3Ymh5RVdzRVpLcUxxbzlt?=
 =?utf-8?B?UUZjSDFNQ2N1Y0o1YlZVSERncG1mNEtjb3pUbHh6VzdXckxabjFJUnJYRVFt?=
 =?utf-8?B?MllBdnlNbEZtcWJDUFdyNDhnVzBvekVFSTJyb25wMFp3NDBTVDUrWXN0ZlBY?=
 =?utf-8?B?OEtrWFl1ZE1Mdythc29XUGx1bU1iRlR2M2JkaGNyT2QwQ1ZGdjRucjl4QkNv?=
 =?utf-8?B?SlowejFsSnBGZ3J3SWE5SjcrQVc4R252d3l6NlNFMndYZnVkcXhYTlpjZzJ1?=
 =?utf-8?B?b1I1aFA3ZVl3cGJoMURkWWxkY1pBRG1Ra0RYTmVCYU9scjMvQVNVc0ZjSnlR?=
 =?utf-8?B?aGVZU2hNNTdoRVVYRWZhN204Slh1MkRJM3BUeDFMR0NUczV4bGY0UzVpNUhk?=
 =?utf-8?B?Y1BHOUhVRTR3b1JaeFQwRnpoZVpvZXdtM1l1VFRCVVNHdHJIaXU4VjdGTHNt?=
 =?utf-8?B?SkE1ZXNSWDlDOVlFaGRCNk1WK2FIaWNMd2QwcjlxMlpYTzAzN2JNSmFKYTN3?=
 =?utf-8?B?c0psaWdWdUxxTk9VN1k4eWlvcWlRRlRzMjhIRWs2WS94MXNsRHd2SVJqNisv?=
 =?utf-8?Q?D16Vxl+6anlc9CGlrVbUm/ctp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63755484-06bb-4a1a-30c5-08ddade396a9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 21:11:55.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ND69i0vDcjOTMBELK9qoUvHp5kcJvKbX0XdkZsm0hhALkEO5MaLpKSMyeIH0ucCizZwY/B9OiUTsqWXtE/keg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5657
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

On 2025-06-17 15:45, David Francis wrote:
> The kfd CRIU checkpoint ioctl would return an error if trying
> to checkpoint a process with no kfd buffer objects.
>
> This is a normal case and should not be an error.
>
> Signed-off-by: David Francis <David.Francis@amd.com>

This patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a8cf2d4580cc..9617c696d5b6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2569,8 +2569,8 @@ static int criu_restore(struct file *filep,
>   	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
>   		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
>   
> -	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
> -	    !args->num_devices || !args->num_bos)
> +	if ((args->num_bos > 0 && !args->bos) || !args->devices || !args->priv_data ||
> +	    !args->priv_data_size || !args->num_devices)
>   		return -EINVAL;
>   
>   	mutex_lock(&p->mutex);
