Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE1885B0F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 15:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6816210E4C7;
	Thu, 21 Mar 2024 14:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="PacB2ZNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607C10E4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 14:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAjTsQtB5C955Bj7lcFdJvDk2tJiwJZm4od13821djNK0XrhVLAO6lK+ttx1UI2pJpCmmlOhPMN1cgTGJ2RlA+tNwEoWxlX2MG8NWd9V5MS+A1zRcU5buAWMUHraLmBmz9JDuJR77PVEFReKcxbKWcrm0m87OpuqdfeYuoxUFIFtmzBObOZ/KBS5yWqT0BtFqaARD72fABMMf0tScVfBf97u53pR+ZHaTTQMS1Ufd7moK2TFjW5FNkKB/VWbJ5uFnX7bt1OxQJmKya2QjFZnmRPGoc/9+WL+4GoDAdWcl9EMxGsUmaGpusmq5vsMQoU3cXcWYzTWNVGeVbFHHkvCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbZVUDNRMmMHQsmm4C1MYGkH4PCv3sdkPLpQfc4k458=;
 b=YSEO99bky/WC1mMHmDQc9ll/duGsnpdUWY19TMijgB2w9eoq2id0wmu3ojycLTmlNdAbps4JTPthaojtgSCSJm2MQb3r95PW5CDZNS3Jj3x8bb4X95MG/lNBS1VLDelKkqyjV7mhfT5gXPFnt2lH+KudmxzxwJ6APf7CzdD6CQuVqzNfCVIMpUZUqtJcMtvZWljUZzd8xvsLah7sDUGvaBOhxc+2ArwxhyxVF6owp1M88pvp7zAxQivqygNarmG5BpPBs51uSP9sRpjK2ef3Rv60uOk8+TYRUFqRRv4Sm3yUKBQAENnys6/5veQD/l1wll+y5rKgaOrwvD2Qng3tag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbZVUDNRMmMHQsmm4C1MYGkH4PCv3sdkPLpQfc4k458=;
 b=PacB2ZNb2w+vgiMYORmOCYQfciEIn9ofT1TjqH6VuXjrV0R3kJqhhrNYoLR+L0tFVV7uL98urRZCmysXNlmiScfwB44KDa17gd9H33ACsYAE6tLUymCtHV+hfBjmYmuwOebBARRGngb1/2aDrqErE5fDBV37xB3LgUlFvUTnJw81ziGbpnsm+4/UTxpKGsiU246HeQkxgxquGxwR02qbAZTQqLN/7xA4GqPYDz/cGeS+TiSer8m9S/043X7mrT97uVYWF/KwpwK85Rkj+7c561Qvo6XPXsuoVpdzpie2o1862cJ2pI5zCrmYalygSiDNcrPA74oWZmNK5HErYlIs4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.35; Thu, 21 Mar
 2024 14:44:41 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 14:44:41 +0000
Message-ID: <95136c06-dd99-46c7-a672-200ffc0b188a@theobroma-systems.com>
Date: Thu, 21 Mar 2024 15:44:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: ltk050h3146w: drop duplicate commands from
 LTK050H3148W init
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, klaus.goger@theobroma-systems.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240320131232.327196-1-heiko@sntech.de>
 <20240320131232.327196-2-heiko@sntech.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240320131232.327196-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 2495b3c0-c724-4627-492d-08dc49b570ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmFkG7jLVIArVAWaLwcBdECaVIaGuUBwTFBbbiBliCt+fKNsa8pzE91F5t7rMxBUVhYsutXWa3Kk5CFbaXWp150cOKr4urM89q8fnHCi8IMFIKIQl3WIw4mSqfSez5+5Yu9y8Ghorw+PkYtgnbQcQnIa94UskOCsow7arlXjYOLF7r6RAdc6Gfeb91KfCt7Diz4P78j8vp+TAf0BrRTMLoLfjzKikBeQbn0AalxddQFMmsVDyZ7G9ggElJmoWYu++IqE/ZB1pjSUpiT9VvNBoLdlLFiuxyOk1wALXFBlz4as3JpcejObVptBrT1H3Mw8t1jIfZWNQDzh9OAb2V9YL77L0xlCeaRuuf9nDtSjwfMxjvIf64pcrVCEIGUM3N22XMV88Bg4kdeCkL7CJNPjcHUQD1MGUkDsh8hcjQpIPnm0HPcaU0w+hjQT41LnHiPi1TSa0MWp3Z5CeA6GHDZ4ZJVrYUVo90V9hjAB10QwP0xn9G5FNuqxvk/eUD4WhS4lNcsTd78rUeSpLzKqwW07b5T8lJWJHWdsfMYJ3d6uekx0y1K6q/Q4/0e5OYahlTf60Ey4JMaHaAPKE7t1xKz4pleWIwtJNo8wlkRzFYtOo9BHDIvDlakOORgkOwDfmPN45836q9eJgMgZjdHniCud/msKhWBv4iNWxTIQTT2kprI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhJTDBXMm1vVHM1M3FsRmFUZ0IwR1ErZkE5UVJ0Nlg1UHRYdTM3eVgxcEpH?=
 =?utf-8?B?YllzU1RrTDJBbDVzQnc3cWw3SnVPZWFLZ1VhazR3aFJIN1YzdUJLWjZBcVJO?=
 =?utf-8?B?MzdweVhwdkxqK2FoNTFIRUJHcWIwMTEzZzR0UUh6TnYwUGQ3Y3p3bkZLM3dI?=
 =?utf-8?B?ckpCd1pvWnFMTndnVnIySmFuZnE3c283cDdia2ZIUVBHZzg4SjBDY0h6Y3hQ?=
 =?utf-8?B?aW1zSUhzUTVtRG1NWVgvSG5wS05rckVwREh6WlliWUVialJNcXltM01jNlU1?=
 =?utf-8?B?TVliOVdmeXhuVnNjMzBkOWE5MjhoK0U4MWdhSTJOWjFQZnRpeFdOODluVmI4?=
 =?utf-8?B?TmxDMGVrVEIwV2dwWUR1VGljcjhQS2lLamNWdG9lTmVndVlTQ1hUUFJZcTky?=
 =?utf-8?B?QVVBK0NnWDJUYm95elJCa2xrVFUzQk9xc04xQVM3MVBkOXZUTTJ5SWlzRm8r?=
 =?utf-8?B?cUlqWUJyRXEvY0xTYWV5OG1XeDhsSllOL0RaNHdIdVlpSTRnSm8reDlacXBH?=
 =?utf-8?B?VTFuNXdEUUs5VnhicEFsWVcxVFRRVkFJSzBJT010YkZWODFhcUVUSllUZ2ZL?=
 =?utf-8?B?cTdHVjFCREYwYzJqeW84UGRYWk1nUThFM3krZ2s3ZzVvU1hkcm9nVmNuN2Jx?=
 =?utf-8?B?SlljZzYyZkF6emQrcFdzR0FFVG1kaTBJOUxkUnk0TnIxQmpId0RGMTBSbVpI?=
 =?utf-8?B?dDVIbXBESm4vb21kT281Z0hMbnlodmJJQkdqWW5iSWVRazdPdFE5MmtZaG45?=
 =?utf-8?B?UXl3T3loYWpGdGdIMlNQclFzQ0JMaE9WYnBGWXM1UTFiQXRsUVJ3eXFaUVlW?=
 =?utf-8?B?MUtoaUZsL0E3ZU51ZDgzTUpuWFUxMkdNMm1kREJCQlg5RXV3Sytna1FUd0tp?=
 =?utf-8?B?ZE1kUVI1NnFaYk81UHhpNC8zclhaanFCR25BaXRXcFlpSGo0bDczRStFNkNM?=
 =?utf-8?B?aVBHcVRraEpRcEI3RFNXVnpKT21yQjF5Q1BXNm11WlhqK2NLNCswd0g5N1BY?=
 =?utf-8?B?bEVFZ0xySUFNaDZQMjNObi9OMkt2VXYwbVcxT0EveDdEMHptMSs1cFdYQmZi?=
 =?utf-8?B?T1M1a2VXeFNZVDdmQmFUeFFrbDhiWVNqMjMyYjFWOVNRZU81WEgwRlhCWWMx?=
 =?utf-8?B?cjZrMjVuM3FXbDhNbW5NMEdaSEdBSnM2VC9ZcVlwL3UzKzVNNlVPSGxiRU1z?=
 =?utf-8?B?K2k5eW5pcytlUEdhaFBHdThYOWo5QUVnQTFxZnlRUXBwdDNiSVU4M2FRbDVx?=
 =?utf-8?B?WTlpa251Q3lFMkYzdEl2K2tjZjlBMmI5NlM0UU9Md0NyWEhONWVqbCtaYkd3?=
 =?utf-8?B?MDFLRkd6MkJJUDVWMDB5d25DVTY5WnhSZzJuWjJBNUdpT0VDNFQ4NnVNOGJi?=
 =?utf-8?B?M2pPaUpFNGMrT3Nkd09aTmIzSW5uandadzJFQ3hyTUowVG9yeUR0Z0twOTZt?=
 =?utf-8?B?ekoyaHBzWUFwMkVQYmlEcld0NyszUFN0cDFIVEVlZWYwWlBOdlVsNklwdHNS?=
 =?utf-8?B?cTlMbGM2eUlmLzIxTWREaENUWkZlNjdMRTJnWm51N0ZPc3pTQnRoVldYcWpT?=
 =?utf-8?B?WmJEQkEwZWIwTkRPenI0OERoVitjZGpGVkhBOXMxd3d2OWF4L01JOERmSXNK?=
 =?utf-8?B?MHRENlJZcDR6a1hFREJNbnJ3ZWFJSllvczhNZm90ZWVYNXdqcGZ5NDBMTXI2?=
 =?utf-8?B?YzNCM2Fxb2JNaVh4Y01ma2tiM2dyTUw3djJFY3l4dGU3aE9LU2hWTUJlV3Zh?=
 =?utf-8?B?UlhGallXN0lOcVk1RzBnRjE3MGREYW5reUVHL0pxQ1ZsOVF2QjZJaiswek0x?=
 =?utf-8?B?L3VWQWU4TUF4UWRHUFpYMEVFajN0NVZXdnMxYnRORExsMUIzSnVDMWlQZTE3?=
 =?utf-8?B?cGVRaEk2WHlDNnpSTXlQQzRVa1NUamE2Q2luRmRCYW81UWgvVmRIODZ1cDlH?=
 =?utf-8?B?VWk5eEFXMkUzV3ovVm83bXVHZk00MkxiOG5zaW9LS2ViTlpZK01sbzJ6aGdp?=
 =?utf-8?B?QVJKUGI4Yk9NUFRUdEQzT1ZaWUtuUGR1bjN0N0dqU2RXeDF1ZG56K1llZXZw?=
 =?utf-8?B?Um03N29TTCtrdStTa2p5QW8yRXhpR2hhQ1EySktnYzBFKzREVGcwcS9mOXk0?=
 =?utf-8?B?aVhzZ0F1anNId2JzaUhualViNFcwM1JPVHM1Z05FN2ZsSXZ3UW9wRWNrRFhK?=
 =?utf-8?Q?vaG1soqs/v8gQXEp4f8eGXI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2495b3c0-c724-4627-492d-08dc49b570ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:44:40.9577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3tWEaSOIA6y4oME+0peBNcuXtFzG2j4k9a1jYSSotRChcVpco7fFcUkt+sxilH5PoPsXzTzopEA3meUu+rxNJ9qSnfFm2wrKYByTIsoeS64rAML68MFJoUMFI8ndssx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831
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

Hi Heiko,

On 3/20/24 14:12, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The init sequence specifies the 0x11 and 0x29 dsi commands, which are
> the exit-sleep and display-on commands.
> 
> In the actual prepare step the driver already uses the appropriate
> function calls for those, so drop the duplicates.
> 
> Fixes: e5f9d543419c ("drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks!
Quentin
