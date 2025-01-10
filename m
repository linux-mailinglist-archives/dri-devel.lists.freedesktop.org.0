Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E2A089C1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0077D10F004;
	Fri, 10 Jan 2025 08:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J43pUHR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2088.outbound.protection.outlook.com [40.107.103.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811FA10F007
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 08:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vojr01ndYS0JkAsHebFKxdHqORUylwpaaGBVFc1vvJ+tiRDbEDuuxdqwDMW4kixCOjUCKFrmCjoHeZK1rqZ5R7OPlJ7EzWBfZfnIccNB3bM96rvEnTYFX5suirNa3mwmttZIC1p+d46mVsAw5fEeZXY6Bhrs41WdWlcXL+Ckpwt0D+nFsyxjXQuqRKKtkErlOWXwLiidpOEe/5UwLeuA4RMtYbIddOANPwzsFd8TJFJPlxKEykKJvkHpn8gHMwRcR1mtsHTOupdWLRcBCcnXX/SOy1MrEpYtuvb3a3LgRMwfCMvF7t6IFoUVSYikfrY6jw+dNj+Q5JCmlAzqyCf+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpgd2d39ojQT/wENF9zxhicbOfvLDBrmDi4BZ9RjQQQ=;
 b=priLnj6H2N4grxQg58W4hydmMxLAdtHMEv3C2XtK6LERav9SxmRwhyVhzquRw6ADkOZu8sHH3k8ehXnTyWqhhGdFf2NPUhkS+W2Vl/6nO1tOq2lg6ewwbpEmSUrKQgRFp3tqrHAdBWoTlNtUfb6N8xYuU4uJyliEXjE5JUfKXngaxD7hx/pYpQKiIZ1H7zpWxMLbTE7nyrrrJ6jjFJmKrDBxg7Spf9/7vyTeWZxmUPDjIXp5fHTI9Pu25Itm5fShLMxszhRAqiLQuz+vg9XnwARLvviA0O04CDWCkTlKTinGfe9vdthlNxdlR/VGo0o+kHsJMUCGCbeyLK9smZOVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gpgd2d39ojQT/wENF9zxhicbOfvLDBrmDi4BZ9RjQQQ=;
 b=J43pUHR7yue4mweFZ0XOk0ZV0hOnCg6AyVcgfEpESYA1kS4LWWLaLSZH9qWrFN4rhSjEHvG/htZ/BG2Pz/DERjBjZnRC9bUfCwz40ma4U9M++6YletyGeqJaPNqkLiowFTQtzI2Vx9b4NVIbILnqn9fyB03DhO5j2ptypQ6XHJMKtoYJ91X/5OhVAWMHtuzwCBhlqWOlmiu4EIkTHZ10YTyRJEtDdynqGYDcutkUUewGbtoa/iMK8i/yqqrLa4FNjA2UnH5NcV0Gh86Gm3ftw7rHa4FOdw/oGaa83FErGEB2hfi92SqvpXc1ch45y9GZ0mW2KBwDFDxhx6tHvZ/tvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 08:20:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:20:58 +0000
Message-ID: <ac630781-dff7-47d5-b323-80802260f2b2@nxp.com>
Date: Fri, 10 Jan 2025 16:21:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: bridge_connector: Do atomic check when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250108101351.2599140-1-victor.liu@nxp.com>
 <dm4lqvtd4lxqmxruji5eydmbqxoomj6fogiu4uucqfevifqpll@33eeykwlqczx>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <dm4lqvtd4lxqmxruji5eydmbqxoomj6fogiu4uucqfevifqpll@33eeykwlqczx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc5f011-4adb-430f-cb65-08dd314fb63c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVdXaUNUdElkV1pMY1oxc09wUGkrV3VyTWY4eDRYTWZCczU2aWEzTG9mbDd6?=
 =?utf-8?B?cStkTGVONk1SeUlrRjBHeitOTDRjMUNQUW5nVmdtQmJERlU2dmNsY3JiUmhZ?=
 =?utf-8?B?VEJrZVhqUWp5Unl0WDFOTVpQSkMreFZxOHhPbitQNWZVYWhYajhTR3NYVERE?=
 =?utf-8?B?eWNzd0dpcVR2a0tDVkxTakpSaXp4S0p4ZGpUaE8wTHArcm11Yk1rN2lLWXVI?=
 =?utf-8?B?L3NuZm80Zi9XYVV3bE41TWpRT2h2VXU3WXAzZHRqazEveFJXOENHczREYnNk?=
 =?utf-8?B?RGk4Q3BlRTR4M2VxWlZYVHVDZHJQZWFvdEtWMThVQk1VREVUaEtlSlFtWndi?=
 =?utf-8?B?SlJ6VkpOcEF3RjgvUFV2MHkxdHFpdGNxdTNaYlZheXFKL0F0TjNSTGVobWR1?=
 =?utf-8?B?REdwdUtaN1ZwbTl1SnFzMlZlTlYyMjlJc1NkKzdnZXlaMFkzRGlRMlhpb1VU?=
 =?utf-8?B?eUUzRzNLdVhoV2NGRDgxSm9mQ1ZZYS9hbWxzTEQrMFhDY0lmcjFJVFBMVXZV?=
 =?utf-8?B?UmI1d2dxYU95UzFxMTYyYWtNUmt4YlNielM5RklCMTlid2ZSZDNuUUQ4RE10?=
 =?utf-8?B?TVk2akNtemtSeFgrSFRWUDZjWmVGVjFpQWNSYUd3c3dBZVBqaGc0QnUyYkgx?=
 =?utf-8?B?UGN1ZHF1WThPVVlkemhoQzVETFpLREpIRkppV2NDSG1PaUtZd2lwb25jWkdi?=
 =?utf-8?B?QlJSODkveWNJak5XMkJVS0pHNWxSSWJkWmYxZnJiVisyb2JTOXdwMFpGUnVW?=
 =?utf-8?B?RWgwZGJKVmErV1hmWjdDeDhFUVNtWEhtdlVIVE1IUXRBUUhzZldCUXB0cUxv?=
 =?utf-8?B?V2tPQ2N1VUowaTlmd2pRckNIZHI2RXVRbGhlRmJXNWV1VFNzWW0wMWhEZDJx?=
 =?utf-8?B?SHhLUU1iMUs2c2UreUJlNTB2MHVya1I4K2N5a1NzejVTR1VCbG45WGJoVWZn?=
 =?utf-8?B?RHBBRXh5ZlJwSlNFU0pEa1g0YWYyYjM4UFRIdmt2TVJuZ24yMFNTc2l6TTR2?=
 =?utf-8?B?bHpid21ZVW5sNVE5aFk3VEtoQ3dBVnBFNGdGMmxiZTRoZ29JeTZHOE40Ryty?=
 =?utf-8?B?N2dpM2VabzdQVEpGd296RmY4RDVPa3RyWHgxMVZMQlIzOTVzMGRmdEtNc2t6?=
 =?utf-8?B?bllBNTl6RTVqRHdRMGw2OTYrbXY5UzdDZVhNa042ZzUrY0VLTmU2SWpNbUxV?=
 =?utf-8?B?Rlp1UTZFNVArOWpSMEFQcHVHT0dNbkxZbjd4UGJBSzlLaW9DWEZUU1VlU1Rl?=
 =?utf-8?B?QzlvWkhVcFVkalp0blZVMFdMRHhwbnpwdysvT2lsSkxDY251TmFJZkhPaGl1?=
 =?utf-8?B?WjI1WE04alNKcmFRV1dvSENCaW43NTdFSVB6OEhtdmtCOHpEdmJzSzRlNWl4?=
 =?utf-8?B?RFNpaTFxaU5JSzA1SHJmUnkvaXVBd2lKY1pCSHY5Tlhxc0pzb1c3cnpVNGlu?=
 =?utf-8?B?WnVSc01hQ056V2wzTUNmUVdTcUJ1UEN3SVFZWS96V2ZzbFNVMG1ZamRDUVFu?=
 =?utf-8?B?YTJYYU5vcml3QTNSNEhBTTYwU3VERVlzR3lmTURMOERMSUJUWEpkZkYrTjJ2?=
 =?utf-8?B?SkVsdjhpOFh3MmZBV0Rhb1l5S09RZ3Ntc0VCKzlpaldrU2xkbnhFYkxqQnln?=
 =?utf-8?B?MkFNUTluQ2FzeG9FYnIraEdaRkxlcGhJMElQcVZnY1Q0cmM2SDFvaTFkdzV6?=
 =?utf-8?B?UEJPcnFVMXJuN3d3RndObllEc3hqV0dZWm1qZWhaSFEzOVdqUmtBbi85dTRm?=
 =?utf-8?B?ajFEQjBLeFg5Z0ZKVXljNHlIUmgwWHkrZ0lMY1lrS3pDbWhmeW9hQ1NGd2ht?=
 =?utf-8?B?NmY0SFlZc3NHTjA5dHUzKzY4dFhuM0dyRXFMUC9oN09uWGt0UlJ6TkhwRFJm?=
 =?utf-8?Q?sw1hXJO8MTJTS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXhSK3BlTTlnR2Z2U2FXMjIvTUc2Zm1wRmkwQWZjdW1oWHc1WDdiMFVzZFFJ?=
 =?utf-8?B?QzhWN0gvaDFkNEw2NW5wV2gwck9kaHBwZFFybm1SbGphbHJkbTdTUDg2Zksw?=
 =?utf-8?B?RGhJRHBBRmRLeXplQzM3TCtrUDMya1h0TEZnOFFrZmg2UHY2RE5OU3VRdjl2?=
 =?utf-8?B?L3FYbmxSNmZjMytLaE83K1JnSjhMZFpyaE1rQWpxQVl0YnZYVlRibzV0Nmpi?=
 =?utf-8?B?WHdjMjVpNXdwb0cvMU9iRXBaRkcwYTZ5QjZNRW01U0NIWXVzcHVxYXJTRENp?=
 =?utf-8?B?V09aaEhqTHFvemhqdy9mSmQ4ZzE4NkhHYXlTdStZNjJHSWVlblVmaEdweDNS?=
 =?utf-8?B?OXlETDBPUGxtS2ZqMXhNMGh5aS9NeUpkZXFMa21kYTc4Qkp0YkdyeS9Wb2Zk?=
 =?utf-8?B?MktzUmFFeXpDR0FhNUk3VENrRHRiS2JWbVpTNXpPOHZvaU04SlJWV05kNnNy?=
 =?utf-8?B?Y2JGM2xsQXRqMGlUdDNhQlJqLzZMVk1nRUR6Y0IzUmdkTWorRkJKR0Iyb2hi?=
 =?utf-8?B?ZTNIdXVpMXJ4UHpXQ1ZoeXlKS1A5UHUzeDZSSFdmVmhiTUZaY01JYitERTl1?=
 =?utf-8?B?Z3ZHM1hwT2EwckNtekk5Vmpoa0lwZWJCbnp4TEFFRDhmV0lUQnlhYjZBYy9X?=
 =?utf-8?B?UkcySWFMdXAyd2RGK056NDVJTDJramd5NjFKU3ByUzRhR25KOVc1S2kyV0Vs?=
 =?utf-8?B?S3djU3lEVGxWU1JCUEhnR2tsQTc2WFdHTDNHbTRBLzdkTzlWWExYbGhNaVlz?=
 =?utf-8?B?b00ydCtId0FYcWhRVWNoT09rOEtVcEt0TjU2OFdIUTJoamNhVDV0dlIrR2U4?=
 =?utf-8?B?b3E0dFVNMWszUnFaWGxiUnh5TTROK2hqY3ZMZ3JoSG1iS2JCR0FnSHg1R2FQ?=
 =?utf-8?B?VzRoWVdsNXgzYmNFL2kzeWx2eTNTRS9jTDRLczZLZStoaDMwOEMxdlI5dkVk?=
 =?utf-8?B?a1Q2NU5PSnN3MmJaNURrNGNWdTFXaVB3TnpWTytHQktIRkh3SG8wcGJ1L1dV?=
 =?utf-8?B?RUwzZnRLWXBsb0s5SXdSaVZjajQwL0FQOHRxam1wRm9UYUo0SmY4L3cySWlE?=
 =?utf-8?B?RHhMZnhIa1NvY1Rmdm16TlZ6U1hvSVlEK3pUODdTOFR4SVNlaExsMXJ0czd4?=
 =?utf-8?B?eldUdzN2ak5GZE9SWVJQS3p1czF3ckwrUDdCZmZjUVJnVjNPNDRiMjhkUEVq?=
 =?utf-8?B?OFo4d29GTGs5dStwRzFKNXhpNmk4aUdFejlnUnpTNXFoS2N5a3VzdEJpSFht?=
 =?utf-8?B?Q2VzUGlQeXFZdklkcElJeGpRelJ6amVvYkg3Uy9oMHdjdi85ZVhpMjVjQ1FP?=
 =?utf-8?B?QndzdWRvelhZdC84UTVTM3hpY2ZBOEZxcXppNmFEOHhFK2xnaDZYWlU0bWlh?=
 =?utf-8?B?bG05UzY0RW9zUTlTNCtFMFhnbldnZEN1TEZRLzYyenNIRXNvK2Z0K1h6NTNx?=
 =?utf-8?B?dmIvNWc2UEVrbEwwQzVaUkZEdXFlVFpXRkNjTEpmejhHdkIwbkJTUEd3eG1r?=
 =?utf-8?B?eE5zZHlyeGhRS2lOSGFQV1owSHpYWmVJbE5COEJzZVllS0NsSEk1YjY2V2c1?=
 =?utf-8?B?Ync3UEV5K2tjeGE2eXk5RnVueHBHQ29OZ3ZpMlpVL2Q2ZzF3ODJqZFJKVmU3?=
 =?utf-8?B?WWVLeHVob1N1d05HRU81dFNFQWI3bTZ4L0NwejVKNWRJOFhVY252bEJSMHA0?=
 =?utf-8?B?M0luVEFyOWpubWk0L3M3RnR3SWZuUENXZklIS3huRzMzZm5HR0w2ZlpZNmJC?=
 =?utf-8?B?S1FpUHdBQ0sxSmd5ZGRPeUsyeHJUcGlJS0NjNGRBazA1Tkw1VDFIYm1SdFNE?=
 =?utf-8?B?Snl3YXNEekNGbEk0TTVxQlNmaGU2RmRRakc1bldRdmp4bTY3NUtVdjYvMXRN?=
 =?utf-8?B?Q0RpdlUySWdjOXp5cW00WWVjYjEvaU4wUUN6UEZCSmxWYUVpSlZYYWsyT01q?=
 =?utf-8?B?OG1VUXJ5bDVYaDczbUNNMzZZaDBvb1loRENRMEZ1UDBkT0RSU2Z1QmtCZndq?=
 =?utf-8?B?aEpQSlJlTC9GUFBSNXRONFZmMllGZmI1TytvWmRZRUFqbjhhM0ljdXNPVXJp?=
 =?utf-8?B?QVdRNG5iYk5uc3E2YllTMlcvajBrN1dkK3l0THdDRmNSZ3BvNFkweTdPUVds?=
 =?utf-8?Q?/4zpJDIY8G/yFX+p3UMxvw0Bp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc5f011-4adb-430f-cb65-08dd314fb63c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:20:58.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dvacb8N18qeG/GQZuS/kbc0gMgFPH9qpG12A88uyIOiEt1THAkA1lhBh0kAYGVBdVXCo/EHigze/8J+bBeZJvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397
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

On 01/08/2025, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 06:13:51PM +0800, Liu Ying wrote:
>> It's ok to pass atomic check successfully if an atomic commit tries to
>> disable the display pipeline which the connector belongs to. That is,
>> when the crtc or the best_encoder pointers in struct drm_connector_state
>> are NULL, drm_bridge_connector_atomic_check() should return 0 directly.
>> Without the check against the NULL pointers, drm_default_rgb_quant_range()
>> called by drm_atomic_helper_connector_hdmi_check() would dereference
>> the NULL pointer to_match in drm_match_cea_mode().
>>
> 
> [..]
> 
>> [   46.823581] pc : drm_default_rgb_quant_range+0x0/0x4c [drm]
>> [   46.829244] lr : drm_atomic_helper_connector_hdmi_check+0xb0/0x6b0 [drm_display_helper]
>> [   46.837293] sp : ffff80008364ba00
> 
> [..]
> 
>> [   46.911984] Call trace:
>> [   46.914429]  drm_default_rgb_quant_range+0x0/0x4c [drm] (P)
>> [   46.920106]  drm_bridge_connector_atomic_check+0x20/0x2c [drm_display_helper]
>> [   46.927275]  drm_atomic_helper_check_modeset+0x488/0xc78 [drm_kms_helper]
>> [   46.934111]  drm_atomic_helper_check+0x20/0xa4 [drm_kms_helper]
>> [   46.940063]  drm_atomic_check_only+0x4b8/0x984 [drm]
>> [   46.945136]  drm_atomic_commit+0x48/0xc4 [drm]
>> [   46.949674]  drm_framebuffer_remove+0x44c/0x530 [drm]
>> [   46.954809]  drm_mode_rmfb_work_fn+0x7c/0xa0 [drm]
>> [   46.959687]  process_one_work+0x150/0x294
>> [   46.963700]  worker_thread+0x2dc/0x3dc
>> [   46.967450]  kthread+0x130/0x204
>> [   46.970679]  ret_from_fork+0x10/0x20
>> [   46.974258] Code: d50323bf d65f03c0 52800041 17ffffe6 (b9400001)
>> [   46.980350] ---[ end trace 0000000000000000 ]---
> 
> Please trim the backtrace in a way I trimmed it. Also you can drop the
> timestamps, they don't have useful information.

Ack.

> 
>>
>> Fixes: 8ec116ff21a9 ("drm/display: bridge_connector: provide atomic_check for HDMI bridges")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 32108307de66..587020a3f3e8 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -343,6 +343,11 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
>>  {
>>  	struct drm_bridge_connector *bridge_connector =
>>  		to_drm_bridge_connector(connector);
>> +	struct drm_connector_state *new_conn_state =
>> +		drm_atomic_get_new_connector_state(state, connector);
>> +
>> +	if (!new_conn_state->crtc || !new_conn_state->best_encoder)
>> +		return 0;
> 
> Unfortunately, this is not enough. Other drivers (e.g. sun4i) use
> drm_atomic_helper_connector_hdmi_check() at connector's atomic_check()
> function. Please move necessary checks to the helper itself. Also please

Will move the checks to drm_atomic_helper_connector_hdmi_check().

> add corresponding KUnit test: attempt to atomic_check() the unconnected
> HDMI connector, there is a test suite for the HDMI connector functions,
> but the atomic_check() for the disconnected connecor seems to be missing.

Will add a KUnit test case to test HDMI connector disablement.

> 
>>  
>>  	if (bridge_connector->bridge_hdmi)
>>  		return drm_atomic_helper_connector_hdmi_check(connector, state);
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying
