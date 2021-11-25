Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76645DEA2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 17:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0386EACC;
	Thu, 25 Nov 2021 16:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24726EAC2;
 Thu, 25 Nov 2021 16:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjTA0pFGZNcXIYMuUWWsHyBMOVl1KVzC6yDERM4k8vh5TE+jNlMJHi4s+3KIjY+FKk2pv3g798GFHl8jo9a7y96d0IYR4i26VeQ09s2hyehjLbI7i8cQN3hLcFDUHSfrJ/Kk07yh8klRmtEcfHw/evbZIcz+1e6qgbT3BX7NYfmHN6ARDhvNMz4yWgAt8XwULz+TKXmB2thnRVjk2/UtsoHVNJqfbmdCi4NoPJNLA7BUiPqOUdk7idSrdBIpMGqhNKwSF2XzPQyEkfVTs6AFuTbeMeOpi80MKDB/r7y4eGqBt3zgEaBMGiynFFp/uLe0s7tBMdeVOPz89m3Yc+Zumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnsiW7oaSUQLQS/cJUL3RuFKlUqjZIjaUrspWMFZ4fo=;
 b=hIeqxU7iDYEuU3n3nDjLLdPqwzFnW1BY89s2JMezLMnU6vP3Y1l3XZA3LW73msuSmoF9RgP9Ud8DIlnPPTKNNRY2ucrmuczCQPSG+utGq7Ws1OOI5kUNC7t0pPo6rUx6n+Zpa6hedtDUQgtB7hQw34VMCiHtiA7o1hwGqegnMH9T3VT7qnpN4uU/MWjUcG9Ca12UwGeW4KGYKS5h1jR5DaHPr+49qcuq2pu5jVIzJTK/bepvIcelVxE0W46XDgQJKvqVth2qlfDaYV0jDySEo0+Ue4O8VonFsztz1oduzEKcTg37laPOFAkakttVYAhU5v8byTnIaumIjWboiukZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnsiW7oaSUQLQS/cJUL3RuFKlUqjZIjaUrspWMFZ4fo=;
 b=0Vvok7+aSWxcFYKiE6SQMu3f2gJ8Nw1jPfJzRlOPDepNMTSKMpVFYM7BNq/TcIHxPaV56zTWqqjiFDZScwA/0ywc4Kc3vHcA7rBCoIRoqEz+3HwjBsz5OF37urZXThPiQ4Sb0aWwksVtXxNGG/GuAfgCsNhrwmeN1tHqcaJHUhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH0PR12MB5107.namprd12.prod.outlook.com (2603:10b6:610:be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 25 Nov
 2021 16:32:33 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::6147:a3dc:dba5:60ea]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::6147:a3dc:dba5:60ea%9]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 16:32:33 +0000
