Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F423D6FC7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 08:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB41E72C5E;
	Tue, 27 Jul 2021 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA8972C5E;
 Tue, 27 Jul 2021 06:56:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em+BkT8EIJwaRpcDGMF2Sm8ztuHCjiYTOSMRIUe86izlTy+/GqX5vXk8i/uibZGSVOElvkgcxqeQaONddpCOBYH4ezqApB6AkDNEJMdsxRkSJWnQcdIzlzAXDPx3uejTTPbcSLQ4quDOUe418oF+0BU8sDoij6p3s/HN9rb2E2F+bSP/zTxE4gIc26QrWZ7yo8Lzd9UquKt6zn3OXPtS/27+doTm83dVNTOHZxdFzrSYPVFG9LOzV/7S7amSW3gbnWsDapM/vktR7LR7ippoivQobk77gy0OLRBKMRJygcs6Ol3qNFKXD/8r7PwaTwzc1l3Cm2fJbT4+79i4iAqpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hitC7nxxArTl4Jw3+3hzmZIjKPXP8Jz0Zv2ECIV2KNg=;
 b=cpJ0uEz4LJSauF7QTmFAQG48AezylRLAQUJHzIg0sedk7y2wIUZDoDUt03PBJ53bQchiKzOPpLG3566d+4AgJ01ZdzRkKWASJtUjm+Py7wTvcn/qyI21TAwhWIF5LJ0IFetNO4V34wDhpUCh/UG2CtNb2OG87ecBfGoO/NHj09hw2YiRI4wWH14l9gxJDUHfNLL3i8iwZP96X+mCfhjzRgZ6HNMnY+BXS7Zzz9yY1JjHXAt3T7BJEiQWokEqKZtRLVD8EonUSRnQVi6CC1dmJFrp7KGNDPvFb8z6CtHCfJllqSiVFoRYxw6C53bzgAKnIlsDfka68ugDbcxYC50cGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hitC7nxxArTl4Jw3+3hzmZIjKPXP8Jz0Zv2ECIV2KNg=;
 b=w1VpvAYOulMlMOmsqmzHcnzjLIKaWxlxfKVEW5GNBlSvJS6Hrap3MBFaax7dpL4lcuZKMYNPHHgjTxCGrNHLlfEe3DdcAAlxsTdaRJJSc7oS8k4lv+LVTTMRj99L/obc7ml1USnU37iWXQ3/cbKfz91omIN7DOr511ih5xBctkY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 06:56:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 06:56:12 +0000
Subject: Re: [PATCH v4 1/4] drm/amd/display: Move specific DCN2x code that
 uses FPU to DML
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, roman.li@amd.com
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
 <20210727005248.1827411-2-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3674a80a-4d81-ce80-2337-fe326cf9bf39@amd.com>
Date: Tue, 27 Jul 2021 08:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210727005248.1827411-2-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:101:16::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae22:6310:9a31:9877]
 (2a02:908:1252:fb60:ae22:6310:9a31:9877) by
 PR2PR09CA0009.eurprd09.prod.outlook.com (2603:10a6:101:16::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 06:56:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2293ccf2-ccf0-4022-1ce0-08d950cb9e93
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42210FB119465594A30C047F83E99@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7HmHRbjsUt6V2Qem0R+GPKrRt7YcvqZ7kgwAmpsCupVIUXBBd2iEiuyFNPJdhPmSfUqIeGIaML/SHmWccPEzG8e4U5dT6wIDKmYqJGIChsxLZydunDpCN0X0S8YMz1aeLfvU9eoidQm4fmeNHvKQxXbH2f/TXCPqAgLo7Irpk45UqKyFyr3iYoa4wjzFO1u0LHCpurtEapy9Ri9ZLqs2cz6CUxGmgJvDspHsIsdoZEs0hdyXJwWStYW1rsnqTqkTmnPOpGVkeQlSo+fPrHpFTMuKJkJcE73rvT6ngi8oa/g30UIzk1qAF/IrMd24z14g0PHAZ5N2vkRco9EAmwumzsskT9ITnfZ5Lja1FP0E4v5IaaOIBHufDEtY7BFTOkjHyqB8BzS2UrIinSHH8mcGyW8O7Rl5mSXIOw5j9RAE/s87clslTBKJ5SEQlDTdTuKJ9H7gNtIxHFkhF3GmP6G2T/l2SuQa3k1i1Mkg8WcgksRLJZGqLR4EDKKj+xbzQ9b4wpPFFA/+OyF+Y3vWq5boPXOSrZDF/wnHT3XoVeESqbVNkIucVp5U+JamAhW6MmaRHW9i+ASEQIyvDEHxdhiD6zsp73OWc2QPF3evTk8UpjSJrjkpcnzAsYhlM00dw0J/rd8GVQV7fZFnnB57KR/+lSbTx8ouurWOFKCjypKCHfUs5GBVfuSWpsQfJgIQJ6s7/SxCU+cJHPfjIHoOl+9Wbhd/QkInp4Ewy1cTMXs5lQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(316002)(6666004)(83380400001)(86362001)(54906003)(66556008)(8676002)(5660300002)(478600001)(66476007)(6486002)(66574015)(66946007)(36756003)(4326008)(30864003)(6636002)(38100700002)(31686004)(2616005)(2906002)(31696002)(8936002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtGc1NuOWQxUnByS0crbGFVanFtZGlObUduVFVFUEswZVNrWFlUWnZJUU1Y?=
 =?utf-8?B?Yk1PcXoxYVVhUEVwbTcxZG5NZ0tUcnFRZHRkR2xMWjE3eFZkdlRrSU1oRmN1?=
 =?utf-8?B?eG1ObU5RcGY3dk55NXkyaW9rc1RRWkh0Q1d0NUFWd3o5U3BBQ1NqQk95V2di?=
 =?utf-8?B?bE5WdmZOdVc0aFNOeGYyQUdiZW9jVTh4am1pUWVTcCtRR2c2MWU1cEVBdm1z?=
 =?utf-8?B?R2xMSmZNY0JJcTdYZnczTWNsS1BuK2VieTdObWJzT0w2YXNNb1JGQlQxbWZn?=
 =?utf-8?B?TDNIb21VaVlOUDZsT3JWSDZQOWoyS1lOUVpCdzh5ZXdCbWxVZFlQcmQ1TWtV?=
 =?utf-8?B?L3c3ZzZSYXpFT0xjd3pWUExFYjk3V1BFbFViTXROZ0JadzNCN3V1c1VoRWVQ?=
 =?utf-8?B?dWxwcVJySGdIUGV1TWNsRFdTVEFSaHFLUFJQM1RCRDNwNVVUUXFzVlhaV1Vh?=
 =?utf-8?B?dDdaT3I3T253K2Rkb0dnWlFpb293RkR4a3N5bWxnZi9vM1dGN1hDc2NIcUN6?=
 =?utf-8?B?Q1RwdTlsSXBFSWZDRm1nTExweHhIS1pORFJuTEtwN3VJTmdUa1ZUMXBhRkx0?=
 =?utf-8?B?VThESDFiWFpsMlM1MUdkdi9WRVJJaXowWUZ0ZlVKMllzQmdoR0IzeVoyRWxt?=
 =?utf-8?B?Mmw4am4vb3pGYmcrdit1NVVMcFg2S3VnNmdjK2pJZUFvdW1tUm5TWnU3TnI2?=
 =?utf-8?B?ckRQVDAzSnJuMDZ0Qlp1Tk9NQUtTMndMUjRzamh1aGlYeko1dGRaSTRtVEt2?=
 =?utf-8?B?eElQaDNML1RSRE01YTFmc2JBQXdFZkJSbEJ4bnlldmlXOHBGdWZrR2Rua2VR?=
 =?utf-8?B?RWZUN0JLWUJOay9ERVVtNmZXWnc2YTg2WHZOOHFMZCtYOVFDOVZXb1dPOVlF?=
 =?utf-8?B?U0paU1pLS2NLNGhJTm0yWS84aWE0SzhhQndNMnNsZVVPUExDRTY4WFBONWdU?=
 =?utf-8?B?cHZGS1RkQ25WRFhpVUxHOWE5R1g2MFJ5S2JGRFhpQXBheGxPb3drN2pVbVJT?=
 =?utf-8?B?UVNqbDNXeHpnZnJMNGFRdjRST2FETlVMNC9HbDBUUFh2RDQxWHRQMTNMK0ZT?=
 =?utf-8?B?MVdUbUw3NExwMkNSb2N5ZDloeXFHcDBDSzZnTjJHcWt0bVVVcW9JQ1h3YmFi?=
 =?utf-8?B?ZzM4a1Z0ZWxtRWdlOGdSUWpDRk1IR3FuUzB2RG1Kb3NOZ1RGckR0K2ZEMk5s?=
 =?utf-8?B?eS9GVENITWZvaWw3bFNkcUd0N08yaWhqNUF3TkcxUFFCbVJCS3dqb2VxWFBT?=
 =?utf-8?B?SVI0NjN3SW93TVRuQU9pZnliVllrTzdHelg1RGQ1S2tYTjRWNlpTNUtiaGJJ?=
 =?utf-8?B?TndEUTlKL3JaZjNwdUhpTHRGZWhlWnlZNVc0cEJXdjJ1djdJeXdWNHlzR1Iy?=
 =?utf-8?B?WVh6L2hWdko4b3RNbXZoT1BvQWY4ckdHUW5vem1ESWpzR25Pem5kMW5FSk01?=
 =?utf-8?B?VVRtSVdJNnZHblRzMVNBM3Y4SDJzL2MrWHNzbUxVc3N3TXhnTnV3WTVjTGgr?=
 =?utf-8?B?RUk2U2RBV1BVOHQ2NlFUZVNnVlBKRlBwMVJRajBVcUtpSDVXVzJUVE5BOGE0?=
 =?utf-8?B?YUNaWmI0VFBlalYyQUVWS0RxMk1qQ2xkaThOUzcyUXBQaWxqVlBMTnhHVlAr?=
 =?utf-8?B?Um16cCtONmpZR1o5VE10NzhhMkFvNUd5NDhiN0ZxbmIxMzZDdFlRRWhJMDhV?=
 =?utf-8?B?WWhuK2N5d09MamMrNTNFUWNBYStSbzU5ZWhKdGpFMDlrdUQyTnZWdWY2WnRD?=
 =?utf-8?B?QXZoRGRVYW1ZUG9ERGlRb3UvZVUrejVPUzM2ZE1TcG96TUxmRlkyWFRaUW1j?=
 =?utf-8?B?cU9wbjBndjI5UWRoNXJYNE5rd3lWWGhZVWZ0NDJJUjBGdkVXVjhwOURSaGti?=
 =?utf-8?Q?92PIOGDekvMg8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2293ccf2-ccf0-4022-1ce0-08d950cb9e93
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 06:56:12.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qEr9DGyM40qxGhKg69p/CgSJM36BdrL8KpN7RVVvIz1X399snrdl/NYjOFxh94I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 02:52 schrieb Rodrigo Siqueira:
> The display core files rely on FPU, which requires to be compiled with
> special flags. Ideally, we don't want these FPU operations spread around
> the DC code; nevertheless, it happens in the current source. This commit
> introduces a new directory inside DML for centralizing shared DCN
> functions that require FPU and have been used outside DML. For
> illustrating this process of transferring FPU functions to the DML
> folder, this commit moves one of the functions
> dcn20_populate_dml_writeback_from_context) that require FPU access to a
> single shared file. Notice that this is the first part of the work, and
> it does not fix the FPU issue yet; we still need other patches for
> achieving the complete FPU isolation.
>
> Changes since V3:
> - Jun: Instead of creating a new directory to keep the FPU code, let's
> make the DML folder the only part that requires FPU access. Drop
> fpu_operation folder.
> - Christian: Fix function code style.
>
> Changes since V2:
> - Christian: Remove unnecessary wrapper.
> - lkp: Add missing prototype.
> - Only compile the FPU operations if the DCN option is enabled.
>
> Change since V1:
> - Update documentation and rebase.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>

BTW: The "Reported-by" tag is only used for bug fixes, but since this is 
a new series and only the test robot has complained about it on the 
mailing list you don't need to add it.

> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
>   .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
>   .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   |  4 +
>   .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c  | 84 +++++++++++++++++++
>   .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h  | 34 ++++++++
>   6 files changed, 126 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 0b1cd1dbed8b..988d7c02199c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "dml/dcn2x/dcn2x.h"
> +
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
>   #include "dcn20_hubbub.h"
> @@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
>   	ASSERT(primary_pipe->plane_state);
>   }
>   
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
> -{
> -	int pipe_cnt, i;
> -
> -	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> -		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> -
> -		if (!res_ctx->pipe_ctx[i].stream)
> -			continue;
> -
> -		/* Set writeback information */
> -		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> -		pipes[pipe_cnt].dout.num_active_wb++;
> -		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> -		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> -		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> -		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> -			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> -			else
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> -		} else
> -			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
> -
> -		pipe_cnt++;
> -	}
> -
> -}
> -
>   int dcn20_populate_dml_pipes_from_context(
>   		struct dc *dc,
>   		struct dc_state *context,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> index c8f3127bbcdf..6ec8ff45f0f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> @@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
>   		struct dc_state *state,
>   		const struct resource_pool *pool,
>   		struct dc_stream_state *stream);
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
>   
>   struct stream_encoder *dcn20_stream_encoder_create(
>   	enum engine_id eng_id,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index f27fc2acac57..fbbdf9976183 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "dml/dcn2x/dcn2x.h"
> +
>   #include "clk_mgr.h"
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 45862167e6ce..56055df2e8d2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -58,6 +58,8 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>   
>   ifdef CONFIG_DRM_AMD_DC_DCN
>   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_ccflags)
> +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
> @@ -70,6 +72,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(fram
>   CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
> +CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_rcflags)
>   CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_rcflags)
> @@ -91,6 +94,7 @@ DML = display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o \
>   
>   ifdef CONFIG_DRM_AMD_DC_DCN
>   DML += display_mode_vba.o dcn20/display_rq_dlg_calc_20.o dcn20/display_mode_vba_20.o
> +DML += dcn2x/dcn2x.o
>   DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
>   DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
>   DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
> new file mode 100644
> index 000000000000..8f0f6220327d
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include "resource.h"
> +
> +#include "dcn2x.h"
> +
> +/**
> + * DOC: DCN2x FPU manipulation Overview
> + *
> + * The DCN architecture relies on FPU operations, which require special
> + * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
> + * want to avoid spreading FPU access across multiple files. With this idea in
> + * mind, this file aims to centralize all DCN20 and DCN2.1 (DCN2x) functions
> + * that require FPU access in a single place. Code in this file follows the
> + * following code pattern:
> + *
> + * 1. Functions that use FPU operations should be isolated in static functions.
> + * 2. The FPU functions should have the noinline attribute to ensure anything
> + *    that deals with FP register is contained within this call.
> + * 3. All function that needs to be accessed outside this file requires a
> + *    public interface that not uses any FPU reference.
> + */
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +					       struct resource_context *res_ctx,
> +					       display_e2e_pipe_params_st *pipes)
> +{
> +	int pipe_cnt, i;
> +
> +	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> +		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> +
> +		if (!res_ctx->pipe_ctx[i].stream)
> +			continue;
> +
> +		/* Set writeback information */
> +		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> +		pipes[pipe_cnt].dout.num_active_wb++;
> +		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> +		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> +		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> +		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> +			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> +			else
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> +		} else {
> +			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
> +		}
> +
> +		pipe_cnt++;
> +	}
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
> new file mode 100644
> index 000000000000..331547ba0713
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __DCN2X_H__
> +#define __DCN2X_H__
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +					       struct resource_context *res_ctx,
> +					       display_e2e_pipe_params_st *pipes);
> +
> +#endif /* __DCN2X_H__ */

