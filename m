Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E66DDECF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF7D10E586;
	Tue, 11 Apr 2023 15:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB9F10E584;
 Tue, 11 Apr 2023 15:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH+9wqjyNXRlAm3wP4K5dEn6gHuLUG+FqJbo0F+OGNYWU0WDJ/b2Oji4qCXFfhTHeCGAU4RYZizfJ5ClSDr6TEUnwUZs6jhMZi97KAKujWO3YrL1rNRPhdEWQx3jN1Ahp6MwxY/1rrUiONdrl7hY20c+cVAx9eQC8RrbyjdmBHQ8EjvBL/AnBAzRtV7mxLQDPfkYFvm4FUkwFn1xWB6RUQNF/wkrrpBqa3DeClXH3k5MvHfmakDD+0NZqiym0BVDQZ/fKUhGhbGdr1tn+TykaKvzJDHvXwOsULU2eTyRhuaIRSZEgPzS889VKfwELrKa5zvIncqKhcgX0FrwSxyonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ/dDAOiEa5qSHIxaxBpXBmeOoMyS4ZR4hMLUC+YnVA=;
 b=iHDwNb3uwn60KYG4qLTsc2OzsuDO0OTHTOr1WZWC7wQ/SB4bJCY0NfBJ2UN/y9m2ErZlfDKew1lSrgwszrSVdptb1+zWoA1AKX9Ib5J+U+qrUiCvMTNJ8b2jMX9ErnP94Ao/zimH2f/VkmTUQ9BP9TcH4krHSZM2d6cYbhPckLeqjAFt2rvLQeOWh+W3UFaPs/zOmjn6WCAwnWW0z75w7cxN8byJLuLFrgBfiIxYmVfmin+bwcgKG0vBGPyDTqjMYdA/9zqZaNaZkvR+xot+KA8D8PKu43WW8Kb3Hu+bcMZOhvPpRShQe+EaVu/IgaDy/a+d+cHHpEhqfhXLrndFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ/dDAOiEa5qSHIxaxBpXBmeOoMyS4ZR4hMLUC+YnVA=;
 b=2RxTRLn2RxWOM6O2ARDOY7r9McMv8+4WiMAnE8D3k72prLpxHdLVLvaOC0EATlm2KpyJoqFGi0heM49QnHik693oH45uCQ0qNB5dQJCTtj1f7zKb5D47T8tij6/c9xkl/36tLsELCAj/Aufrby/t6ANyMyfsO4t1vWieZJlc1wY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 15:04:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 15:04:14 +0000