Subject: Re: [PATCH] drm/amd/display: fix application of sizeof to pointer
To: cgel.zte@gmail.com, sunpeng.li@amd.com
References: <20211124030426.34830-1-lv.ruyi@zte.com.cn>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <15100102-406d-c327-42b6-fe83b446122b@amd.com>
Date: Thu, 25 Nov 2021 11:32:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211124030426.34830-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::29) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:56e0:6d60:d8b9:6fc7:5c8f:82bc]
 (2607:fea8:56e0:6d60:d8b9:6fc7:5c8f:82bc) by
 BL1PR13CA0114.namprd13.prod.outlook.com (2603:10b6:208:2b9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Thu, 25 Nov 2021 16:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf7a13b-fa31-4e50-7354-08d9b0312e6a
X-MS-TrafficTypeDiagnostic: CH0PR12MB5107:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5107D5527CA784E3E649D7B198629@CH0PR12MB5107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NgbzzcKcPpkqIP8yuPdvywMB59PmURcRDL0WWWK6zMNV6rKhZfqWybxmHrB3hwSVhw6NpXFJaKM7xOJCgWM6AeH+RYLwb0jyAbysHerKjgWfwwpjB9VM4z2F2da9/TvAYXAdJKcSiWXsGE2ClVzfC8re+CMPoJZ1IQoRdOmGm7yJz1dTX9fVKEgQrOgT5SnwZ2hNXF+ufU0Yo2u8E16hlChrozpQh4Fv9q7qRvlO5OB0ELxgxtAlpthcinecBsBEmIEKeO7kp3MqbP9Nwk2tUZBRFmYMaRWaHXHAgykXuufVAJgykOQTEml89MWBOAh0V8/CaoMzMtDIDzOcKD2V4rSNdA1Wz6nyjPMh0GWgi03u0jSYlDN+SQDg4+1EcA5QKvQKw4df6hHuWnylVkq5Epzzbqxd7fLU4MBbJjo3NFXX9f5pz6KwdmqroTO8DFbmImsgUGjQaRiV9wx8ZOQVxyx21JnGDYLOqEH85/wpAss3wuNPU21LsaoTxJHGhb4KsjFizKN6rNUe/pweOYubFkzGt57yZqr7BUFM6ma8+b1S3P5yYfxSn/jx3EKDe5NHI0PfhCndUJfCWLezfvFBc/2ERFygx+cM7bzRbo2wnk9+5ODKb/sMeCFMAXrfQJ+lGSSZXgh8VFmwrXMTPnsz5ydNA6WVgXvVoK2sr4Wj/lBV2LhJxu6+/PcoS3o9a8XmK7p9qVcqoi1dhQS1arU7v8YCTbJfHQMOobtaDtIvjVu5b74WrNiqxB5Mhpvd50T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(83380400001)(8936002)(508600001)(53546011)(4001150100001)(5660300002)(2616005)(31696002)(6486002)(31686004)(2906002)(6636002)(66476007)(66556008)(8676002)(186003)(316002)(66946007)(4326008)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk96UENsTmFLR3ZIcFVhOTNPU1VVRThteFgrWS8rZWd6VG5GSEpBSzBnNW9x?=
 =?utf-8?B?WlFSTDRNcTRaMmVESk9mUGZ4eUhCYWo0OUFQWDBJdmRlWUZRTmlVZG85Ny9J?=
 =?utf-8?B?SW9KcDZzU2w3UVEyZ3kvVVVXbHdHa1ptK2FXZnJiMUJMUEpLV1FFTkRkREs5?=
 =?utf-8?B?SzJlaWRJR04yWHFsZ0pmeVNnM09ybmpoTUFGUTEvamgrNTFGNmdacXhhNWI0?=
 =?utf-8?B?YmJLTlFhZ1FkYUI3N2xSVEFUd1NNUFMwVk4zYjVQbzRVM3hyZkxOdFRiTW1S?=
 =?utf-8?B?c3VHSjlMaG5VT01iVlIySDJrNHZIUExDTTFLVG5BRGErZ3RzTDdreTNQMmJ5?=
 =?utf-8?B?dDc4cUFUWjF6c0FQSDZ3ckVQVGtmWWE3VldwVkJvR2h1U0dYTmpVNFhodzdC?=
 =?utf-8?B?UnZBeDh2QWRFOHJMN29BQ2VTck1RS0RnaXJpWlo0S0hnd1VZMFJYWDdqSEZh?=
 =?utf-8?B?UkdZRThpZk5BQVFEei96WFNFNmszTk5nQ1ZVaFkxcXAyWjZpblQ5V1habmIw?=
 =?utf-8?B?d2gyRTBIcm1PNUM5SmNBSWRiQXZUNVZ2di9Zd2ZMV0wya2taWTAwaFd3K0x2?=
 =?utf-8?B?TWxyM0dBalVraXhCcVVVMnhNditmb2U4NzN4alh4MFpoa29tR3JDdkJHT2FH?=
 =?utf-8?B?VFQ3bzF2ZXVDS0REY3IwdlJ1cE5WWU0zRlRLTkM2WmR0UkM4c1ZneXZYNHM3?=
 =?utf-8?B?TGxHL1BkVGFvTkhHbjVVb1dwSlRHb2N6V0l1K3ZCbTRwZEk4OVROZTJrVjlJ?=
 =?utf-8?B?SmJkaE52Wk5MTzhmVS8yM2FQNnY3ZUJxWTYyQVFGT09IWVlYM29kdXhZKzNR?=
 =?utf-8?B?VWJiMU84dFpML2h6MFVwT0w1ZUNPQk9paHZ2MWZoTFdjY3NQM2RpeHVralRC?=
 =?utf-8?B?WG5tOHZQb2pDalpnM0NtZUpUWGNvZDQvWEM5L296bk5kZUxBL1ZFN0djcE9B?=
 =?utf-8?B?S2xrMCtpaDdRTG9tNUFMb3JLTlNDY2ZuQURLWFFQaXlUOTVpdmZMUThkVTV6?=
 =?utf-8?B?d0J5aUNHSlJWcCtyQU5Dd3kvWlV5dWxmTUc3K0UvUWtmUHV5a1dicHVQRy9u?=
 =?utf-8?B?YXFiZk0wOWpmWGFuVi9EaTREN1phOU5zK1ZkNmYxNHJ1N0lwNzErOXlkUlM4?=
 =?utf-8?B?V1ZuR09iZW1GZnJ1cndlVk5MWDkwMkJWdG8xVmlLZFB6cnRRSUpTVGRMMTd2?=
 =?utf-8?B?QitRbmluU0FzRWtja2o0R3hvMU1JSlZRMnRpQW5UVTNQTlZ6WDRqaUp3cEFa?=
 =?utf-8?B?RlN3aUVHN2tlSEp3V0RlM09TYTJCNmcybWdVYlpjSUVXYXVUM3VsclVmOSth?=
 =?utf-8?B?Vk5DSGJ5S0gzbllEZ2t1aGxTT1BaTzdRY3drOUxqaTdINGFNcnk1NWZuelkw?=
 =?utf-8?B?RmwxY3hJV2wrOS94aXBrTit2VUZuK2pQUERLdFVvemcxTGowVmlKbnVsTVBh?=
 =?utf-8?B?aFZqMmIvRUVVKzB3N0x0cTZXdy9HbnZVZjNvaDVWY1lSaXlvUkw0c0piM1Y4?=
 =?utf-8?B?R3JvUGhWSFc5L3I5d1pKTDRjY0E0ck1hRlpBZ1VPN2lwWHJNbGQ4b2xiU2pY?=
 =?utf-8?B?NWdwOGtITjNOQzduUWoyWURvUjdRNDQrK21RSkxVQ3ZIaGgrdkVyaFoyeVJn?=
 =?utf-8?B?TDdNZHU0MGpQdjdpMXk5bWZOdGhZNFhXWWdPbEorOWFGM0tRU3BhY3dHeXVa?=
 =?utf-8?B?MklhSGVZT0VFZlgwc1ZpNFpDSkVtMzRTSURiSDBrT1ZkSnk3TU8xY2VYZVpG?=
 =?utf-8?B?NGlOb3o1ekxCWkd6N1JSUUZVNklja1Uwd3VuaHRnT1E2YkhIOHRnbzltd1hN?=
 =?utf-8?B?eHVSUlhpUy9tWHVzNlU0eWRuR3RVVUVwaG1jZXlWT1VMSUE2MGRITkYxMjMr?=
 =?utf-8?B?ODdvd0lGQVg4OVo3d0RvN21ra2VjRTBEd2pUSXcyYWYxWGc5RmFnc1BsdDhW?=
 =?utf-8?B?eDlIbEorUVZjWTl1N2I1S21SbFc2dlBBcVJYRTltVFpmU2NYUERJUTZNT1dD?=
 =?utf-8?B?TU9DaEFSRCtVb201TXhoR1p1YVE0b3RiSmx1QUQvOEpaMitLWFFFamRhakxj?=
 =?utf-8?B?WVlYaGJTSDE4MXNFeXQ5aTJLdmJFN1psT25XdWMveHV2R2Q4WVFVTWp5L1JL?=
 =?utf-8?B?QUdxeHJaUXIvQUJEaFhKbnpFSHFGR2g3aUpicXppT2R2b3NOc3gwY292TjNE?=
 =?utf-8?B?OGlobjlvT2xkSHNtcUdxZXlmQk5yRE5hcmFoSjJQQXZQcnJqeElRd2lVbUFP?=
 =?utf-8?Q?FbWf2FRwTzAFihGpHK8UShF0A0wmqsmbPtRfH3FxLU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf7a13b-fa31-4e50-7354-08d9b0312e6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 16:32:33.1505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpDSD6Ts5dcde8MXeoc5GSmxyzg3YyGaGLgnOht/Y011K5ecZTOGSsr72WxAzc9/FpOhzwe51u3B/WVQFG3HFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5107
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
Cc: airlied@linux.ie, lv.ruyi@zte.com.cn, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 dri-devel@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 jun.lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-23 10:04 p.m., cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Both of split and merge are pointers, not arrays.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
> index ece34b0b8a46..91810aaee5a3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
> @@ -1223,8 +1223,8 @@ static void dml_full_validate_bw_helper(struct dc *dc,
>   		*pipe_cnt = dml_populate_dml_pipes_from_context(dc, context, pipes, false);
>   		*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
>   		if (*vlevel < context->bw_ctx.dml.soc.num_states) {
> -			memset(split, 0, sizeof(split));
> -			memset(merge, 0, sizeof(merge));
> +			memset(split, 0, MAX_PIPES * sizeof(*split));
> +			memset(merge, 0, MAX_PIPES * sizeof(*merge));
>   			*vlevel = dml_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
>   		}
>   
> 
Nice catch!

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and applied to amd-staging-drm-next

Thanks
Siqueira
