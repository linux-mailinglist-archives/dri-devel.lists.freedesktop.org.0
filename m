Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01665B8957B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380FD10E993;
	Fri, 19 Sep 2025 12:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sTGuqSR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012050.outbound.protection.outlook.com
 [40.93.195.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F4010E993;
 Fri, 19 Sep 2025 12:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPtsr/pPFsGXqteZ7X/EmZ5P/xyxDouyIva47WXgYI7WJHX4Nq7NFrtE7UtaCDzGBw1NhVbqnsWcw9L2Jbv//bRKs+2hqj7UdARGQHedf1k0gpKLq5vqd4oOJYh368wk6OMkHVP0YikczSABm7YdOtT3IPRdIR5n7m2dfA7G68pd1BmDEZe97cBSCJq6DuF80YJfUrzM7eqxTSfmYaMtmqVkXoomYRbUQKJpTsYx1Uzk3uWYHb1o5xpP6GNT69zdqf6w4PJK/zOK82Qf13hjgeCW9TFGrBPEkqnhkUqYUI9Tgy7LmUKogCkuOthrD0zOAS4n4kx7jt+ZWHPUyiUPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfxHUYNKuXWfrb4j2iCQ8cStmkFobbHLlcM/LB/cPRE=;
 b=wIQ0z2nvNMTQ8n5zwSKJJJGhlcSjGRL8GBbPbzt14c/wAXTPQA4KXPA0hV6KlvzLkZrABUbLDZf4xLCgOism1lxIaMTSzBMNhHk4tcj3bM/7TMjxrEoO0LVe9QgpOBWksugJ4YRkx6dgK5Wc3+dFKJjvMjeNg+2oAuOOq6620sqQ2E6l3Vrc21526twEJu5dNHY5kjvoJv8wmM0TGxhcr5UmhEP3gPPJki7C6OODEauyq+jhtouG8VmSTd5LpjYxb4yoeebooDr9YRIVIch6xONl44uyou7WzYrCSV47d11rLhq39K7p5OGR3HycGznuzWmdjbz0zVdQuncwgnWB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfxHUYNKuXWfrb4j2iCQ8cStmkFobbHLlcM/LB/cPRE=;
 b=sTGuqSR0/Jf1s/TtrNgE4V6/TivaDFwD5TJiqC2D/P9qBO3rvgGj+Fp315fWiSLkGZj04F6W8Xpmr4urgukF0HUGEgXWIELqtkN/VzBwpIFvTJ5D8ua3k74gf/lf6wrG1qzmyoeoNrMhHCB7Y9gpSIYnym9/9y76q8wxS2ozimY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 12:04:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 12:04:47 +0000
Message-ID: <fc88abcc-541e-466d-b75e-2974f419b4c3@amd.com>
Date: Fri, 19 Sep 2025 14:04:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
 <96c117bc-389f-42d9-952e-894768aad780@amd.com>
 <76861e33-8d07-4b97-9f91-4c5651732e91@igalia.com>
 <cfb34506-30d5-4b73-8bac-cf3c1a018901@amd.com>
 <2063040f-f434-4569-bd7c-61f24ee1ef50@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2063040f-f434-4569-bd7c-61f24ee1ef50@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d5d171-9e57-4157-cc3e-08ddf774ba3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JOODFNVW1MQmVxRHJyUEJheFoyNUNRU21pcGJNdHFTbFlwNTVEVy80YnNu?=
 =?utf-8?B?K0daVUpiNXMrc1lMRUp3NUd3cVdZcXlKeFVEeTRCMnlRK1J1ekd3amRtNkpZ?=
 =?utf-8?B?UStEaEtyaVdQOXdxWmNiZ3JsVlZRejNEanZDVkpaRVZiNkhVVC84eG9BNnNF?=
 =?utf-8?B?d2dLQ1pQbFk4Rm8vWDc0VzRaNEl0ZCtYQWFySUxJUW03RVhPSmJwK2twU05T?=
 =?utf-8?B?Z0pzYTVNSVBlZld6UHhmSGJ4VlJLQnNIS3RKOFVHTUhndkFyM05QdkR3dElR?=
 =?utf-8?B?ZDdBTHZBVENaYm00bWMzY3YrOTJpeVdIQXpIZU93bnU3azUwUEVla0o0K29U?=
 =?utf-8?B?V2dJK0lGK1dwaHVHK09OZTUzUnNUMkdVcXNIQW43VzJxaDZhV2REQ2U4R3J0?=
 =?utf-8?B?blgrUk1yS2VnVjUrNjMyRXduVytHVjJUNUdxNFZwQjAwZ2p0MXp2bnlXWHdm?=
 =?utf-8?B?T1N4bjN4Y1VzTDB6OXp2cmlzd2VQWWpPRmp0U3hiMUlQbWhGekZLbWhET0RU?=
 =?utf-8?B?SmVZcnUwUUJHdUphZU11SnZiZldUY0RQMU54Y21zbmp5bk1pdnpSbGtWM3Ay?=
 =?utf-8?B?M2V4MllGQXk4T1dGM09wbFZwdlAvem4wS05KQVkxa1BuYW5aYzJoLzdrdHNB?=
 =?utf-8?B?Q0J2a0pPUmtWd3VmN0R6dmNpQUovYTBJU25HOEhVdDJJdGY3eUpVOVFabTYy?=
 =?utf-8?B?MktVYnBSV21IMy9kb0xwMGdpYWtnVDNqamx0UFZYVDFURkttcGZTa1dhNzlr?=
 =?utf-8?B?bzlYSEVrcGZrbUF2QWxaR3dTbWtSazJBLzVxbmJ5SVZFNzhpaU53cUtXa0Z2?=
 =?utf-8?B?UnB6MHh3ZDZHenUrRjZGTml2UzdadW5TOE1NbWJxMzdiQzB4eFBtVHZHVHBO?=
 =?utf-8?B?M2IrVzNzWmJGM1krUFRIaXZrbDRLWHJPdWRpY2UrT2liVGk0cVdLVWV6Y1U3?=
 =?utf-8?B?L0w3eW5QMFZHdEphZktJdFltT2hVam91NnFBK3NoR2RZd3lIVkliTEMrQ2s2?=
 =?utf-8?B?SUNxKzdyNGtybDBSelY4NHlBSlpYQkFWeHN6TVc2T3hTV21DSHdObUZmcG1M?=
 =?utf-8?B?RER0VGd0WXo5UURCTjVtdWt3Si9CSzNmWFhaTElyRXhOVWxRbGVEa2xEQnhV?=
 =?utf-8?B?NHk5c0xVN2tMaHBGWjF5b0V5VEF3bnJLMFNkcFBFM1NOclYyZGZlV25lZFdQ?=
 =?utf-8?B?ZURDTGM1VmlWN3F3cHZHRFB4ZzJFWStpOGhna3BGMzVRd201R0U0dXdyQ0Nw?=
 =?utf-8?B?M0RxZUJiWHdscVNvK3lPTndwUEVTL2VsMHhXZHZDbmlWMmpSYVdwSWFjOFl3?=
 =?utf-8?B?WFNqeGxLYzErbTl6M3RZcWxHS0ZWNEdCQmNvVEdqK2IyUy8xQmJDNFN3VUNW?=
 =?utf-8?B?bVNQZTE3d2Z1VC82cGp2ME5UZ01ScWd2cEVFc29uY2FXL3B0Z3kwOG8xRWgr?=
 =?utf-8?B?MkpIcXNQdTl1aWo2eUlDSkJ1bzNpN3kwMkFWR1UzR2FmOVA2K0NSalRKYUpj?=
 =?utf-8?B?aXZ6ekVDU0xEamZ4eitCa0lES3lUaUZFakFZVjYyeGFFcjY4dk45N0FnQ1Fl?=
 =?utf-8?B?SndqMzdmVm5Kb2IwZFl0WG9ZNVUrcFZPcmoyaGVTczA3U0tpdVorRmFudVVF?=
 =?utf-8?B?TDdINTYvY01iMWJxdHR2OENNOGx4NWlSRkEzSFZOVTFPTTZNakVKSjNySmtF?=
 =?utf-8?B?eWtmNTl0cm5hRmd6NFhVVDd6alBvM3grdzdxYytnUXp4RUhQSzFYc0w5VjRw?=
 =?utf-8?B?N3I0VzgrcDdKQmUzT3J0QmZtWmszZEpKNEs4dDRmVVlFQk1uZnVLK1RObEJw?=
 =?utf-8?B?Yzh6RGZqN0MxUWhMcmxtNkM1S3ZzRWR2RWFRMHFtNkRrUDQrUElibkpXUTlz?=
 =?utf-8?B?THFPV3dJZHRBK2FXMlhyK0drd2twUWFUNDVpZTdiRHBkcytRcUZrQXY2RVRB?=
 =?utf-8?B?U1JabzB1THExamdVN2tES1A3ZkpveTFaT1ZPM0tJaGJlWERMS3IzOVRJSm1K?=
 =?utf-8?B?bndsOFU0WGVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklWQ3E2djZId2xGRk5RamVWVmRLV3VKM1RtVllpRmVyelVlRGh3WXY5OXQr?=
 =?utf-8?B?V2FHc0UzclY0ZGhNK1RWeDlvTUl6SFZPTjg4UnhHaDhrUFhrZDlzcjFhaVdS?=
 =?utf-8?B?UVZMTkFlU0N4ZWRRa0tDTVQyd0JaaGJiOHhyZjA1SHBoYWlnbENNbnl2OHEw?=
 =?utf-8?B?ejdEZmx5MEREWE9Wcno4M0VlV1V5dk5EM3Y2bDBYOVhOVFNIOFFYTHRNa05I?=
 =?utf-8?B?citwc00wWXdIWEhiYnR6NDYrYWx1QTBjTGlVNHpxcDhSL2NDa0gxNzNaZG1i?=
 =?utf-8?B?WjlxMW01RXdCd2R0bkp3VjJJNGpJU2VYQkYwZzVxQWtrYTNqaTkvL3Z6NExk?=
 =?utf-8?B?eEM1Q0ZtZ3VHQk1NQWk3cHArL2pJMGxkSXVZWkUraUdWUkJiYzhyVFVIbG92?=
 =?utf-8?B?SWk3U0llZE81eEhsWGxRTHRYMTdpT3VDblpBK3hlMGdvOFBGR2d1bEZxVTYy?=
 =?utf-8?B?WjdoSk5WeU43TTdSNy91eEhKTDQ3VDZlSWRwTlUrVWJPdldqZGIrKzE2Y3Vz?=
 =?utf-8?B?N01teFJvVnpLaE56YVNXcUVLKzRDQWQ2WlNwbjlxcGV0eERnSHArQ0hMdWRJ?=
 =?utf-8?B?amZpSGtOaE1NV3kvVHBEa0RMV24wNHFSTU13ZUJMaGFtZ0p1NmZrdmZ3Zlcz?=
 =?utf-8?B?c2Y4dnBTZTNEeWhOZE90V3NKWlk1dXI2cHRmSUJDQ05hV2dqK0dhOVgxekZj?=
 =?utf-8?B?dVVZK0huZXZwQlVDU2ZMVjNSSCtMQkdtcHduNnlDdjB1Mkl4Mm5Xc3c5RGZL?=
 =?utf-8?B?WkNreTVTQlFyS0NqQjFNV0wrY1czU2hvZWFzNnI1aVJiaVRNUlhkc3RzNDhj?=
 =?utf-8?B?bkpZS3Y3b2tJdVBlM0lUUjYzQjN0Tkx4TE5BMFpyVUx0MUpyVXh4RG0wS1BE?=
 =?utf-8?B?RDBWcmhHMnh5M3dPYUh1YmRKcGlpNlhJRWs2V0dHVUlwZERUbU9USkV6UTdt?=
 =?utf-8?B?SUJBM1NzbHRSaFRQWGVKc2Y0eXdBTkhhTjd1dGVySWpEeE1FUUpqUW9hcGpK?=
 =?utf-8?B?QWkrVjhsc1k4MHhQRUVGSCs1RXd1QkZtL3dqMTdxdFYrVmkvRGM5SWlJL3A2?=
 =?utf-8?B?SFRHZUk1QlMwcjdOKzhpOFY0NUFOT3ZPd2FzeTRjT0hqUks4UkQzL2s4S2JN?=
 =?utf-8?B?Zk1KTnJ0ZElBaXg0MmErNWxKcTVta0ttbjYzc2RocEdtZ1ZVZ3VDOHdYNTk1?=
 =?utf-8?B?a24yK0Nyd0xSOXA2S1VoN1ZiSi9NWjNmemZpc3R4VFp0UlVoZy9URDhCWEJa?=
 =?utf-8?B?cVlNYTloU2VreFhGcjl6Yi9VLzAvVkU3a1lBaUFMRnRLOWl4VGNMWnJBZWhH?=
 =?utf-8?B?VmRkMEFQZUR1V0lEQkNjMnhqTFpxaEwwK3RsNnF1NVI2cmFFV1ZDU3JvVHcz?=
 =?utf-8?B?Y1VvNytGT3I2TXVUa1R6ZXRaNnJOaXVGM2FzVjhETXp6TmNoSTB4dXlpNVZz?=
 =?utf-8?B?U0dWRHBLYWhUNE5wT1VaSTBRZmZyOHNjNnZKb3I2T29QWi9iNkJvbjNnREtK?=
 =?utf-8?B?L3BQc3R6NTNOZUJHbUNPOGxZMVU4MHNVVm5TeVFPYWlFQkdpTnJxS3gyN3pF?=
 =?utf-8?B?Vyt4aUJOc0V0OWpseWUxRkdISWRRbHB6Q05Qc0tVOUtxK1F1TEg2RmhySXAx?=
 =?utf-8?B?OHJhOHFCN25EaytzdmRvT2tzNFU3dnVhSGdEcFN1UXprOGJpd0ZrNEFTU2JL?=
 =?utf-8?B?bXQwN3NqeFN4OTd5eW5GRlJXQXFQNU51NndQNmUyZGx3VlloSVdFYnpMYlNO?=
 =?utf-8?B?amZWUjlzM2g2bWhWNm03SnBBODJqQmF2TEJpYktjRk83TjdaOHFXM0ZuZjhN?=
 =?utf-8?B?VnFsSUpCWFJQNVZLclhKcDUyVGQwbWZ0cEVNd1lveTJ5QWFvNkVQZ1Zmb28y?=
 =?utf-8?B?UEJ4cDVKSGxNaDQzV0JVWllWZkZsMGNsMzF5K3JOcEMwZUoyRytmSk1YZ3Zm?=
 =?utf-8?B?aDhJSXREY2JFV2JDY1ZjNi9SdzZPUys1RGRNMmc3NDBCdEJSc0J5VmxxSGxK?=
 =?utf-8?B?RXhvOEUrVkttdkl2cjJSVkd4WVBieE9jeDQrTVpySlM5L3FQOUlKeWk0K0xI?=
 =?utf-8?B?NlBMOEhRRSs3cmxPRXJHZUtZcGdYdTh2UmVRVlBpSVNGakJuZlRSS0pUUDJ1?=
 =?utf-8?Q?cPovcaolwCysEFYUGBv4Y5/41?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d5d171-9e57-4157-cc3e-08ddf774ba3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 12:04:47.0556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IIF3oRdgwSpTNQj10vKswIEA9nKTlnIeptHoiysN+LeiwZsIT66bGDNOOEazRk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453
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

On 19.09.25 12:42, Tvrtko Ursulin wrote:
> 
> On 19/09/2025 11:17, Christian König wrote:
>> On 19.09.25 10:46, Tvrtko Ursulin wrote:
>>>
>>> On 19/09/2025 09:01, Christian König wrote:
>>>> On 19.09.25 09:43, Tvrtko Ursulin wrote:
>>>>> On 19/09/2025 07:46, Christian König wrote:
>>>>>> On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
>>>>>>> On certain workloads, like on ChromeOS when opening multiple tabs and
>>>>>>> windows, and switching desktops, memory pressure can build up and latency
>>>>>>> is observed as high order allocations result in memory reclaim. This was
>>>>>>> observed when running on an amdgpu.
>>>>>>>
>>>>>>> This is caused by TTM pool allocations and turning off direct reclaim when
>>>>>>> doing those higher order allocations leads to lower memory pressure.
>>>>>>>
>>>>>>> Since turning direct reclaim off might also lead to lower throughput,
>>>>>>> make it tunable, both as a module parameter that can be changed in sysfs
>>>>>>> and as a flag when allocating a GEM object.
>>>>>>>
>>>>>>> A latency option will avoid direct reclaim for higher order allocations.
>>>>>>>
>>>>>>> The throughput option could be later used to more agressively compact pages
>>>>>>> or reclaim, by not using __GFP_NORETRY.
>>>>>>
>>>>>> Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.
>>>>>>
>>>>>> The behavior to allocate huge pages is a must have for the driver.
>>>>>
>>>>> Disclaimer that I wouldn't go system-wide but per device - so somewhere in sysfs rather than a modparam. That kind of a toggle would not sound problematic to me since it leaves the policy outside the kernel and allows people to tune to their liking.
>>>>
>>>> Yeah I've also wrote before when that is somehow beneficial for nouveau (for example) then I don't have any problem with making the policy device dependent.
>>>>
>>>> But for amdgpu we have so many so bad experiences with this approach that I absolutely can't accept that.
>>>>
>>>>> One side question thought - does AMD benefit from larger than 2MiB contiguous blocks? IIUC the maximum PTE is 2MiB so maybe not? In which case it may make sense to add some TTM API letting drivers tell the pool allocator what is the maximum order to bother with. Larger than that may have diminishing benefit for the disproportionate pressure on the memory allocator and reclaim.
>>>>
>>>> Using 1GiB allocations would allow for the page tables to skip another layer on AMD GPUs, but the most benefit is between 4kiB and 2MiB since that can be handled more efficiently by the L1. Having 2MiB allocations then also has an additional benefit for L2.
>>>>
>>>> Apart from performance for AMD GPUs there are also some HW features which only work with huge pages, e.g. on some laptops you can get for example flickering on the display if the scanout buffer is back by to many small pages.
>>>>
>>>> NVidia used to work on 1GiB allocations which as far as I know was the kickoff for the whole ongoing switch to using folios instead of pages. And from reading public available documentation I have the impression that NVidia GPUs works more or less the same as AMD GPUs regarding the TLB.
>>>
>>> 1GiB is beyond the TTM pool allocator scope, right?
>>
>> Yes, on x86 64bit the pool allocator can allocate at maximum 2MiB by default IIRC.
> 
> I think 10 is the max order so 4MiB. So it wouldn't be much relief to the allocator but better than nothing(tm)?

Good point, that can certainly be.

>>>  From what you wrote it sounds like my idea would actually be okay. A very gentle approach (minimal change in behaviour) to only disable direct reclaim above the threshold set by the driver.
>>
>> Well the problem is that the threshold set by amdgpu would be 2MiB and by default there isn't anything above it on x86. So that would be a no-op. On ARM64 that idea could potentially help maybe.
> 
> Some architectures appear to default to more than 10, and some offer Kconfig to change the default.

x86 also has an Kconfig option for that IIRC. So yeah, your idea is not that bad if somebody has adjusted that setting.

> 
> I think this means in the patch I proposed I am missing a min(MAX_PAGE_ORDER, max_beneficial_order) when setting the pool property.
> 
>> I could look into the HW documentation again what we would need as minimum for functional correctness, but there are quite a number of use cases and lowering from 2MiB to something like 256KiB or 512KiB potentially won't really help and still cause a number of performance issues in the L2.
> 
> It would be very good if you could check for requirements regarding functional correctness. Could that also differ per generation/part, and if so, maybe it should be made configurable in the ttm_pool API as well as an order below it is better to fail instead of moving to a lower order?

I do remember that it used to be 256KiB on some really old parts, but that is for >10 year old HW. For anything newer 2MiB has always been what we haven been testing with.

Failing lower order allocation is also something we have tested, but that resulted in a lot of unhappy people as well.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>> Along the lines of:
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 428265046815..06b243f05edd 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -1824,7 +1824,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>>>       for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>>>           ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>>>                     adev->gmc.mem_partitions[i].numa.node,
>>> -                  false, false);
>>> +                  false, false, get_order(2 * SZ_1M));
>>>       }
>>>       return 0;
>>>   }
>>> @@ -1865,7 +1865,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>>>                      adev_to_drm(adev)->anon_inode->i_mapping,
>>>                      adev_to_drm(adev)->vma_offset_manager,
>>>                      adev->need_swiotlb,
>>> -                   dma_addressing_limited(adev->dev));
>>> +                   dma_addressing_limited(adev->dev),
>>> +                   get_order(2 * SZ_1M));
>>>       if (r) {
>>>           dev_err(adev->dev,
>>>               "failed initializing buffer object driver(%d).\n", r);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index baf27c70a419..5d54e8373230 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -726,8 +726,12 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>
>>>       page_caching = tt->caching;
>>>       allow_pools = true;
>>> -    for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>>> -         alloc->remaining_pages;
>>> +
>>> +    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>>> +    if (order > pool->max_beneficial_order)
>>> +        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>>> +
>>> +    for (; alloc->remaining_pages;
>>>            order = ttm_pool_alloc_find_order(order, alloc)) {
>>>           struct ttm_pool_type *pt;
>>>
>>> @@ -745,6 +749,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>           if (!p) {
>>>               page_caching = ttm_cached;
>>>               allow_pools = false;
>>> +            if (order <= pool->max_beneficial_order)
>>> +                gfp_flags |= __GFP_DIRECT_RECLAIM;
>>>               p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>>           }
>>>           /* If that fails, lower the order if possible and retry. */
>>> @@ -1064,7 +1070,8 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>>>    * Initialize the pool and its pool types.
>>>    */
>>>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>> -           int nid, bool use_dma_alloc, bool use_dma32)
>>> +           int nid, bool use_dma_alloc, bool use_dma32,
>>> +           unsigned int max_beneficial_order)
>>>   {
>>>       unsigned int i, j;
>>>
>>> @@ -1074,6 +1081,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>       pool->nid = nid;
>>>       pool->use_dma_alloc = use_dma_alloc;
>>>       pool->use_dma32 = use_dma32;
>>> +    pool->max_beneficial_order = max_beneficial_order;
>>>
>>>       for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>           for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>>
>>>
>>> That should have the page allocator working less hard and lower the latency with large buffers.
>>>
>>> Then a more aggressive change on top could be:
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 5d54e8373230..152164f79927 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -726,12 +726,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>
>>>       page_caching = tt->caching;
>>>       allow_pools = true;
>>> -
>>> -    order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>>> -    if (order > pool->max_beneficial_order)
>>> -        gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>>> -
>>> -    for (; alloc->remaining_pages;
>>> +    for (order = ttm_pool_alloc_find_order(pool->max_beneficial_order, alloc);
>>> +         alloc->remaining_pages;
>>>            order = ttm_pool_alloc_find_order(order, alloc)) {
>>>           struct ttm_pool_type *pt;
>>>
>>> @@ -749,8 +745,6 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>           if (!p) {
>>>               page_caching = ttm_cached;
>>>               allow_pools = false;
>>> -            if (order <= pool->max_beneficial_order)
>>> -                gfp_flags |= __GFP_DIRECT_RECLAIM;
>>>               p = ttm_pool_alloc_page(pool, gfp_flags, order);
>>>           }
>>>           /* If that fails, lower the order if possible and retry. */
>>>
>>> Ie. don't even bother trying to allocate orders above what the driver says is useful. Could be made a drivers choice as well.
>>>
>>> And all could be combined with some sort of a sysfs control, as Cascardo was suggesting, to disable direct reclaim completely if someone wants that.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Another alternative would be that we add a WARN_ONCE() when we have to fallback to lower order pages, but that wouldn't help the end user either. It just makes it more obvious that you need more memory for a specific use case without triggering the OOM killer.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Other drivers can later opt to use this mechanism too.
>>>>>>>
>>>>>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - Make disabling direct reclaim an option.
>>>>>>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
>>>>>>>
>>>>>>> ---
>>>>>>> Thadeu Lima de Souza Cascardo (3):
>>>>>>>          ttm: pool: allow requests to prefer latency over throughput
>>>>>>>          ttm: pool: add a module parameter to set latency preference
>>>>>>>          drm/amdgpu: allow allocation preferences when creating GEM object
>>>>>>>
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>>>>>>>     drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>>>>>>>     include/drm/ttm/ttm_bo.h                   |  5 +++++
>>>>>>>     include/drm/ttm/ttm_pool.h                 |  2 +-
>>>>>>>     include/drm/ttm/ttm_tt.h                   |  2 +-
>>>>>>>     include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>>>>>>>     8 files changed, 38 insertions(+), 11 deletions(-)
>>>>>>> ---
>>>>>>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
>>>>>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>>>
>>>>
>>>
>>
> 