Message-ID: <edf173d9-8b59-ecab-99d0-1063b51574a9@amd.com>
Date: Tue, 11 Apr 2023 17:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] drm/amd/display: Move three variable assignments
 behind condition checks in trigger_hotplug()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Liu <HaoPing.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
 <89048a5f-2dbb-012c-41f5-7c300e8415f5@web.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <89048a5f-2dbb-012c-41f5-7c300e8415f5@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 48781695-3e49-4ff6-ba1d-08db3a9e0349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oT4L1KbDmMuCIEoEW5a3bQGHT8Ll/nDZn9rXk9QEwgj2ERE7ufWXsLZOoA9qDmzvXe4hOaJwda5+xC3ZzfzuvJJD5B/Ixy19b/36vKlOeIam+Q0zIV0+vqk25G4b04dy4IbnSPyulEEsa0g9K1E3I05E9mGEiCmCrghMdDUycmvKbfzYG8SrXHpMcHysNK+5RAwhfl96HQEpw/LB8RjWktyimxPNEeH9xZ35C19boST80pyVs3pBw0Nol8D41pOpvtbxsn9l8jrLBfSKabline7hOxdfZCUletuzWuWiZ6+JYIYnxwakXPkmHabTQLLX9Qobz6vewz7Qst2nHwve1lULAEYMYkJN0IVDBR8QEd2qf47RIIXFeJzvUeq9QChQh9S3ETpMvZKH4UJ6wdJVZfbFVbqCUzE1Ef1jer/UG+qe3kjpGdp9i2W9eQrjzBIsR837aH6OuPukETbQ/MiJfPoN3VwoEzShqVeVr1T8Nkjoubd7IUnHQYJqMp25KvKgMj6xQVMt9BGwmpQgBQpz3/G+3vbI8xFWRgoFY2WD3ILW6DBEfDGI3RKOzM/STrJR4qweBYsNgzbRyY2WCNQVw/aN198jhUZQ/yGIfIFVtqJgTBIWvmo6nFVCEjXDD3uWx5AWU1bB/0UJFN59hnc55N5uFmecjTT2hMrTIhFIPIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(31686004)(6486002)(478600001)(4326008)(6636002)(8676002)(66946007)(66476007)(66556008)(41300700001)(110136005)(316002)(86362001)(31696002)(36756003)(83380400001)(66574015)(2616005)(6512007)(6506007)(6666004)(2906002)(8936002)(7416002)(5660300002)(38100700002)(186003)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWlWT0U4WnUyT2tSMlBaanZxNHB2OXdNYUhlaVIrU1gyRWt4Z20zTUE5S0la?=
 =?utf-8?B?NVA2a2k5OWdtaEFnNnJiU3N5K3Z1K0h3WXIwbXdDVi81eUxuOUxZWXp5bU00?=
 =?utf-8?B?N0JDWTF6WFl6THo1UmxsV29IN3ZkbEc5NTEvNFNmM2dsa3hTMmRUeUlGczBm?=
 =?utf-8?B?NnpOY3NWLytPNkpiUXFBZEphODFzSlVHaDIxd2JzeDUxeEk4RmluQzB2Ujc0?=
 =?utf-8?B?aHY0dGtUV2RGMHExaFBzY3Yra1MxYUt1OHdqdndta0l6NXVVdTZidnpBcTg3?=
 =?utf-8?B?MWE5VnYwMUdhNnRRS1BiVkFXc0o2ajlKc3kvaG0zTTE4NFdUYzRSbGI1ZFFt?=
 =?utf-8?B?bGxxc3ZEZVlSdzNGQkxybGppYzdkcTczcy9VTmN2YStUd0J0cFVXdTJKVkdm?=
 =?utf-8?B?YjI5S1lhdDkvcUFkc0xUV1hCUlJROE56RldDWXlndWNDenprNmZRUCtyK2VB?=
 =?utf-8?B?NnlXUGtydVJHVEQydEVseitieUlLdElEMTIyVHJ0dHBpTnZVSm8yOGJxQVU3?=
 =?utf-8?B?eFJOZVNDU1gzaEkzN0txcHJsMUxRNkdhR1V2dkV6bW9YRFI4c0wwQnRFWlZU?=
 =?utf-8?B?aENWTDhWUVlWUFBKcXl6SWpKZUxKRlRJRmE4WDhSZWpQWnVLMmhqbWZ4RFoz?=
 =?utf-8?B?WHVXcEpxMDUvYnlFMkx5TnBJNDdzME9jbUMyMWJ1OExCN0lQVmc2N3JLVGtX?=
 =?utf-8?B?eUo4UW1teXdWMUZFd29qanZUNDZSTi9mNFI2K0FleUx0TWpUN08vcEtzN1po?=
 =?utf-8?B?KzlpTlI3WVpQanlBczlTc3lsSmJ1VGs5blRSOUNrSmhJUXRQWmZzcGY2Lzd2?=
 =?utf-8?B?YXh0RGlGbElMSStDdnV0ejlCb3JKSDYvTVMzOEJydmlxSGUxMkNPVUhqK2dT?=
 =?utf-8?B?a3NIUXBTTkZWbGVDTDU5SzRkaXBocGVzVFJGQlFpUjk0TkVWbCttM3MrVVh5?=
 =?utf-8?B?MnlqVm8rM3pDNHhYMWNQdno3VmZsc3BRVXVMazlpVXJGYUhWUkh3WlJZZlJV?=
 =?utf-8?B?dVYrWG52Vng4Qy9GRTNmc3l6ejVKR2dibjFwZTk3RWhLVit4c29QU3BxVEhq?=
 =?utf-8?B?UVNEdk0wVVVwLytNWTdmWFJtelFnT3RuT0tuOWVreWswYnYzT0xIN0JUT2Yz?=
 =?utf-8?B?UWtBaGtIMnJHbldxODJzdmhES1NLNjZmRUZkanRTa01MVDRFWVNQdnhQNHFR?=
 =?utf-8?B?emtickRCRzUvYTBVSjFsd1VaMFh3M2Zac2dGMHVMUTdxenNJQ0tPUFN5V2FW?=
 =?utf-8?B?SThBNElyL2NXWW9PQTVBUm1vdXJIODZIVkpRb3ZPY2JOT25YS0F4WHZYVzIv?=
 =?utf-8?B?OG5MUWRsRm1iU2NzV25tK2h2ZnBINkthRmVDUzYyRHFQREJaWEJvTUo1WkxD?=
 =?utf-8?B?MXEyZGxKWnJmQjRiQ2pZQjBBREZxZEVDTVcrYXU5TnNkaXNFMjFFS2FScG1i?=
 =?utf-8?B?Wk0vcXZFaWxkSEZ1T0dzb0x0MStOWHo0ZE1lSmYvTmN1U3h2aVBtR1VLUmpP?=
 =?utf-8?B?b0VmeVZXOExKWmxIWUpISENIbDdac0UzdlltNkxNTDhJTG0yd0tTV2pId0Qv?=
 =?utf-8?B?ODRKWlEwVGlLRW1kYmg3eXhUdzF1UDNWdmpqdFdIeXYzRzMxNFJSVk10dHpv?=
 =?utf-8?B?czlWYVN2WEwycU9lL1ZtcGwwbWsyUWVCbVBrSUNneWdOYVgyOXRqWFA0OXlw?=
 =?utf-8?B?M2NjMHQ1U1dZMEI1N0JtRkJiRGRNYUtaS01XanU5TEgrRElYZEZrNTZ6OGY2?=
 =?utf-8?B?Z3owK0Y0Q1dwNFpubUNoUkZNYjJybjFTWFdEc3hTTnlNbzFELzRxbnB1c2RJ?=
 =?utf-8?B?VVc4UjdWclFxbzg2QnNiZ0ErU1o1VWJhVnFXSmIrRFNzdkY0dWw2N2Qxa01F?=
 =?utf-8?B?YXN2YTNjbFhTa1JqR1BGUWsvRTZmTDVCRWgxNE0rbkFHcXdxbldramJ6S0Fs?=
 =?utf-8?B?cXYzSnZFeFVYcnhJMXhQLzE5anNNa2N1SEtNMVdTZDZPTFFtdWprWVVIZkZD?=
 =?utf-8?B?NUNjWnJiVXRWcG55aUdrSTZXYmxra3NMZWRoM3F2RzRCbnphZ2F3MDRIaVc1?=
 =?utf-8?B?a1ozcy84ekdqdXBVOHRzMTVmYnNuSTI2bU5WR0FIS0FOU1lkV2k0WEpDdk95?=
 =?utf-8?B?Y011NWNMYWdVTnpMc3BlSHV4dEFwV3h0djA0RnJnR1JiNitTZEh0cTZwWXZN?=
 =?utf-8?Q?YWBfUIIu4+J2L8OdRTF1DYWzjxm1WIPDsBDNe3TgJ1cE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48781695-3e49-4ff6-ba1d-08db3a9e0349
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 15:04:14.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZbQVHxofFA7I4IKfeiawVLAZ/m2E5WbGsPzjzDmdoaXr0kHXQacNxoUa39LCElS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.23 um 15:43 schrieb Markus Elfring:
> Date: Tue, 11 Apr 2023 11:39:02 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “trigger_hotplug”.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for three local variables behind some condition checks.

