Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4B9E33A8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 07:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124710EC0A;
	Wed,  4 Dec 2024 06:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MnrUSuNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6809D10EC0A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 06:47:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOX0dJukIjItBG6bzW9jdpFh67gLbjpKFrUo3kU5C/sYP0mjJTpATtSMBrV9QYcVbDn0Gwy3uGfHxoBGZsSOw89w/q46KNk7iBqvY7jNkdPq7rvro3corHsdECn8YHPjuq0yb4dDodYxxAUZs/rd1no46V5rZGleE+j+cafXQnhEp3616ITp9WbQHUuZIP7df7rddT5TtjVaqBdyzcEi0vlpSzf/FLi6idgAS+iGY6+Wv/wYM46Vw66cljP2yQnfqWUV0EdjEhth7er+/GagGz1n7TXKWhhVbOGwo8Yw09wsJ0vRkoTNcc3QMD4tr5VoO2rPvilxu88SXL4uYTuWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeFYT0J52Rerp9fow2PXWfkBhAnZIOmXkbFeJfyyRJY=;
 b=UjKFNXF1ju//9K+mc9Aw4XMW78j3CZg6HNzfOibgGchB9goXIaQYmM4vMmUCQyo2ZiXotewDu6S+wIpKcJHfjuLIfcBWifSWKSHSi9u87b/9arnacRhC/bRJ1NR3AzZGvBkn1oMEA4IB9dNz2mUUWk2YxoKsBgu6SMLRVm8FTlm1lwQjxf/uj73AV446EeNT4sb+nYVA39E7cB4DrItKBeMgaY2VtcovLPXxrI8Yo8SEFR5E4mE1TQd+j3QctpZvAJo/d93UOmcfPosEWsSMeaO9xQoc5fjJs7n3nbLQgouZOD63mvnW7T+QO9SPz3yff0gxSZZYX10vEj/p4xXRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeFYT0J52Rerp9fow2PXWfkBhAnZIOmXkbFeJfyyRJY=;
 b=MnrUSuNQR/eLkNGSmpjUPBuredYKfBDoEh5+6i9IocDwrgM+mGpXPYYcek/bdlNtmrsLnySyb14oJPD/jUXSf3xOIyd+/GDnwE36+QvVwkpwtnWRKU4xv+udO+5OnHLHF2+Gxl/JNCslROtRkIgkCgs68lt4y7p//Ihfa/c9eI6uSrGokXfzFGF5vCove3GVq7Ps13YqWLxLrjZNMyoMQBgycJGl6CWtDtOFlxOFoeQ3l6q9BGEauEcHoCsWamu6VJmyYzsL7deNVLTJYuuWSbz0DJL15dV08eTWCITikzDjjZpmdd/0tOonAsTqIwXiGLyRyryItkpD5rSA0VdeVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 06:47:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 06:47:08 +0000
Message-ID: <34f14647-1822-4965-9c75-4b745bf39941@nxp.com>
Date: Wed, 4 Dec 2024 14:47:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <TY3PR01MB113464084E6020F0B138ABD2886372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113464084E6020F0B138ABD2886372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0243.apcprd06.prod.outlook.com
 (2603:1096:4:ac::27) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: d68a5334-2d3f-447c-7830-08dd142f78a9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1hTMHg5QnplV2R6Z3lYclRWdGJlczRFVVRGbURGMXFPdTIzZnJ6elJncXYx?=
 =?utf-8?B?RHJOeGZEclE1UXJCaVU3MUtoVFZkeSsvSkkzZlpmM3pEMWd2bG15d0pWTnFl?=
 =?utf-8?B?SGRqRkJDZTl3SWF1d0pxZkJyK2orRS9rRU1oMGdidGlBaUJUSm5xbjJTdGVR?=
 =?utf-8?B?b3VaMlJEZjN5ZHRPUjk0Sk4yMVlaYnp5eDdCOVd3TnN0UVNyOFdaN1UzNlNj?=
 =?utf-8?B?aU5CZUVMOWg5cEtjQmtWa1VGZXBNQnZFVlNvSytpbjlxUzBOUTRqREJxSkV3?=
 =?utf-8?B?QzA2b3FyYXlma01FRndmMGhNMG9WSFZTcXBWOTd0NEpoYzFKQ081NHNtODBU?=
 =?utf-8?B?UHpQRGFMTWluUXNmR09BUUxXV1hlQkNuclJaMzNUU2dWQmdoaXZBVU5xbkI3?=
 =?utf-8?B?ejQzZXllMGxHVmJvNmU5UGRIeG5EZkpyT1puUjdPeVRTUVhpdWVnaVRMWmZn?=
 =?utf-8?B?MUNPNVExdTlYYlZIV014cHgxdE16T2J1cWNoWjlXeFUwN2hiWUlwQ3JJQ2tm?=
 =?utf-8?B?bHFDbnFQTHFPWUVPZnNhNllRZ1NkNy8zanZiUG1JQ1Q2SEc3WlBGQlBzU2RO?=
 =?utf-8?B?SjhydVlnUFg2UWRYNnFiYVdOMFBqb0VpOE4yTk4xcFVhZUtDdVZNSlFCTTRa?=
 =?utf-8?B?Um83aEVML3NnRmt2clJZamFEeGxKeE1oRCtFM1pnRjdwYUZZb1Jqa0ZUUHBk?=
 =?utf-8?B?K0hFSWsxTE9ld2k3aW5PN3dVMWZDU1VGZVYrSXhKYm85STdOZk9vZDRad2dO?=
 =?utf-8?B?MVd6YklOeEZRSSttdGgzTDRFTERrbGlPVCtzd3JFRUl6UEdTSThkaU5MQ0J5?=
 =?utf-8?B?djBjcWh0QnlvYnEwVnArL1BBcFY3QURLMkxYZlBPMmhDUkdxSDZSVWdRR3B2?=
 =?utf-8?B?Mm5kSGJZbDJvL1NDeU8xUlh0d2F0YklYZGUwOVk1VnptY2dXQ0xyM2k1U2tq?=
 =?utf-8?B?Y3FncGRzYnV5bS9UeDVXS2RUN0E2aHA5U3IvMGdpRnFmQWpiekExWExhbi82?=
 =?utf-8?B?SjNQNHhjVU9DOEVjUUtNNUNLSUphRFJISm5nVUZ6YTc1MUsxbjdJRlFnQnBL?=
 =?utf-8?B?TU85UWlxaWVEVUJSUWZsRjFBVUo5M3JYWFVsNWRaelBYanVQN3gybEpQVTZt?=
 =?utf-8?B?QUcvLzIrLzY0OEVlWUVIZG5nUWcyeDVFMVBDUlV4VURJV0FEd2VRNVg1bGJr?=
 =?utf-8?B?TUNKdDVWanA1OG9oV0kxR2F1ZWJDcCtmWWQwdTdmOENLTzExMHZaQzMwL09t?=
 =?utf-8?B?NXVpNUd0QTRVMXVNZWhWL3BqVFAwcU5nQmdicnN4eVp0OTVXQVV4ZHJBTW8v?=
 =?utf-8?B?R2hhSFBIT0pDSEFkd0NaZFQ4ZHVjVGtGaTlHWjM1Y0RrT1JraHB0WlpkS2Vt?=
 =?utf-8?B?V3p4b3FzMVI4N0dtbUpOVGZmQWVrRWJZMmFsZ3V0azBSVWFZRU5BdDRYKzl5?=
 =?utf-8?B?dUF4cDBSWkttdEdJTkZaak9vVjJpT0VmOTVFSndmdHJpWmNsRW1IdFdOSWE3?=
 =?utf-8?B?S1g5Y0d0RGdtVEpVYUlLQzNCN0dodjBPcXVJaFZ3TUtqclJOOGo5K1hCcXBo?=
 =?utf-8?B?dHFvRFRCSkwzejhWY1Bqa1phOUFUb1IzK3lLTUpDbnhJRzJxRmk0WkpTTC9G?=
 =?utf-8?B?bjQ2eVNZM3J5czZVNGtZNyt3ZFI1cTArclBIMzZ2VmZhejVDM2JYaEVxK1JR?=
 =?utf-8?B?NlRLOXFFZEc3ZGp6cVdQRkxZSW5va0IwcEg1a1hYQUZDS2U5T1B0dlJHeWJ3?=
 =?utf-8?B?bld1NXl0YnRNM3Z3S2tDK0VEbnhad2p3MWtnR3kwSUs2T09zbFVNbWYxdWJM?=
 =?utf-8?B?ZEQ2LzRNWmRpaUcyWmtsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlUZmFnenQ5bjAweDdmYXdXUmRTcVZZclBkTjZiWGVVdit1T1ZXT0FvYUxi?=
 =?utf-8?B?L09GMGdnejdQSkt6dDFYSkZidk14STlvaG1YOEV4VUJHbzFxL0d1ZENnc2Fr?=
 =?utf-8?B?cWhhd0p2aXQxN1NWUVZnMU1vWHRLUmsrMWdxK0RXRTZ0S3ZnM0Eza1BpU3N4?=
 =?utf-8?B?enJzQVZ3cXRWOUhRWW16OC9FdmpraVRRZEVDN0hyU05TazVqaXhoUG55UzNO?=
 =?utf-8?B?dTB1OTVtUHZ0YisvZDlNNHRxRWIvVlNSR1dtcFBLMUZwdm1STmJDbzIva2tO?=
 =?utf-8?B?eHk1ZHJxcWVpd0UvQ3RpaDBxejZScXZFLzExZlBndmE3K2NFRVJlc2d1dWdM?=
 =?utf-8?B?djh2bFVLUjRtcTJkNW1EdWZSVm9VNXl6RWlwdDFwSE5ZTW9Lc3hCSERjSmVp?=
 =?utf-8?B?RldJTGUyVi85Qkw2Z3o0UFlnNVF6T25zcmJKN2NSNE1JNHdaS0FoVmM0blRB?=
 =?utf-8?B?UVpnT0U0RmlKY1dvUGhuUkx4SkhLejFOaXRneFZKZm5CanhxM1cxRC83clhL?=
 =?utf-8?B?K2RhV3F4ck5xUTdQU1FSWWljcTh2RTJNT21lRnN6WVVZcExZOG1ZWVJBUnhR?=
 =?utf-8?B?dnBLenAyMnNWSmIrdU9veDQyT0FTdkVjRndRdFBoMzNxZ0phMUpYM1ZGV3Ev?=
 =?utf-8?B?NGJrRXlIUDR6L3BtZTVxV2d6MjlEVFhndnI2ZXRWUWNLZytwcW95bzZqdXg3?=
 =?utf-8?B?MGJWQjVKOTdXb29adFpMM2VaMzE0dGRZbnQyYTRrSVZMR2VkWmJhdWhMREpL?=
 =?utf-8?B?OGg4dWNZcXdYbFNtQXFxb1ZKNFRoUElzQ1FjRlpxb2lnME14RVlEdlRRTmM3?=
 =?utf-8?B?NmkzNDJhSkhpRjlXMHRKbitTUjNFZ1FpRWE1cUcvZlRoZ3Z2SmtDOUhYU3l2?=
 =?utf-8?B?dTdDMzhYRHpjRzJBSUsrc0dEQ1JhSjlhUEJZRkJvWHMvUmtJaFZ5ZlgrWmhl?=
 =?utf-8?B?RDhMYjFoS3VhTFI0bGFEV1NIMktGcmhEcW10eVFJQzQ5czNLdGhjRzI4Qlho?=
 =?utf-8?B?K1k3bzZDSGlMMW9vejA2WWM4T08yY3lpRGRDNXZQdlQvN2dDdnNiYytmTmxL?=
 =?utf-8?B?NlN3dlYza1lWTlZnam1mVXgrQitDYUlYQmpHZzZjZGxBV0FWMkdaQ3FuZ3Jp?=
 =?utf-8?B?UDk3eC9BZ25qUkVkSm9oYzFTRUVUaFZRd3F0YXpMa0w2RVowY3A5bTVhODhi?=
 =?utf-8?B?YTloTmYvVm5RUWQ2aTZ4MWdTSEJVWE12VSt0ZUpPaXBlR090NkN6SnhDN2Rv?=
 =?utf-8?B?M1lWcDJhRGJqUFJmN0tEcklkN0pGOE5kVlNwNlBuK0Jkajk4V3NZK0hLU0Rz?=
 =?utf-8?B?YVFkWUhScmFzM0NEdWk2aGtua3BhdUdnTEVYVjhkdGFqTE9TVS9Eb3QwM3JU?=
 =?utf-8?B?RUNjTzViWnUvMHV1aVcrNStFWFhnaTQ2VVlNakF4NXZpWVN5R0tvbGpDZG5G?=
 =?utf-8?B?TGZiR0R6cFJ0d0VCck5VWG9pMFYza0xjTFJsR3VPRjFRU3dwbDRvZnVRUkJt?=
 =?utf-8?B?dzRyNVhqQlcxZUU3aWI5d2w1YzkzNCt3VkZTSVhFd0VNcjZPdk5mdXk4L3Qw?=
 =?utf-8?B?QXc2Q2k2YW10Y0ZIazNqL0pkUjZPWE1malJ4TEEvNEx2dXlnbFd1S1FJbWsy?=
 =?utf-8?B?MTRkQnRIRGVDWlFoQXRpY3VHNVRIVnhmNGVjR2laYjdUTERNNGlCS016SzVM?=
 =?utf-8?B?K280S0tYTlZZSXduZzczNHlpZXVIN2cvOWVrU1BYaEVocklLNFlZOVdodWc5?=
 =?utf-8?B?RVN6WUFvWDBlbjF5LzkrWUVyelBDZ0N5dnNQTUMrdFdFeWRuSGJQL0NGUVNO?=
 =?utf-8?B?SXNqdDM5MVNaTy81Yk15SzRHMGxhRkdJOWx4MG5IYTkwS2JQY1RqNHBDbG1F?=
 =?utf-8?B?dGFZNXZHUVZBQXpjNGl2cTFqOUVWME1reENkcWtmZmtEVXJjd2t0QmptRGQ3?=
 =?utf-8?B?c3NoUklXN3ZHSFpSSXpvTFpRRW9mRDdJQWhDUW1mU3lXVkpHSjBQR2NpNmM2?=
 =?utf-8?B?ZTA4S0ZWTVRMTnVIYWdyczVGaUlLWjRsMTZrMTRzMWI3L2ZIdFJ3ektNS0lE?=
 =?utf-8?B?WU9pbkJHQzVzMFNBWWZBRjA2YlFtOCt2Y2ErK1NXTURVZGpaQzdQQ0lxOWpF?=
 =?utf-8?Q?hCaf4pHEvavtL6xSJPOesj+kd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68a5334-2d3f-447c-7830-08dd142f78a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 06:47:07.9790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pULeasGAhGzg7zFTc0rIRmSm9TENGHqjq3/hhuEO9mXtg/ST7r4mikiCf1Eb8wpJF/fYx4CxZhjuVsADawzQFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
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

