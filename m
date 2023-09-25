Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5A7ADCA1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112B610E293;
	Mon, 25 Sep 2023 16:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5AC10E295;
 Mon, 25 Sep 2023 16:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3uOOsQuV+HO8I4OkWCRt3kttRMe0bIUUsSDMvwsHHvhx2V2Y9lVJ735Mj2B575HVoHbaXceXI1lIdDuPxH0hmYH0SRt+OeMxc2xIgD1Pe8KlNxzZaylBLAIstDKzPCgJ4nlxyktlVi7+wZd25THeQyBHx+cfvqsLvRLQSlfzCZ1X3DcSi+fuWvugRZgVIj2WBITpcU3IKxcdkIHm1G1kmiighhfeI+bTRmL7A1ftZRL9FAx+feou5dOdsaWlT6/FeIB2owIDOzHtA+M3/oiryN2DubH6AuTpOUBrZL/VSkO5co3hZg1EOV9zF6kw0L/d64NQ+PLWc0fo/DOPjVDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSrn9r2bIC2ay1LCL487D+sG9A62J4VEWA95Q0tnoQY=;
 b=JvLSzg9pBHsHpFeMAQVlkGewd5rQsttekClB/e6nlIBDTZBbAdoUNn78kavBRr30vXOIfnHf3sXEAi6rjA3KGiEfzRKRtXPpcVfDleUmIhbRSFvFPrze2fZP9dNyWM8NqwOK2PZhv5SfOguHhjN7ZhR+2+NyGsc/8phe16GToJ7BvvD9Z++kBM3zIc0rZtMyBjITgy5pE/u1ALiTQy6Y1/mhV4Qj+CZ2ec5Y4XzeO0H3vNkn8LqJkGVqi5+eHchUxGPQBd2YV/DhkOJELdSOJR4qpQpQfXyeg+UOfUgpx9vZyzUDk1yEytdqdQ2UxEFSUh+pODajOL4+AS2Gx7QIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSrn9r2bIC2ay1LCL487D+sG9A62J4VEWA95Q0tnoQY=;
 b=L2sxRWxUnm9tyLTRLCQjSjKLFvwxHjf2HgU4j9VQq2CoXiH4B8lGK+nWnj/t/13G7Vj2XAXKF5YewqTDN5r1ik1Eg/M7jA6N+xWJ8PQT04p96jOy2hHoERGMSYbGOL5xg4+zqD37A9xbQQcekBtm6W9o9THiOsBIvbXwZg6+gaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 16:03:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Mon, 25 Sep 2023
 16:03:36 +0000