It might be that the NULL check doesn't make sense in the first place, 
but since I'm not an expert for this code I can't fully judge.

On the other hand the patches clearly look like nice cleanups to me, so 
feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the series.

Thanks,
Christian.

>
> This issue was detected by using the Coccinelle software.
>
> Fixes: 6f77b2ac628073f647041a92b36c824ae3aef16e ("drm/amd/display: Add connector HPD trigger debugfs entry")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 827fcb4fb3b3..b3cfd7dfbb28 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1205,10 +1205,10 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>   							size_t size, loff_t *pos)
>   {
>   	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
> -	struct drm_connector *connector = &aconnector->base;
> +	struct drm_connector *connector;
>   	struct dc_link *link = NULL;
> -	struct drm_device *dev = connector->dev;
> -	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct drm_device *dev;
> +	struct amdgpu_device *adev;
>   	enum dc_connection_type new_connection_type = dc_connection_none;
>   	char *wr_buf = NULL;
>   	uint32_t wr_buf_size = 42;
> @@ -1253,12 +1253,16 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>   		return -EINVAL;
>   	}
>
> +	connector = &aconnector->base;
> +	dev = connector->dev;
> +
>   	if (param[0] == 1) {
>
>   		if (!dc_link_detect_connection_type(aconnector->dc_link, &new_connection_type) &&
>   			new_connection_type != dc_connection_none)
>   			goto unlock;
>
> +		adev = drm_to_adev(dev);
>   		mutex_lock(&adev->dm.dc_lock);
>   		ret = dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD);
>   		mutex_unlock(&adev->dm.dc_lock);
> --
> 2.40.0
>

