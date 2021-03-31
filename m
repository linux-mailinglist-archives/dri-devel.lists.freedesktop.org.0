Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A43500A5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B41F6EA94;
	Wed, 31 Mar 2021 12:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF936EA96;
 Wed, 31 Mar 2021 12:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXicXw2dE7aOFvhnhHxyK/o7tqoRY1tYQuikEU7dYpwFKd5OpXVSKgnLEJRXQG/ROJ+4hSfVyUlq5Lq94E2Ocw1zJQ5T12Rz7TONLDvE12I67avvOz/sTAjyv/SAGCz+hMIqV3q+fxtfPhZp3T5vbVq4iAyHe7jv2j4ppSPY5X1gpf1b5h/C8jRgAXPzGjBsazLo61OiDObUNczkzuBlgJwTQp3LsFI9selosEHGSmnrQujD6Fr06noPp7DlM8SPpZIBU6ry6L8VtnImwh+OUo5mRZZxfeo/U7UF7pzMwG525vNl3mn1+DI7lPNqevYD315QiBKIWeyXVoq6EefbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADZQ4L1VURUHXcWgsvnCnVwV36tOXvB3SMwGmClzsXs=;
 b=HLzlg62E2+lWvNcaznw73Bq2ne+JRJbZXxc39jAh9UMKaPqg0vnOrQT9cKsdhiyyUa7ltBS/+ht5QThFxmLhRXjhd4UjNFwLWCEXRyEH/lmr8tTXknJYkPaB+0B6WMqJNMjdcgNQ+M1m2aeeF07TsQhIRbHQqZ2TtgJvGnh+VMgDksfThYg+4/ow0lpYfpTO20jAZoElJU383ewBht3SMrbS2EInqLuNnAnk1nCtpq9Sbz3Cd3HlWbZykGQ0x+2wgJruLnfwPEAsXSLrfvXXoDsV5m51a8jGhbnT5gjYdNOfI5AzX8nwvVpAzzbL1/Fe9AK7NVzj5O+rA5sNyySxCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADZQ4L1VURUHXcWgsvnCnVwV36tOXvB3SMwGmClzsXs=;
 b=Nh0kqhQvop1ZpFdUTaghFOh3an1TeZljmflUqr1uV1kwQye43DsDGHcI40qw/qLrNjjVoPikmhX8Yj1OV3hkI0ro8EkE/5AfdsPICT+RIspJxy3KFz7v6aU4t0TcX5gnjPQdL9CktzpLIBefV4eX+bOHffkg9XUAuWg3+9Q7VBQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 12:49:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:49:47 +0000