On 12/04/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 04 December 2024 03:34
>> To: tomm.merciai@gmail.com
>> Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
>>
>> On 12/04/2024, tomm.merciai@gmail.com wrote:
>>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>
>>> Introduce it6263_is_input_bus_fmt_valid() and refactor the
>>> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
>>> format by selecting the LVDS input format based on the LVDS data
>>> mapping and thereby support both JEIDA and VESA input formats.
>>
>> ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while this patch actually only adds vesa-24
>> support.  So, to be more specific, the patch subject and commit message should reflect this rather
>> than claim "Support VESA input format".
>>
>>>
>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>
>> Can you please send this patch with your Renesas email address instead of Gmail email address?
>> Otherwise, add a Signed-off-by tag with your Gmail email address.
> 
> If I am correct, you can clearly see the Renesas email address after subject.

Yes.

> So, the procedure followed by Tommaso is correct.

No, I think it's wrong. We don't know whether the person(s)
behind the two Email addresses are the same Tommaso.
Likely it's a person from two different domains - still kind
of two people.
AFAIK, sending other's patch needs to add sender's SoB tag.

> 
> You can use gmail account for send patch, but you just need to add From tag and SoB tag
> after subject with company address.

Again, we don't know sender and author are the same
person if their Email addresses are different.

> 
> Please shout if anyone think this procedure is wrong.
> 
> <snippet>
> Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
> 
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> </snippet>
> 
> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

