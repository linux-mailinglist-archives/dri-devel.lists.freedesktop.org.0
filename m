Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65CDB82AE7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 04:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04910E62D;
	Thu, 18 Sep 2025 02:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VipX1MNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BC910E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 02:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiwQiU02DsFpoHunreBIhBh70VakeRdaDllwhtIQMN9nljM2HsLC6pjd5XIUQngYcpvc4k4W1sE0v3fO092n835za4y8FGz4vhISHh3N8n8u00+BfWYrEBDgMJH9t4hNRmQrp4XOWbqqV8PY4ZdCMBzS62WVFx/YyFkpA/la+q0Di8fgfi7zEBOzfy6aNzJVNmVmEzfFn3OHGWnGHoovzBdnECGEZZrODGQ8iLVMOvcND3vuXylJpStLJBAJnwSUBV8WYQhnhoST1abJhDQvAnd+c53FVNF97AXinZKbt1M3dz4/51SOpBRx7+QYjv6zePl6if9SGAxHY2CSF9h4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FbalUmeaGb8XuDJNjmxMbaJ6H6HtCe43Z9cPm0Nalg=;
 b=oZZCPRRIaWch6OyTXHSRjC4mZMKgeVs+uNU9Nb25Q79B4Ulm7uB5Z2CxYUMp1E9WVLtECcTr59oKOuLqjhz29Ug0wdNnhXzjS3NNs8gWMwGxMw9736HiUze7pl5dsvsWJeR1vSz4SHfguB/Do4DNPIGBWR86fgkEyS2KYaGL9lf+VwAIQ8gbCZHdbAwdAd1JwOosgrVX2YyXslstqqh6uOEgsA2Kdc22H0mh+yBodSBujhz+4PXXlNKdh3c9ghd3vNKpg8vK91VgU/Qw3PPsEzEz1GRlxzk+ibhRvy0Z1DGS/F0O3NbF3Mvmxl+FfwwILw2KAIbUSmi94iT6hpslAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FbalUmeaGb8XuDJNjmxMbaJ6H6HtCe43Z9cPm0Nalg=;
 b=VipX1MNuDVS2DQStiQQMZAP0EQN7QMFdHK1RMCMgPXYz7uXu0SKFgLZLQsEqEOiqgrxPSvPNc7T9g/nwZvr8gek/HyauJrZ5MYiHbxrCjMuCT/P2AYWM7VSgiC/+MqrZ5GpK9s0FACvcHtmBKc3/QxIIfQ0hl6H721+J+eY2sXx2C8co38HFSiJJ5rrsrVbiGUyckK9aZCAtk25QfevW/3dDwX7LOUXFJj0JfkZPtYa751I8HHNOkl28x9eVXVQqBYrZjb8AL1/liSo8hZAsHNcljfXkF5QTjr85P86K5yXlARMA6iCXufhefxgwpor3ICZo8OIkjujJ4h2Wuy4ImA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by VE1PR04MB7423.eurprd04.prod.outlook.com (2603:10a6:800:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Thu, 18 Sep
 2025 02:46:20 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:46:20 +0000
Message-ID: <548d6b53-f301-4977-ac68-a2241e45aa07@nxp.com>
Date: Thu, 18 Sep 2025 10:47:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
 <20250917-drm-no-more-existing-state-v4-17-5d4b9889c3c8@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250917-drm-no-more-existing-state-v4-17-5d4b9889c3c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|VE1PR04MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: f92d644e-f01f-4b5a-c87b-08ddf65d8bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjQ0ajNKY2pLWU9KcDdlYmFONE1Cb2F4R1lCbmNWaWtMbHRWQVpPeHBEcEtB?=
 =?utf-8?B?Zmo1YnR6czlDdDh2ZitGN2tldXU4QzA4dkVzRlhVRnVXN0ErdEZXS0pDR0J1?=
 =?utf-8?B?RXNGNnZXUUpGaWZqcHBqYXdhOHNLMnUxMll2ejkwekgyUzVBRHp4MTZvY2xZ?=
 =?utf-8?B?TzJqUEczQzIyaktvcFdlRXZYREYrYXlLOUh5VnF0d3hGSVNMSGRKZ1F6SzRZ?=
 =?utf-8?B?MzZEK0lBdXRUZ3hlSVlOM0ROa2tTeEJlaEMwaThaaVpKdHF6eFNKajZYSlFr?=
 =?utf-8?B?akVOZ3cxVDVwQzhSNzdQTGx6WXpVQkU4R0c1M2FSRjBHd3p1OVNzeTBKN1kx?=
 =?utf-8?B?UnFJcFZrMUVEOXNGdkxNWlVVc2NtbXNwRnNuZTVqWjNxMW9xV0ZzOGp3cHZm?=
 =?utf-8?B?bkhmVjZBSUthbWw4bG5ZMmxyeWxKeE80UnJoY2xQWGgzTXV2NVlTSEU2TkdR?=
 =?utf-8?B?MDEwRERpV0dWUGVvaFNWanBnUkxyOUFpdmJpWC9sNmxCRjNGRTc1aEtrMlVJ?=
 =?utf-8?B?aXZWYTRhSnVSeC9BMHlLVXlZVXNqUXFpeDMySUR4dnBmMGhZVkRDeFZSQjVI?=
 =?utf-8?B?c21EOHJVWk1COUFWdWFZR0JIL05JQjVnU2Vrc3dRanRrMlp4SzFzSS84WDJK?=
 =?utf-8?B?ZDU0NlBwZUVGb3F2RUxzRDMrRUVyTXFhZXI3MEFYN0xBU3ZhYjJCMHQrUzEx?=
 =?utf-8?B?cW5ta0J6bitEa0xTRHVJbVpOSWErdFlWVk4zODVhZ0tqYmFxbXBGZ3V2L28v?=
 =?utf-8?B?cVRiUXlPTEdLMWp0TFRFckg1Y2k2d2Z3Zmo5REhCUVBpSTNvV0g3N2FtUzdP?=
 =?utf-8?B?MmE1eGxVczQzV245LzdNdGpLd1o0SXFpSHhIOWlTSDF0L2JQSDE2cnNBa0Fj?=
 =?utf-8?B?ZGx6OXBIbGd0eW5WK2NtMTNjM1VNUm9JMTNwTzh2SXI3Zmw2OFZ4NytCUlFm?=
 =?utf-8?B?c3EvTXZmVnRsaS9sa1p5QmVvTm44L2IvWkxMckxtMjJhOUR5dDR4YzBSbzEy?=
 =?utf-8?B?K1JMSjFPME84dW52emo0VHgxV2UyeHZjcWkwOXoyQ2ZFLzUwL09abFd3c3hH?=
 =?utf-8?B?TE85M25ibHFQekZpQkNDOTlQd0hTYVk4U1RncXYwdEI3U0JzV2hEOEFWSFEr?=
 =?utf-8?B?YmRJdW5oMGZMRWRSdzRJdFFRVUdUalpRN2ZVZmtGc29BQWd2Zm9mZlR3dEZY?=
 =?utf-8?B?WjNSV1pLS3FjRVpMb0dub2J1aFpLZE1mbGxkYXpzazJ0SFdTYjRsQjZIc21p?=
 =?utf-8?B?QXlZbm45NEpPTDZ6cHZRSXBaK3hIR2FnNTJkRVRzOGVnYzlCOTRoa1V1RWN1?=
 =?utf-8?B?TTZkOG1pZk1nYmdxS0VTeG1rS3FTaUlSa05QeXp2ZEVaLytXanlCQWFwcHha?=
 =?utf-8?B?NHR3NFVnR1hUYk1zU0Q1azVrdCtvYXpmdy9wRnZhMmJlczRtU0dsUTJjdURL?=
 =?utf-8?B?RHNPNmkyaU9YY1d1YnpzOStRY3Fwc0FOVE5FbjFKaTR6dE5YY01Lc0h5dmpO?=
 =?utf-8?B?bGFUYzN0V3I3YW9ibnd3UVpRcERibWJzYlI2SzJwV0YzQUlPZmQrbW80UnRI?=
 =?utf-8?B?eHFBOXhiUlg2OE4yS1hRY29TbHlnUGxIMTQvRXN6YjVpbUxOandQUmxyUXRp?=
 =?utf-8?B?RmNPdHhIaHJRTmZxakRoc1A3cFhia0lTZklPZ2QzTjhxWWZySFRHcTBVSVB3?=
 =?utf-8?B?SjFLbjA3TGl1bHhnUW5hYkh3dGhGTnJtTHYxQmR3MVYybDB1YWlPUWZ4OWZP?=
 =?utf-8?B?bUFUcVJqWm1EaGxVSFZrNE9iNEtPb2hWREEvYjNha3d4emZ2K3Vwbm5rbWp3?=
 =?utf-8?B?bUNTSTE5NDF1NFp4OWpJTnZ6OE03U1VKNWswVVhuR2dnWmpQYTFGSE5NRFpo?=
 =?utf-8?B?Z0t0R2R4YTRkakZiM3lheHFWbDVSSEJHb3hkaW9ZemNyL1BTOFpScS9od2Nq?=
 =?utf-8?Q?8MGbLOtEShg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpGZ2FuWjZ3WFpQdnlvZFlET0tpeHpEdGxISUdDRjZOZEdzc0JoOHhRcUg1?=
 =?utf-8?B?K1NTNnc2SDN1VW5aWFIvTkhFcldiTGdpTXYxejQ4TDVqQ1dmRmFhNGEwSnBN?=
 =?utf-8?B?VFpnQ3k1ZjkwdTZDMFZDL05vNHE5MTJDdG1UdEhrRjhCVng0MERTc1dBZGhR?=
 =?utf-8?B?ZEh6Y0dGb2xIVFVsUHBpOFliOE9hai9pOVBLaGlFVFZSQWF3cFFjQnBtYlpq?=
 =?utf-8?B?WnRWd0puSGxjVXpZNFJUZUJmZ29SV2dpa2l4QzFMemVIdHhyMmRuN21JNkdZ?=
 =?utf-8?B?NkY3blBiVWZ2QVR6NlNjc2w1N2gzMUp2aTJHY056Lzhqbk1kdGRyenJrRlJn?=
 =?utf-8?B?OHVYM0ZsOTYrVFV2OWhkNDJ1YWowSTU4SXhEU2FOd0hURm1tNk1PN0RlT1B4?=
 =?utf-8?B?YjZtQ1lGMmg1emxQdVh2b0tjUWFnZTJ6TGxsWnkrTjk1T3BISit2RFA3WXpB?=
 =?utf-8?B?ZThKZkE1eUgxcXlWdzY2SjFzL1VvY0N5anI4M2Q3aDZxb1ppVFl1RDIxdDFB?=
 =?utf-8?B?SHliTEJydTl2Q3dVcWxyQXd0eER4WE0vTmFYMVRMZHU1Q0hPY3JMckIwelY5?=
 =?utf-8?B?M3IxQmcweFh6cVA0MWxaQXZSL2RXZFZWS1FBeDlNcnZ1UGY0RmJOVUpicmFO?=
 =?utf-8?B?ZUNVUEFVZ0VWU25BVFhuaGVFTzhvV1pTK0J5ekRScnBWbys0Ynk3c0paL3Vr?=
 =?utf-8?B?aEd2SVZFZUZqb2FneGFOb2ZjVmFFdXZLTjVoZittT1VnMGpwRG1PNXRPUnZ5?=
 =?utf-8?B?cmtGM1NrUFJ4a0ppTWNUQjY2TERCNGdZSkUzVUp2ajY3WkE5NCtrSU03Q0N4?=
 =?utf-8?B?dVFUei9heDZIbURzTGhJUzZEUnd6SE1xRWVkeXRpYjdEeHc2UnNpaStkT0lz?=
 =?utf-8?B?d2dLaTE0Q0haY3FicWVzbG4yR2w2MzRzSGR6ODJoZmxQYjU1MXBLQWQxTUZh?=
 =?utf-8?B?b0ZLaXdSTEF2aG12RnQyRWxDdnFYamlHdnRyVVQyTGhiR3JES242Wk1EWWNR?=
 =?utf-8?B?YnowOWNwcU1LVno0SGhCK05xZmQ2bE5TeUxMWUhGZEU2bDE5Mm1lUzN0R0tD?=
 =?utf-8?B?d2Z4NHZYakd1dCtDRlpBSzRiTUJHSjBZK3NmK2ROY05uQlRhUjhSTXI1VVhl?=
 =?utf-8?B?MDNyTVV2S2M2UmE3MG95eFQxWStpSW5kR3BpcGo3TFdTSCs3T3U5V0lybW9S?=
 =?utf-8?B?ZGxzVDlNbGpHb2twSjJNSjlMRStzL0tvUzFGRDRhVTJMQVRoQXdNc1AvWUhL?=
 =?utf-8?B?RS81VU9rbnhXS2hkUTZHYzZhaUUzajRzMUZndzZkbmNyUUIrK2xVZUttMUpu?=
 =?utf-8?B?UndwdlJvT0lTa2xFTlFTWjV0YU1KUVAwdDNBWUZEVUVrQ3htellscjhkbzFP?=
 =?utf-8?B?R2NSUG05K0ZkMnRvekdaNVpjQ1lXZTUyTHJ1MEZic2RVL3QxcXlaRmVtbFY1?=
 =?utf-8?B?cVhRMFN0RmhtR2JBa3dYQ3FxMm44c2dmOC9xUVpDTU4ydXJCeHRhQnZqaC8v?=
 =?utf-8?B?TFZPVFkvdXN3cXRvWEhzM0srZnRUenlYNmVUbUx5bXlKZTM1eEN3RCs5emxo?=
 =?utf-8?B?QVcrS0ZGQlBNazhmOVdIUzdKOVhJQ0NoODYyRFpvUHRxOWhKdTVCaGRSdmZp?=
 =?utf-8?B?bUJaSEhqUnBZYU5uaVl4TjdBNVh4RnJCK3ErRENTUDN6eFlweG5tTm10SU9J?=
 =?utf-8?B?M2h0UWdzNHZNZ3NqV1ErUUhZemgzUXZSYjhIOG1nNzZmckVjWE55aStISzNt?=
 =?utf-8?B?YUFvcE5tMGErd201SUdSRlRvUk1kSHRmeDh2Q0o2MnlCQjNRRWdOSmJoSFda?=
 =?utf-8?B?RVZtdWhTVmpCbU5WcEFuVEhkbFFFbCtsLytYbVQ4K3Rjb1QzMWQremsxZDd5?=
 =?utf-8?B?MTNaSlhzNFRSNjZ2aVlSVmQ5a2dOSDdkV0xReTljWWdNaC9EdFl5ZnIzM3pj?=
 =?utf-8?B?bVZuK28zcndlQjJ5Q3l3UDR0cFB2WGVPeWFYNHZueDJ6UXpkM3lIZWNONVRK?=
 =?utf-8?B?VXo2OXRjc290Zk1sc09EcFJYK3JqMG1xeWRFTXg1YkdkMGw3dnYzb0JXVXpZ?=
 =?utf-8?B?bi9WQlJCQUxQYStKK2tPMkFDQ1dPS3lUd1ljL0JsVHpyVmxsLzFlVDFZb01v?=
 =?utf-8?Q?g7nme/OlCVOFHeqhEkb/dSdyD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92d644e-f01f-4b5a-c87b-08ddf65d8bc8
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:46:20.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01BwYhEbG0sGMIeJ3Db5uQmBJeCxG87LF6ZmZpxIUegEkYRjHkXIXWkw0CB3CGXDXRALj/+J1H63Eb8H+OHmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7423
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

On 09/17/2025, Maxime Ripard wrote:
> The imx-dc atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> To: Liu Ying <victor.liu@nxp.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/dc/dc-plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
