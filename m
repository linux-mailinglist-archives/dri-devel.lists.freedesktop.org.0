Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCEA8459E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675C010E9CE;
	Thu, 10 Apr 2025 14:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xoltRwEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4C10E9CA;
 Thu, 10 Apr 2025 14:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ce72+8JZGQejZ7PebHT8SvZ537/L3VwEkoZ6RrCqUoO4GfPPdBU2dZX5QCGHgIPeqxgiRjFSnLHiav/UEBHneMD9MDlXu9I3Nln9p6e8EmJdIiXLr0FFwzeTbesOFEdLG3zB2eSE92pFJIOWqvQXtIZyIYiIEjvToGu/TErACTFs9FNEjP2+bWx6HfMmIE+NUcMpWu/YaL6DxKxPR/6m9X/LFIJg4fFIwVc+juf1o+aSCj5RAjaA+mTJFa3qxCkQwRt+1T+78ayOTfatfLkPeGOvgaK5/hxqTZ+UjxjJl2or3bHDEpI8CR3tob4qThd+iFE6i8GYLP5G50UdkYJdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/qnZvYmfjemIF1gB8PX5EhUjoV4jYVoZ1eu9eT6nvg=;
 b=a9G8YU+rQpb4JBmcKim5djU2hjkmfxdRCgMEZ6DAQ31Fb010p8GD/CziQ8aLmji0jnJ5OpGV7uC/ero+w0nha6fIsdkLmZYC4/8AjI0oz+eEl1xSoS5yEJ5bMPo07rLZZFwuIxduHDEa8yFzJk8LByvDVSQvdTyssbITjciNpx0FD0kJb/EIYGIavbFrBsgm8dadP73jgfIbYxsTq3eGyn9WHCBDATClqWKCSQGFvrnf84xg92c+6H4YpL9oxArClViDtZc0irSs5gbDZ1i9pqNnU5PfWpynEXLX4CMEf+WZ5rMml3jdC2U4Hj5DxMnX0FvS36WX6bWCoNArSocAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/qnZvYmfjemIF1gB8PX5EhUjoV4jYVoZ1eu9eT6nvg=;
 b=xoltRwEEUawsDXWIu1KASo8Zpe/XFMXkztVSHoBUUU8O+nqAK+851ibIvLU3T8EIZzE27VVzhUv2Hx2omc59h6mj6woGVax1yF5tAOc+8m5jrSjC+dfvgfbo8FcZdStbJpqbB9MWDPsG4UAto8Jq1ZJDr7CsLuL+htUNgvPEMf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 14:04:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:04:26 +0000
Message-ID: <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com>
Date: Thu, 10 Apr 2025 16:04:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Qiang Yu <yuq825@gmail.com>
Cc: Erico Nunes <nunes.erico@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
 <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
 <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: be82869a-7ef6-47d2-f22b-08dd78389a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHJpWnFJa013SllNSmtJTVJ4a0V2TWZweW1XL1lBaFhCdGZBRVY1YmJ1dFlP?=
 =?utf-8?B?UWRZeFpGVG9odGdDVlU5KzhMV1dHc2ZTWlVBc3dZdUpHOTlXOW5yZm4xZ2lP?=
 =?utf-8?B?NDRkYzhYTzdWWFNCeXA0dU1mS3Y3T29lVllCUnAxVG5iM3NBbXFIOUlCRkd5?=
 =?utf-8?B?SHZZdEpqd2Fna0VueUcwVFZjeUdTS2VEeWVqeHhac0gvbktSRFRaTTladyto?=
 =?utf-8?B?bHY1aHFldjFQWlZtTElLdDRSNXdtdFdzZzhJSFJVWmgwYTFIalVjeDNTWnNI?=
 =?utf-8?B?TnZiKzdNTWxjYmdmZ2QzSVhQMC8yNnZNM0FwYk9LRW9sNkhPcmVQd1Qrc3hk?=
 =?utf-8?B?cUF0QUVjRWhucDE4Wm1zTmQ1eC9vaU94ZlJZakVPRmxBcTZjb2I3YzNPYzBW?=
 =?utf-8?B?TWpMMXNWWFJpa2VhWWM3SEtZdTlaWk0yb2dVbjN1U0k0Z3I1RE00eXhGUU1T?=
 =?utf-8?B?ZDJHRm53dXUzNXRwUk9SWVZhdVdjWnJyRDJxSDFRbUprZzBaMUVpTkNPVis4?=
 =?utf-8?B?YUxuT0M0bjdLVmtJVEFTNUtCKzYxbHZQNHdxZTRyaDdRa2JkQXViQ2ZyWitn?=
 =?utf-8?B?T1ZqazV1Rm96ZXVNMHR6Q2RTTTAyK05VTi9sUTYxV09Kbm9oMURYZ25vUjBS?=
 =?utf-8?B?T2tsWVpCa3JpY0xONDJhMWxOMXBHeWh3WWcvOFhDZU1TdWZYOTNmSzE0cDIr?=
 =?utf-8?B?eHlnYUFvMUM5SjlGNktiZTdMRHk2QzhOME81c1FFK04rU05Zc3NXVWU4SjFi?=
 =?utf-8?B?RmFkLzJIeFptUG5iaHlvSGxuOUNjejE4SHVNR0ZhNkRUMWdFc1kzSnZJY1hx?=
 =?utf-8?B?QW1Nb0Z1Q2RXT0paVFhtVzFXY3JESllOYjluN1lIeTFRVm5QbWhnaXRGK2Ru?=
 =?utf-8?B?RnJtNngrM2lYUUh5T2N1NmE1VnBUUTQ0UzQvRUZ5YnZCK3ZOdko0a29aampM?=
 =?utf-8?B?MWk3YzZjTDBON201WWx0OVJpbGYwRXpTN1Y1ellLbXI4cWtkKzhKek5VMUNG?=
 =?utf-8?B?Qk11czJML3JrQ1VFM0IzbzRPSTRucGRPVEttTTl2UWJNTDRsTTFGWk1BS3VF?=
 =?utf-8?B?bEN6Smc3aEk2SVNkRzFzdXM4aExGNm16dHV3MmZScmp6NVdWV3RkSCtVUFpl?=
 =?utf-8?B?RU9GRjFseUFPVXpUVU8yTGNWakVpVUxpL1k1NGdhNndkOFgvTE81eFl2TmJM?=
 =?utf-8?B?MlIwSXgxWkQvUlVGRGxpYkxyQTBybTY1NVNmcFZWNmc3ZHo3aE9LbmhmNTFl?=
 =?utf-8?B?VDdjajZvcytOQWx4OUJxcnNkemowbWlvQVkwMnVNakt2STlPajg1UzdGQmNE?=
 =?utf-8?B?dElzV1ZURXErRmxCVkVGWHBBcWxaam9BL0lJZVJlMFpzK2JqZm1mdzZ2UUVz?=
 =?utf-8?B?QUROZW1OWjAzZm43UGVVeWtMZmZTN1B0SmpGSlFUZ2hFYmVFS3hRNHdIcTM4?=
 =?utf-8?B?eE43TXE3eTdLOVUrZ09PaGdKMDNlWUhtcGJjVzBoWHN6aUpVU0lHVE5adnI5?=
 =?utf-8?B?ZDAxNFA1N25COEEyaU1seGdKdFh2cDdXWGJCLzVKRHcyTXFzc2o0ZGpVbmFU?=
 =?utf-8?B?UEhKYmRiYzFUaXUvTGNHalRWUUpnemNkOGhmZWxSMFJiZmtIcUlNODNMTlh6?=
 =?utf-8?B?YkNMRUJ4YS9xYjdRTVhnUDFNVGQ5Q0RlNm44bEpET3lNUkRvWHM0NDY2UWd5?=
 =?utf-8?B?bDROTm1ySksrRFlnbzdpek84Yk9yQXU0a05ZbDFNc0k3R2ljL3RSWi9odmhN?=
 =?utf-8?B?QVhtcDIxd3BITzVSVFVGbFk4eThGeTArZE0xVk1wYkRVODFkbHFTeUJ1Rm5K?=
 =?utf-8?B?dldyQmdCalkrbHZtanZBSC94TjhIM3FIRHVyVzhpZDg2Unh0dzdiRjduY3h5?=
 =?utf-8?Q?mWrSscJRNqfrE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEE4MWN0Q2p1ZkN1KzdVcFU5VzVZQWQzUTFvUGZqYzFqRnNobkZ0enBHRXFY?=
 =?utf-8?B?M0FPMGg2WmFzWVNVVkdzNm9kRkFyOU96VnpUN2ttRGNtbWVMOVlESjg4TDUr?=
 =?utf-8?B?T2FGL2xJdXNGbFN6V3BYTTVyUGNLckNmUGlRNjlzd0RUdmdKcTZqMVl4UytI?=
 =?utf-8?B?M2pTa2FaK0hEZU5VWGlKSU9WZHFQWVBLbWZQSFBoSGpCSmFBOWtDRGwvOC9B?=
 =?utf-8?B?aFBweS9PZDlNZ0tNWmNUaFlNaHdvekVTaEJTaVNPaDNPT2lkNFVqN1loSjlS?=
 =?utf-8?B?ZFN5aVkvdWk3dDJUNTNweGNmSkltbHVKRTdwdUw4RUVoNUFESDY3TmFpVlNo?=
 =?utf-8?B?c2tTT1JlazlnR1B3RDZ3Mm5LZUdEdUlCdmRRTEt5V0t5V0ZHQVJLYTFxVEtp?=
 =?utf-8?B?a1hZcDJqQVYyYWFFWURxZXJCWUpZaml5YWZwa1JYc3I2aWpOS1daVjhjQ2Z4?=
 =?utf-8?B?UWMwWFFwUzFOTGtpK2hIZUF0U3dvbHgxUUJTMWN5UjZIRjdDZTdjbDdleFJo?=
 =?utf-8?B?SGtDNmdpczNQZTR2VVpYNDBxcU9rSWJrRHppSEZtUk01Q3IxUnowOGxhRVJh?=
 =?utf-8?B?TE5kL1ZwZ1BzZWxTeXlVTVNRSCtSMVQ4R09XdmNmT3U5VEdZdGhsMzl1ajBh?=
 =?utf-8?B?Tm56YWZVdFI0WXB6UzRkbCt0ZHZwb2o1OVZFd01FWnlEZ1ZKYTNVdHc5c2pV?=
 =?utf-8?B?VE9TaHAzR1hQK2RQMGxKNSt3Z2N1THFJTlhFR2VVNmJBcUNvMzFaSU5rb3R0?=
 =?utf-8?B?dW1NTjVvZ3VvSXZ5WTgvRVFBZXZRVkYzc0F3aEtubm9vNndidWVTMVQrL0Nq?=
 =?utf-8?B?eFpIRWhEVlB4Nk5LYmNBNkkwV2k5VTl0enh6aVR0eVU0UVEyRWNKTThkY2pJ?=
 =?utf-8?B?MUlsZWdoWEc4US9Ka0kzb1daeWtWdDJ1VkZVNmRqYnl0SlpxckFGTjZyU0Ra?=
 =?utf-8?B?Mk5XaERGNUZvaTFjY3FjaldZZnZxcFNiWVVpU3U3SFY1QnRTcU10VFVpQlhp?=
 =?utf-8?B?ZmxzclV2QlFNaExyUmw4dnErdUNLaUk4R3IwbnNiZUFjRHRlSCt4Y29Uekw4?=
 =?utf-8?B?VXJYc0V4MHlzVXNaejBRUlkweUhHeTdCakVXY3B3QXZjNUYxSUpLK0RLekY1?=
 =?utf-8?B?U3ZBNStESmM2dWk4d2dQS3JsQ0ViMlM2ZnhsWGkwQlkyelg1MEZrcjNvVGxK?=
 =?utf-8?B?aUorenFOcGxlMWh2NXdHRzd1Q2h6RUJ2MXZ1UWFxNk9WcVdlLzBlMVk5VnlX?=
 =?utf-8?B?ZWovS2hDakZicWc1VHUvbzR2dTE4a28rNjc0NG0xUVFEakk1VGluNlFxdjFx?=
 =?utf-8?B?REpBdXhzeG9UZWdmd1plam1NQTZ0eVNFUERpKzFENTVYdGV0UXVQbGRQSTVI?=
 =?utf-8?B?aUoxcVpJUTd3ZzQxQzVvUGVXTStnYkN5VWJzVGFuaHE0SkVTdVQ3MllVNS9Q?=
 =?utf-8?B?U1V5VWxzOWQwbmhNVWRIZnRhdzRWNmEydG1BQnZvRmdNRDVvRnRrcWtpTnpl?=
 =?utf-8?B?M2gwQmVkL0xFb1p6bU1xclpIMDgrd1ZaQjBzZlYxdFNpbHNSai9QWTBDYy9x?=
 =?utf-8?B?cnBkRjh6RGl1Tzg1Mi9lbzFCQUxDVDlOVTQ0MjhjVmdRQ1Iybld5cXE5Q28z?=
 =?utf-8?B?UmF5Zm5aUUFibjBzYmgvcndsVG9oT1k5eU50RDF1UktzVUVhVmI2WlFrZFVk?=
 =?utf-8?B?ZVNzME9NWTBxMEdlK05aMlhzYlFEUDFETUpHRDdLenhvOEh0T0FQN29SNjRN?=
 =?utf-8?B?eHpnd3MyNEpJSzJMVzUrMmJ0eE93cnNWZDJsK1FJQXd2UExpSUJRODA5YytG?=
 =?utf-8?B?OUtqM1Naa0g3ZkQrNUVTY2ovM1pmVitQbHJzZ0hCM3V5TktYQmJaNmtWRE5u?=
 =?utf-8?B?V2VUVlFuS2Rsb0c3aU1hbDdXOXdwcmMrSWlOKzlBZWxUWkZYQ212T2hHRlZM?=
 =?utf-8?B?dGlWcU1HWDRWcW92cDlSaU9raDFIMGdiTDhITVVUWlhSOFpudnRDOUkrcXdE?=
 =?utf-8?B?ajlROWJJUVBXRWNaS09UaUloNG11MDVhbVloWUpwU1d0cVJzL3ZjUHhEalhQ?=
 =?utf-8?B?U25xbUhvb3FxNktETk1hMkllK2FHZXdTek95WTZKeEhaeW5QajVoVGliczUr?=
 =?utf-8?Q?Ild1hJKMjzqg3ZBmc85fLyksr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be82869a-7ef6-47d2-f22b-08dd78389a01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:04:26.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8CGDy1sObuWg7nfVJuyBmjLOL2WGQt5UguudFb1b7CkTJ4rLRhUjVfIB5F4SrPp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
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