Subject: Re: [PATCH 0/4] drm/amd/display: Base changes for isolating FPU
 operation in a single place
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Zijlstra <peterz@infradead.org>, aric.cyr@amd.com
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <85fd296d-e049-6a42-230e-17af9e1e8afb@amd.com>
Date: Wed, 31 Mar 2021 14:49:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:46d6:1b43:479c:c70b]
X-ClientProxiedBy: AM4PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:200:42::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:46d6:1b43:479c:c70b]
 (2a02:908:1252:fb60:46d6:1b43:479c:c70b) by
 AM4PR0701CA0035.eurprd07.prod.outlook.com (2603:10a6:200:42::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Wed, 31 Mar 2021 12:49:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ecdb9ee-5352-4b49-d1ab-08d8f4437704
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4000BE5D41A60C6ACF9B5E1D837C9@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwSeqDxpjUSr5RvQiF9me/BzS/xRs+BZjKKecategwsdPZ4VQSUfmf5+QtrxgFvgfgGJaS+xwEyPW0RpAr/b+13TwU5tTMyGW8l5vR+HfFEXeq3NNL94cBbshTyOt57BZjbuG7fmlKrnbdtZ/pds9OiAkR9v3PQo6UbWart2oYCVltRpFK50sQR5PlJMUdjQS4EnqbDwPSy+cLIvAr4V5TuvRPit7u34DW5uwsN6vd8KQzetJOdO3g/MBSPQXRBxZ6LSVa1nDsyF/QHNLvCBX8CRErFT9Qhr1Q3qlIZ5UTykVp3MAkCxtS0qPcfzUBkXnbyDFrdSPXrIJRncC25Y4Qn9MMFRlfmx1URxEFrcv4rP2iQk+lN10OfJEEryCA3p3i9x/Yl4Cd8ZFjN9iANi5x8H2fltDdX/uhW4Kuvcq3sPHKVhsmca5hXqkM+IDCwAHGo/pd0l924W/g0yJrRQJ7gMS0EG5vJxoAXa12oY/3E1VXfvVQOfqnNEDjvN2Zn3q9QvYXqzKSuq4/309QbMUXy/ETQnOGWO6RT2RYMnKx60jY2wMSQVLoi/zDQrrXGxMcHiYuJH91VB/KGXuGGj73paXHw16Mp1zrO9w1VjkqXizsQENrlov+puPsqHQnZYA9lBIEWBMDUrBGR7ZkdW7T6Y2kXu/kgyUC5IYMGGgeHnSi9a34v21KSY0CfmsD/xDnNp5YSEpwBGliNHugEMoiV0b8jHINpR2l4XZU3dDUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(110136005)(66946007)(66476007)(186003)(2616005)(31696002)(8676002)(16526019)(8936002)(478600001)(2906002)(66556008)(86362001)(52116002)(6486002)(31686004)(5660300002)(6636002)(6666004)(38100700001)(4326008)(83380400001)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlJXekpXSi83U2pUK3VwbDRNTkR6NmtQckJNSTRGUTVad1JOeTcxdWp4N1BF?=
 =?utf-8?B?aUNGdjdmSnJ1N05pOTc4Rmg4T0FIam9EbDh5dmM1Q08wRndIR3E2YUN0QnNW?=
 =?utf-8?B?NGRMOXY3b0tmbGtSckJQOXllOWs1YXp5ZVhUUTFtZXBHVWp2WUVheENOSEdZ?=
 =?utf-8?B?RVppYUh0MmswTllhbThMQ3VRZHRpcFVYbEhEZTJ2dGFVb2NqdExURUFTNU9k?=
 =?utf-8?B?aWs3Q2J5bmFBTlpuRUVYaUNZZURyOURhSVRnUHRQZWRnS3RubXJ1aWowU3hr?=
 =?utf-8?B?cENpWkxiaWJiZHlSU1RyWUVwcnZKb2FxbTB1b0dWVitBdjJmZjlXczBaNTdm?=
 =?utf-8?B?YUk5VnBEaHkxcWNaNTVRd0Q0Wmx4ZEJqVFZoUm1EbDViWkp6ZFJOcFpEOXpO?=
 =?utf-8?B?bm1reGx3eWdnSk02YzNaUzJmY3hUSHNWa2cxUmliMTRvaVY0QjRTdUdDZjNY?=
 =?utf-8?B?MzYrb1dkWWZWUkVhK216aHVqMkNibDVWa1dCRlNUbFZvYkc1alBwZEd0dnBP?=
 =?utf-8?B?NnZ2QjE5T1Yzb2YrQ2lIcVBVV0dDRHBHZ3I3dVM3dkZHZzFzZ0FCYkVzUGNJ?=
 =?utf-8?B?RFJnUWVkMmI2clo0NmhJOG9DQzVXYkhWa3lyUGlCa21WSFRUNWt2VUNLLzVM?=
 =?utf-8?B?SHZFMWRBS3RsVWNrVjQrandVQ3NuUFVOdzZwdEhyRi91RmQrcWFGeDBVUWd5?=
 =?utf-8?B?YXBja25lSXR1VEVGUVE4WjdZQ3d3QVkybUZLZDlZSnk4UzN0cUNVM3Bod3Js?=
 =?utf-8?B?bkZIQkxBSG9WM0YzWGpOQyt5VjM0c1F3czZLQXBFd1ZpOTVIc1p6bGNXYVl1?=
 =?utf-8?B?L25nMDMzLys0ZjJQaFg2Z1V0ak1LdHFPbkRmeDVmZEpnTlNlSm9uM1ZNeDdR?=
 =?utf-8?B?SlpUUFkyZUFBRExwVmNOSkZIeWViZzg1Mk5BU1VSM1l1OVFObWVrUXdjeWdF?=
 =?utf-8?B?UnZncFRJdzh0SG84OVN2NSt4cTIza2NMUDMwQW1mTXh5b0d3aGhadE00UUhS?=
 =?utf-8?B?eFBZanZBNmprR055T1ZrUHpmMkR4L3AxYjIvcnJUTEpQLzR2dmV2azRROVhG?=
 =?utf-8?B?UDAvYkJ6bmtSVlY4L0Fla3pGWGZwWXhqcFcvZDBKczJGWWtQODgyUjBDWW1Z?=
 =?utf-8?B?L2VHQXFudGI5QW5xWS9iL0FwSWZrUVRFM28zdFJscmZtRlR2enA1WDZzWXlX?=
 =?utf-8?B?cVRWaDdDdTk3NTdsbnppeDUrTE1hRnlyWDhSckZLRWJVYzZwRm83QlVqRXUz?=
 =?utf-8?B?VlR5L1ljZGFBQlNPRTNiejBkS3FRc2hpNHZ1K3FMWTFwUDdJRy9VNEIyZG5I?=
 =?utf-8?B?dS9RTXQvc3I0NWNib2NGMHM3TTVQNE1xV2orZ2dOaHc4OWU0ZE1zTC9Pb24v?=
 =?utf-8?B?SjBEekZBM3pCeDNLenA5U2pIaXVNNXlIdjVCcHAyN2RqaExqc1JLM0NaN3BD?=
 =?utf-8?B?aHNrVXBhaDdiTkVxWDlDTTh2L05BRkxkTGlYTnZEa2lDZ2s0ZUFpWUNpYkFh?=
 =?utf-8?B?QUw2eG5ORnhjblA1KzlMTG1aQjBiSkVXVGJiK0xieGljTkhhZEVzRTc5Rzhw?=
 =?utf-8?B?TDdySHRqWWtmdTNKMEE2RTZMSDhKb29xN05BbEZ4cllEaktoWUp5TWRUYk92?=
 =?utf-8?B?UmNVYStvK0Y2Y1pYUkJ2WXFlZGZJd3lZVTRUY0FUcnFiV1VGc3RkeGZ0MFhV?=
 =?utf-8?B?a0lVaWRzYlZ1RWNJanRWUlpmRkFHeVpKUkZ6NEdUOXNDTlhpMHJscU5RRzhP?=
 =?utf-8?B?bFFZK0hPMFVXNlNvM0NDaVJqUVNBVWRFTFA3VmlvaDZSeEVKdCt0UlJYVzg0?=
 =?utf-8?B?eC9QbG1LM1BmRHRWMFpTMlNsTjc2R0FwWDZEWDdwcks2YTg2VnZGVVlVMXN5?=
 =?utf-8?Q?rkXjz1f/S+8Ne?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecdb9ee-5352-4b49-d1ab-08d8f4437704
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:49:47.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCuf/OqrL0CqsTNQ/53ssjjAT/9o+eq71LLLC5hYMIiqOewAwm9G3qvEQN8GuQPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

I'm not so happy about the whole recursion thing, but I think that is 
something which can be worked on later on.

Apart from that the approach sounds solid to me.

Regards,
Christian.

Am 31.03.21 um 14:24 schrieb Rodrigo Siqueira:
> Hi,
>
> In the display core, we utilize floats and doubles units for calculating
> modesetting parameters. One side effect of our approach to use double-precision
> is the fact that we spread multiple FPU access across our driver, which means
> that we can accidentally clobber user space FPU state.
>
> # Challenges
>
> 1. Keep in mind that this FPU code is ingrained in our display driver and
> performs several crucial tasks. Additionally, we already have multiple
> architectures available in the kernel and a large set of users; in other words,
> we prefer to avoid a radical approach that might break our user's system.
>
> 2. We share our display code with Windows; thus, we need to maintain the
> interoperability between these two systems.
>
> 3. We need a mechanism for identifying which function uses FPU registers;
> fortunately, Peter Zijlstra wrote a series a couple of months ago where he
> introduced an FPU check for objtool. I used the following command for
> identifying the potential FPU usage:
>
>   ./tools/objtool/objtool check -Ffa "drivers/gpu/drm/amd/display/dc/ANY_FILE.o"
>
> 4. Since our code heavily relies on FPU and the fact that we spread
> kernel_fpu_begin/end across multiple functions, we can have some complex
> scenarios that will require code refactoring. However, we want to avoid
> complicated changes since this is a formula to introduce regressions; we want
> something that allows us to fix it in small, safe, and reliable steps.
>
> # Our approach
>
> For trying to solve this problem, we came up with the following strategy:
>
> 1. Keep in mind that we are using kernel_fpu_begin/end spread in various areas
> and sometimes across multiple functions. If we try to move some of the
> functions to an isolated place, we can generate a situation where we can call
> the FPU protection more than once, causing multiple warnings. We can deal with
> this problem by adding a thin management layer around the kernel_fpu_begin/end
> used inside the display.
>
> 2. We will need a trace mechanism for this FPU management inside our display
> code.
>
> 3. After we get the thin layer that manages FPU, we can start to move each
> function that uses FPU to the centralized place. Our DQE runs multiple tests in
> different ASICs every week; we can take advantage of this to ensure that our
> FPU patches work does not introduce any regression. The idea is to work on a
> specific part of the code every week (e.g.,  week 1: DCN2, week 1: DCN2.1,
> etc.).
>
> 4. Finally, after we can isolate the FPU operations in a single place, we can
> altogether remove the FPU flags from other files and eliminate an unnecessary
> code introduced to deal with this problem.
>
> # This series
>
> To maintain the interoperability between multiple OSes, we already have a
> define named DC_FP_START/END, which is a straightforward wrapper to
> kernel_fpu_begin/end in the Linux side. In this series, I decided to expand the
> scope of this DC_FP_* wrapper to trace FPU entrance and exit in the display
> code, but I also add a mechanism for managing the entrance and exit of
> kernel_fpu_begin/end. You can see the details on how I did that in the last two
> patches.
>
> I also isolate a simple function that requires FPU access to demonstrate my
> strategy for isolating this FPU access in a single place. If this series gets
> accepted, the following steps consist of moving all FPU functions weekly until
> we isolate everything in the fpu_operation folder.
>
> Best Regards
> Rodrigo Siqueira
>
>
> Rodrigo Siqueira (4):
>    drm/amd/display: Introduce FPU directory inside DC
>    drm/amd/display: Add FPU event trace
>    drm/amd/display: Add ref count control for FPU utilization
>    drm/amd/display: Add DC_FP helper to check FPU state
>
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  24 ++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 111 ++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  34 ++++++
>   drivers/gpu/drm/amd/display/dc/Makefile       |   1 +
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |   3 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |  41 +------
>   .../drm/amd/display/dc/dcn20/dcn20_resource.h |   2 -
>   .../drm/amd/display/dc/dcn21/dcn21_resource.c |   2 +
>   .../amd/display/dc/fpu_operations/Makefile    |  58 +++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 106 +++++++++++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.h |  33 ++++++
>   drivers/gpu/drm/amd/display/dc/os_types.h     |   6 +-
>   13 files changed, 381 insertions(+), 43 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