Message-ID: <1bc1f834-22c4-4199-a063-f53cc345161f@amd.com>
Date: Mon, 25 Sep 2023 12:03:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/5] drm/amd/display: improve DTN color state log
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 Xinhui.Pan@amd.com
References: <20230913164329.123687-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230913164329.123687-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::38) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e52d74-f5ea-4382-164f-08dbbde0f9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUoaehvk5GZaX73WEwzoAB42Q61iknYedZV54G0GOd6Fg3gCdoy9+PczgehpGMf/wswzeusuKn6IV1wvPqaq70h3wDYnq6hdFB7/YRIwOFUb6HwtZudmCpQkkouiCeKzTTyhYr1vBo7jqb4MSpKC03xSQhapX+ogfOj50WkemsgkfxxDngNSlYI4D2UBtyh1yzIqWlbJ+0AWLg4gUG0/zC9+aF0MEtl7AHqeTUjcRENbTXNH05x8ROpHt0vWJSVLgcf8+N4BduZwPorZXZwh+3p8F1qAmPmobOVACaaK3fdgUI/ifDgjoevJMvIuKFUX2X+4hlyrjqTgpT6J2fxixXjtxHod1sCzuR8zLyZULA/6TC2dH43MmA6IT240AkJ1dkNvj2nSxfCOQ52ghEDngK3gY1lh5trE5WDswDKmg3pqPOI5wzFmz6zd2hY2qNz1r9eQLNa96d+8uAZg8WgE40vzoBDu5swP+XDX9DRTSqmDu1VxyaAOZh00GwbU+7hGxwZkOUsJEN5dTfaqxwDC1eC+g0AeSo0GMNqc15u+eVw3KRLSTzrDfgcL6D/dafK/nIBbEnKkP8rXFuGiMnFwwUnyK2+Ef29V0XMJ453ZOja7wWAVI0/LGVkREqM8jddnoZq2PfsXKj5sfNzscOqWa5OD/iE70OyzdFOjk7eQECqrTY3icnUepZlzWsor8hPN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(6666004)(26005)(478600001)(966005)(2616005)(36756003)(31696002)(86362001)(5660300002)(6486002)(53546011)(83380400001)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(31686004)(41300700001)(54906003)(316002)(6636002)(8676002)(110136005)(66946007)(66476007)(66556008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRhZUFEVXUzbGUrejhiUGtkQ0g5aldWYlFwTHVuR0ltVm1pZHNCT2EybDNY?=
 =?utf-8?B?VVhlQWFJWjRtQVFGT09RdFViWUl2OUROSXNvY3lxc1p3NVk5Qkl6SWorOVJn?=
 =?utf-8?B?ditxMTc0SnFvUFlOMmpubWN0aFlSUlJlM25xRDRRa3d2bGV0M0VxTndBYm03?=
 =?utf-8?B?ZjJncW1MNjFPcTRqTW9BYm1IMk9NckMrWEpCb1NPeEJ0eE50YzRqMWVxOURZ?=
 =?utf-8?B?U0kwWHVqMGEza29FT3hLU1pLSTlkb0xFa0o2Q3JmenR6K1V2MExXaDZNYm1C?=
 =?utf-8?B?M1hZbStpL1JqclBibUNZa0liZHROdXArVy8xS2F5UWwzeThrSE1nSGxxM01j?=
 =?utf-8?B?Y215QnBER2tkQmtaWG9IZG14SHdvTDdKRTl0VXNDUG9BNDR5emNkMzVTdWtt?=
 =?utf-8?B?Rklsc3d3WExMSFgwcUsrTHFRaTNSRjhOS1lqMHZwNGJQQTRqTFcyeGZzWFM1?=
 =?utf-8?B?WVU2c3pCZzl5UXJxME9ST0U4cVdhZTNCWFlWMXNpb05XOW41cmZLdlIwVFo4?=
 =?utf-8?B?ZGN4R0NQY1FSY2RRZ0ZHb2F0V0JBZ1hUOThHWDY3Y25PT3hBamhpQXhUWG9C?=
 =?utf-8?B?VFBTR1B6YVhuSVBBdjhvRXhjQk1QczY2VTJRN1lmQmpqVWFlSGhlbnFjOTBS?=
 =?utf-8?B?alZvNG9icGRBRUgzbyt6dzN0eXpoczVMQ1Uram9IKzRCZCtlOHlYZnUyY0JC?=
 =?utf-8?B?NWVYSHpSR09aWWI1c3c2WVYxUTl3aVVxZHo2RVFiakdEUHMwUXRuOVJleEZz?=
 =?utf-8?B?ZTlJbWtMcTJ4NW11dFBnV0pvdS9tYUUzZ3FneGIza0psOGV3TVNsQ1RhN1Uy?=
 =?utf-8?B?YjRsRGZtRFBqSmVmSTJOWWpkOE5RYnJFemZTYWgvSVkrclZ5dWp6WTA1WDdN?=
 =?utf-8?B?QWNjWDVOKzVjbHB6c3VjblRXcDJ6WHBaNnFuWENiREJTTlZtSFVhYysrc1Bn?=
 =?utf-8?B?Sm1rZXpBWHYxQlZicDRaWjVBK2xhRGRvS3hScmpydmg2YlZPS1RONEJhVkd4?=
 =?utf-8?B?SHRtckJNeE15Y2ZSdG5JUGlWKzR3WEo1L0R0Sk5rZS9qR1NxbWxITWpWdnds?=
 =?utf-8?B?OWFoQ3RCYnFEdUVzNGxlWWhESlUxVVdydThLeEJEYzV6T0ltUThQQmpWZjFv?=
 =?utf-8?B?NlhjdEhNYUxYd2p6MkJuc0czS3VkSFhGMW55UHVlajdiWVl5ZWxiSVcwbWxt?=
 =?utf-8?B?b09Rc242QjAzbVpkc21BZkFJSmZ6VC9CUGVlL3A3TE1ldEN1VThzRk1XWEFI?=
 =?utf-8?B?YlBJYmgxdmxqeTl0K0xCUk9YN3ovZWZGdm5sNjYwUm05MmlYb0FJR2REQVEy?=
 =?utf-8?B?OEpoNWFVLzB6cEV0Nm9TY05ubHdwVG9KRUhjTlhaeUlnbUxHUTdBZURKWWtF?=
 =?utf-8?B?aDl2L3BLL1RoMlNieTY2VXpJNUhHL2YxOXRRK0tPcDRUSFZGVzRGT3E0MlZY?=
 =?utf-8?B?Qi93djZQL3ZjdUYyNVQxNHg5UWY0ajVET3d5Y0p2anpZMFRJSUk2cDdnUmdF?=
 =?utf-8?B?amRhRUxmS3c1Vlc3ZUFyL2hhbVZoUUxBY3dTWnRmb2tCVzJoS3BUTEV3SDBl?=
 =?utf-8?B?QWhrV3BFdkY4cUo4VXl1cEtBcnZ6WDVuU2Rrb1FsT3dtS1dJQVpFK3Y5eVFt?=
 =?utf-8?B?bVFNS3g5NUlnSHVpSnZhdUFtYUw4K1RCN2NjVFB5dHYyZmtJeGhlN2pacXJ2?=
 =?utf-8?B?b3IyZmJ3bUtoMXpueGozSG1ma3pSQXlxTi9vUU5ib3ppQXZLNmw5N2RnZGEx?=
 =?utf-8?B?dldMYXhzd3VnY21PN3BvR1hBcnR3QzRIaEdyRFF0Z0JhWmlBWXlwY2RSMEtl?=
 =?utf-8?B?VXNmeS9oamZ2Z0wyZkVSNno2L3BkUEFkeUZ6UStSajU5UWxuMlplTmY3MU1q?=
 =?utf-8?B?dXFFdEtVMitBTmVmQXBwbjY1aG5vdVNiQTJ6d0hzWWkvbGduaWZQaFNnRFdy?=
 =?utf-8?B?RCtXMUppVm1jN3A4aW1GQzlQU1ZZOFJYcGNTaHFzVXJiMG1QQjkyU2gvdm9K?=
 =?utf-8?B?VFhaVEJTakxManluazR0ZGRVRlFSdnJ4SkxaV29Gbk9Za0h3V2F6bmEvZ0xs?=
 =?utf-8?B?aTVMVlRYTkZIK3NWK1NIUUhBV0NkZnlpejJ4VC9DVEdOSDAyYWpQVlcxQys0?=
 =?utf-8?Q?V8pP/hh1T4Oz91tml+V3EBpem?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e52d74-f5ea-4382-164f-08dbbde0f9eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:03:36.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +boHGkAVNQitxdeWXd+QTaudj+gupdGuKwfI0mOST1cC6AKLxgaj5FJGDA8+SlxTasg52SXGe0gGxCTomL0mwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-13 12:43, Melissa Wen wrote:
> Hi,
> 
> This is an update of previous RFC [0] improving the data collection of
> Gamma Correction and Blend Gamma color blocks.
> 
> As I mentioned in the last version, I'm updating the color state part of
> DTN log to match DCN3.0 HW better. Currently, the DTN log considers the
> DCN10 color pipeline, which is useless for DCN3.0 because of all the
> differences in color caps between DCN versions. In addition to new color
> blocks and caps, some semantic differences made the DCN10 output not fit
> DCN30.
> 
> In this RFC, the first patch adds new color state elements to DPP and
> implements the reading of registers according to HW blocks. Similarly to
> MPC, the second patch also creates a DCN3-specific function to read the
> MPC state and add the MPC color state logging to it. With DPP and MPC
> color-register reading, I detach DCN10 color state logging from the HW
> log and create a `.log_color_state` hook for logging color state
> according to HW color blocks with DCN30 as the first use case. Finally,
> the last patch adds DPP and MPC color caps output to facilitate
> understanding of the color state log.
> 
> This version works well with the driver-specific color properties[1] and
> steamdeck/gamescope[2] together, where we can see color state changing
> from default values.
> 
> Here is a before vs. after example:
> 
> Without this series:
> ===================
> DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
> [ 0]:   0h   0h       3h     3           2        0             0     0
> [ 3]:   0h   3h       fh     2           2        0             0     0
> 
> With this series (Steamdeck/Gamescope):
> ======================================
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> [ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           0 00000000h 00000000h
> [ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> [ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> [ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> 
> With this series (Steamdeck/KDE):
> ================================
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> [ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           1 00002000h 00002000h
> [ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> 
> Before extending it to other DCN families, I have some doubts.
> - Does this approach of the `.log_color_state` hook make sense for you?

Yes

> - Is there any conflict between logging color state by HW version and
>   DTN log usage?
> - Is there a template/style for DTN log output that I should follow or
>   information that I should include?
> 

At this point it looks like we only use the DTN log for debug purposes,
so no conflict and no need to follow a specific format, as long as the
output is human-parseable (which yours is).

At one point in the past these were used by automated tests on other
platforms but that's no longer the case.

Harry

> Let me know your thoughts.
> 
> Thanks,
> 
> Melissa
> 
> [0] https://lore.kernel.org/amd-gfx/20230905142545.451153-1-mwen@igalia.com/
> [1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.com/
> [2] https://github.com/ValveSoftware/gamescope
> 
> Melissa Wen (5):
>   drm/amd/display: detach color state from hw state logging
>   drm/amd/display: fill up DCN3 DPP color state
>   drm/amd/display: create DCN3-specific log for MPC state
>   drm/amd/display: hook DCN30 color state logging to DTN log
>   drm/amd/display: add DPP and MPC color caps to DTN log
> 
>  .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  45 ++++++-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 111 ++++++++++++++++++
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
>  .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
>  10 files changed, 280 insertions(+), 12 deletions(-)
> 