Am 10.04.25 um 15:56 schrieb Qiang Yu:
> On Thu, Apr 10, 2025 at 8:35 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.04.25 um 11:33 schrieb Qiang Yu:
>>> On Tue, Apr 8, 2025 at 11:48 PM Erico Nunes <nunes.erico@gmail.com> wrote:
>>>> With this callback implemented, a terminating application will wait for
>>>> the sched entity to be flushed out to the hardware and cancel all other
>>>> pending jobs before destroying its context.
>>> We do flush when file release in lima_ctx_mgr_fini. Why do we wait here
>>> in flush? What's the difference?
>> Waiting for submissions when you release the file descriptor is actually a bad idea since that can prevent SIGKILL from acting immediately. For example the OOM killer absolutely doesn't like that and eventually calls panic().
>>
>> Flush is called either manually, on process termination or when you send a SIGTERM. This should then wait for any I/O to complete.
>>
>> The idea is now that you can then still send a SIGKILL to abort waiting for the I/O as well and so get pending GPU operations not submitted to the HW.
>>
>> The DRM scheduler helps doing that by providing the drm_sched_entity_flush() and drm_sched_entity_fini() functions.
>>
>> When there is still pending work when drm_sched_entity_fini() is called a callback to kill it is installed and the job just freed instead of executed.
>>
> So the difference is we can always wait in flush, but better not in
> release when SIGKILL?

Exactly that, yes.

>
>>>> This prevents applications with multiple contexts from running into a
>>>> race condition between running tasks and context destroy when
>>>> terminating.
>>>>
> If implementing flush callback fix the problem, it must not be when SIGKILL.

SIGKILL also calls flush (again eventually), but we can detect that in the scheduler code.

See the code and comment in drm_sched_entity_flush(). We could potentially improve the comment cause it's not 100% correct, but it should work under all cases.

> Could you describe the problem and how this fix solves it? As I don't understand
> how the above difference could fix a race bug.

That was the point I wasn't sure about either. It should *not* fix any race, it's just gives a nicer SIGKILL experience.

Regards,
Christian.

>
>>>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
>>>>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
>>>>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
>>>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
>>>> index 0e668fc1e0f9..e8fb5788ca69 100644
>>>> --- a/drivers/gpu/drm/lima/lima_ctx.c
>>>> +++ b/drivers/gpu/drm/lima/lima_ctx.c
>>>> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
>>>>         xa_destroy(&mgr->handles);
>>>>         mutex_destroy(&mgr->lock);
>>>>  }
>>>> +
>>>> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
>>>> +{
>>>> +       struct lima_ctx *ctx;
>>>> +       unsigned long id;
>>>> +
>>>> +       mutex_lock(&mgr->lock);
>>>> +       xa_for_each(&mgr->handles, id, ctx) {
>>>> +               for (int i = 0; i < lima_pipe_num; i++) {
>>>> +                       struct lima_sched_context *context = &ctx->context[i];
>>>> +                       struct drm_sched_entity *entity = &context->base;
>>>> +
>>>> +                       timeout = drm_sched_entity_flush(entity, timeout);
>>>> +               }
>>>> +       }
>>>> +       mutex_unlock(&mgr->lock);
>>>> +       return timeout;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
>>>> index 5b1063ce968b..ff133db6ae4c 100644
>>>> --- a/drivers/gpu/drm/lima/lima_ctx.h
>>>> +++ b/drivers/gpu/drm/lima/lima_ctx.h
>>>> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr, u32 id);
>>>>  void lima_ctx_put(struct lima_ctx *ctx);
>>>>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
>>>>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
>>>> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
>>>>
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
>>>> index 11ace5cebf4c..08169b0d9c28 100644
>>>> --- a/drivers/gpu/drm/lima/lima_drv.c
>>>> +++ b/drivers/gpu/drm/lima/lima_drv.c
>>>> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
>>>>         DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_ALLOW),
>>>>  };
>>>>
>>>> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
>>>> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
>>>> +{
>>>> +       struct drm_file *file = filp->private_data;
>>>> +       struct lima_drm_priv *priv = file->driver_priv;
>>>> +       long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
>>>> +
>>>> +       timeout = lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
>>>> +
>>>> +       return timeout >= 0 ? 0 : timeout;
>>>> +}
>>>> +
>>>> +static const struct file_operations lima_drm_driver_fops = {
>>>> +       .owner = THIS_MODULE,
>>>> +       .flush = lima_drm_driver_flush,
>>>> +       DRM_GEM_FOPS,
>>>> +};
>>>>
>>>>  /*
>>>>   * Changelog:
>>>> --
>>>> 2.49.0
>>>>

