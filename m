Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D896B096
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 07:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B48F10E596;
	Wed,  4 Sep 2024 05:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b1fF7u0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3203110E596
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 05:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqqdP3xZ01C4Olw4bNooTSRwennLFdEousJy3/UK5SbrUpLZqsTJhoz/Xz+/0L9oO3RtZrvf1kX4vqQSny39HaRwtBI90WatCa9GnYE++mqob4VyvcD1f9QrLuG8UVd4rIerZ8npcIR7S3qU10BoCA2k56PnWLM25yrGcYiN9v8goEB5gFIpmY+y0mh+eT42cY42Zyhm1Mb2gVzSFJ2Q7kntTEV9r9RofUCPeeE+SgieKWhNOOvKQvvTm7H9eY3IDpXSrIxcfYffdYhFPTOuojS3k0xT/j1R9WfJArUVAhP4HzMeWszSAWsLpmuMkTMYMx1k4481w/LwgrHa/p9D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W++hHnw+xuwwamRgAAY3IniNRrfD8olDAxvuV75/JcQ=;
 b=Gx+VKHkh42/9Oi0PwIkaRbx6t4lLS4q7i+767cgC8zcp6weFPznlWJbJGtmb3f2zudaxu/61GZhvQjDViMmSSq7532MpLOewKo8U7wtMTEU7l2rR2MzsnlBEeA2JJQnDto1mF+0SrxD3RboicjbnSRDcdVQ9N36UJWkrBxYXkkId7kqeK4DhgGRMVB4Sc6Bo++0F73jey/a5+Bg+fGK5WU8C3oTmK5DncZQI0TN+sSOsBtOEZzSF6ydkUz/2P+V7ym6U6lFXR6GkKtzCQ8HR+d3z5Seqv9xvaJD5/I3MMm0vnQ9f8nmrDIor4gWqMXnmCx8epCT0hfB1hTyo2ZnKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W++hHnw+xuwwamRgAAY3IniNRrfD8olDAxvuV75/JcQ=;
 b=b1fF7u0ZbI70IFF+mwhisfeln83TJeP2V0vmnjyFFE0FrlIMQ0GRouZbLpxuGOF9vWxSHxj93vzG1KmyYEiC6m+1+YXDXKGufv6wkfI9jy9XHA7VCohXZtiqovFOzYrkgZqbSk+cINHcgMdk6Rvx/+YG4333Hn1DH5cHGqELlxe4QomRIMtTqcnaDACsaolFh/jqbw8LLw3bQc93wYV0XN+eeOF1EQ4pIUjZ9OTxivi1rnfuzWQ5d80U9LmcqXwtmRjGzmu+rCdg75fPujKI3GL4SE3QcJOTSKKL8FLkogc5uEeO2V6LNk9IuiAeGAA6zjCx6J3dRCiuxXdgDuftzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9050.eurprd04.prod.outlook.com (2603:10a6:10:2e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 05:39:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 05:39:44 +0000
Message-ID: <01b335a8-0802-453b-a792-ceb5c54a41aa@nxp.com>
Date: Wed, 4 Sep 2024 13:40:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
To: Paul Pu <hui.pu@gehealthcare.com>, p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: HuanWang@gehealthcare.com, taowang@gehealthcare.com,
 sebastian.reichel@collabora.com, ian.ray@gehealthcare.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240904024315.120-1-hui.pu@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe06645-b6a0-4ba5-fd56-08dccca3facf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1ovckdaN0MxVFVKQS9KSVhCazNpMTFDK1QyeVM3USt0MnRFTkRGNDhnUEVT?=
 =?utf-8?B?SUlEd0FZdzVqZkN4TWdTeUhOek90dDBZc3g1bjdPeEtIeDdqaElpOVFhMlBs?=
 =?utf-8?B?cGprT3hpSDUrQUpwUk1kVVlEamt2L255ZHpwK290QVVTUVI5QUlCRGZ0clJu?=
 =?utf-8?B?VXpLcXNBOGRDRGVka0RiYm1SY3E0K1RLNzNXR29ySkRxSWNUZlFETlBpeXlB?=
 =?utf-8?B?WXpubWFFY1NCbXo2MG55R3haVEwrUmh1cEt0ZFY4THRZa0dIUEgxTi9tQ2Rj?=
 =?utf-8?B?OTJsbktvdExpT1cxaklmb0JRK285Q1lMSEJCbFFRREE5RkZVdW0vQmJXbHVU?=
 =?utf-8?B?Sk0wWXRiNUpFaEl4N1RienhPT2JPS2wxZjNVeDdmQWx4NUNmdlZEdUt4UGp4?=
 =?utf-8?B?TkZQeWhEODhtZFJJd29RS0hTaW9WSWx6TjVTb05YZnBxL3ZtdXJlbldWenpD?=
 =?utf-8?B?V1djT1o5SU0yMU44YkZaVEU0eE1IR0x6aExpNjNXMk9BRk1wVWQ1K24wbWF1?=
 =?utf-8?B?U2xoY3Vid1RjVk11RGRpWUNTWms5ODRUb2NVcU1Ub0VOTHQyRDRLeDRGWFpi?=
 =?utf-8?B?RDhEUHpxT0E5dWxOeXFLcjNqODduUEc1UHZGdlhnaVpodlNLSU5Rc0hIMENE?=
 =?utf-8?B?WW54V2tzdjNzUjZaMldYR1FjSWRQSHVvWVZ2MHZVNU41c3ZQZzZVL0JiWWhx?=
 =?utf-8?B?UGxQeWZMbWFGMDhMeU5XcGlocHYvbXFXSkRFS1E5eVVIc3laSG5qd0hTSzJW?=
 =?utf-8?B?eGI3TnYyMEN5Z0JJT2ZYVHVhT0JwVnowL2NXcGFveVRrSUVLdW1YeHRWaWlC?=
 =?utf-8?B?MDJmSitsNGlMK2wwQ1NoMjVZUzBKNXlzQWt1WWVVSlA5K3QxZUk0TGp1Um44?=
 =?utf-8?B?UDZQRHhsc1ZwSlRZanBXbnlyMGdFYm9wMHYwQ2tkQldKSlNFZjVNRTRINUJ6?=
 =?utf-8?B?TGZiVG9nRlIvVUo5VlkxNVJTMTFTVWlLMVpza3Bhdm9nckQyVkZSWDNubDNT?=
 =?utf-8?B?cGhrVHBES3hUeG9TaFBQY0lpTlpJVXRFRkVlY1dDTjBzYXhmclBCN0NxWmdS?=
 =?utf-8?B?WGYyMFUwNVZpbFdMTCtNbllTZWJKbE5sWTdNeXdkN0xVZ09Ob2ZTWFBWd1k0?=
 =?utf-8?B?K3hGVk5WZWJMaG5iRzVVak5WcHlwLzNKbDFQbkdsd2lCTXlqOTRXKzRMNEow?=
 =?utf-8?B?NCtDMm0yM2o1dkhOaWdxaGh5NGd6VW1XUkErUDlISjhzTlM0cUNkTnJKUE9q?=
 =?utf-8?B?dWxkM3duTWZDTkE5MnlUUTFCOEgraDJRanRsNWpxdm9qcTN4cjVhdlBYbzZB?=
 =?utf-8?B?MytQcEU2NGFMQjRPREZ0Y2t2cFJlREd1Nlh0OWo0dXcxcmJhSTQ0em5vbE81?=
 =?utf-8?B?d09iSElKRHJrMmxrQnRBZi82aHp2RGZBRWl6VVA3Nks1UlpGZnN6YjB4M1Bp?=
 =?utf-8?B?ZHA1cmZ5REEzblk3VlhKb3NxT2xqaHRNRHo3WlY4NFNhUmJ4d3lBZXdmdkVV?=
 =?utf-8?B?UnJtOERrTFV6clBXOU5ZNzc5bVZUOUJoWWhOU0RuYmZHMUZ2ellpZ25FcE8x?=
 =?utf-8?B?dmx2NTZKVWFrQTNLK0dabGlkRVRqTjU0Q2c5N29nUndLTU5zWkxhTVk3a244?=
 =?utf-8?B?dVFzNm9USGZ1U2dhMWlMdnBjU3N0enN2VFdLUmFPQ2RNZUIwdloxWjFlN3Zn?=
 =?utf-8?B?cm00bEk5MS9tem9SU3lDSFIzamtBaVhPWXQwMTV3ZVV1cHZIcUduRU1QRlFG?=
 =?utf-8?B?TVFRYVBtV3VrT2ZrQm01cVllOG92SWZBZmtGbmwrQTdrbVhyWU5jaE5HeFBK?=
 =?utf-8?B?dE5zc3hvOXVYdVRwR0V0SzM5bnVXR3NFN3J5ekVYQW5LNWhrajAyRmtvZ25w?=
 =?utf-8?Q?XZwAgm/mM1Wjz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzhFN2prcTZqTDl0N3NqaGtzcmZadW5JblRONHdRZ0hqK3EvTU1wNUJNYTVj?=
 =?utf-8?B?RVNGOGRuU3R0RjNHQWVHYXM1Zmc3MXdHNzVybWs2NVA3VDZyY0xpajZ2eXN6?=
 =?utf-8?B?QkpFZE9XZGwxOXEzWXlYVmVlR1ROVFFFVWd6bFc4WE12ellXc3JjNnpxME1p?=
 =?utf-8?B?bWhLNWwxUDJmUXFKbE90UFdFODhqWEJueDFDSUxYN2l1b0ZOWUQ3NlJBeG5r?=
 =?utf-8?B?RExMeXVEYzlISmZ5d3BJaWkva1pCSjc1MlRZYWErWHUyZEl3dTgrT3E4eHVM?=
 =?utf-8?B?aGFmdkRuUW5QeDhWczZPSlE1c0dSVVlIQlAyUjFMc2VwZ3FJUGV3OFlBZk1k?=
 =?utf-8?B?SVJVMG9LZlpuTWdnMmFPNVg1VXA5MXZvWm9WaXdYeXFWNWh0Qjl0b1dUR0lx?=
 =?utf-8?B?eVNMUldtNThuSU5VZzR0ODBuVE5LVC9jbVJBRGF4aVpaSWlnS045Yk0rWDF0?=
 =?utf-8?B?d3BabW45VzhzQkNqN1BrWVF6dGlLYnhTOWN2R3EzcDFLUnVGQXJhQWlYMmpk?=
 =?utf-8?B?UTV0amNpQWx6cGlCQkNvMm1hcGhBbi9Ra1kvN2pOQVJpV1NMbnpIMDV3WWxG?=
 =?utf-8?B?ZUlnb2FobDQ5bUFDOWFnTmF4emFZT3BjVjF1dUxYT2hxYkplSTd1V014dHVs?=
 =?utf-8?B?NWtHL2Z1YkVhc2NaVDBST1RMK25Obi9ncWZRbVV1alREVjFhem50WnFiT2dm?=
 =?utf-8?B?c3RJNk5Mb0ZjbEtnWkk1bmx3OU5yZE5DenlaNEFzaG9uR1JMeGEzVDRqaEt2?=
 =?utf-8?B?bFd5cnh3Tjc0cUpLWmJpYzFFaFpiSFlUN1RrTm50OHNiVHBqRktHbmtTRmNI?=
 =?utf-8?B?RlkyWVJyUTRIRjhmd05idEpLb3JWRUtNN0NLcHBjcVBzZExTY0s4RXJQTnFq?=
 =?utf-8?B?SVJJM3J6VU51bG1rYzBKM1RtazkvdWxkNFdMelJCSEpCdWdwRmdQRjhEcHQ4?=
 =?utf-8?B?NEJlTUFFV1Rla2dsekVYei9naDE2NVU5OWsySCsyWnVXQzRuRUxHY2RMWFRk?=
 =?utf-8?B?clFkdENzU29LS1J2dlRJOFF3RE1vTnNCN0F5ZHp0WGVHcFZNamRYTnA1Ky9Y?=
 =?utf-8?B?bmY0NG1zOXZlenoxS2VtajViTjZ2ZGw4RzZnczBRY25TWFo4MUxOYy9lZlR5?=
 =?utf-8?B?QzFOeE4zaEJFeTZsYm5qc3hDYTJUaGRsbjFoRXFwbDNnZTd5QllPYnI4U0RL?=
 =?utf-8?B?aVNlcStraU1GcEVaZDhZMG9rUHhlUEZ3TDhVdXVZeG1DOW5IWDRLV0dFZ3Zo?=
 =?utf-8?B?YVVPczNDdDdWUUdzaTRhK3hNelVDVVhGSkZveC9FQitGRzVVenorc3h0VFdS?=
 =?utf-8?B?dkRidEwxNkVOTmtVRWRaQ09VWVg4YUtWV2hiR3VzWWtQYkJxN2xnVVpMRkgx?=
 =?utf-8?B?MVRuaERjZE5IUjljd2drK3VtTE9DZ3pRaG5iL3RQdnNCdVVxUDhhWVloM1Jw?=
 =?utf-8?B?OG1YZlJ3d21yaktJMyt0c2RNVmJLN2VkSU94WWlYSkpzbGE2M2NPS2VnblEy?=
 =?utf-8?B?TW9taDdnWmdnSXllcFFoT0RZVGR0Zm05bUZQOGZwNmFpZjRZSDlYeWptdGlx?=
 =?utf-8?B?TGladndFcjNsaUEyOVRJSGJVMWpMVXFZT0pxc05JMzZ1UW5kTXNBc3pGNDBo?=
 =?utf-8?B?cHo1d3pDOXZXTnAvL1UwSXBPenQ2R0dSM2pPMFFmYlNUWUJUT2pWZzJieU1E?=
 =?utf-8?B?RStMZW1XMk1tdFR0QmZFUGc5amRKbFJDSjhuRDZYRVlrbnZWYkwrTldJN2Fs?=
 =?utf-8?B?V1hIaExmVXFzZm1SQVRuamwrVGdvT0tIMk5TcGVuL2lPNklQcUxnUkRKVEVW?=
 =?utf-8?B?VWp6VHJzeVRlbUM5QnFXdFpzMmV2Mk5lY0JBeFVobk9rUEVBY0JERW9kSzJq?=
 =?utf-8?B?SlRiM0Jpa1lpczY0WXoyVklqeFo0WGQ5RWEvSmN4cjNMNjNKR2RqREVTSDVn?=
 =?utf-8?B?bS9reFVWQTU3VnA0M3k1ZjNVN2doTys0ZGlldGlHZnBXV3h4dEtaZkNQbWVY?=
 =?utf-8?B?RFUxbkpRM0krRlpDRUI3cksycGVWbE43bGxBMFZKeVVWZ1FNK05KcVlFLzFD?=
 =?utf-8?B?dk81YnFmbEl2WWdVV2Jsb3RqVmRxcHg3QUlLcGpLdnBwbjVlbGkvdnRXN052?=
 =?utf-8?Q?iNXlxHgREQ8DwhlKtposLTfNr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe06645-b6a0-4ba5-fd56-08dccca3facf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 05:39:44.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDYVZ8de9GD1tWUP3OQ+gyN/aK3WabKRle0JXl0zf3MiY0X6xe4yyDeXDZXCwNtfwZShvcyIfb+lG0MXijMSkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9050
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

Hi Paul,

Thanks for your patch.

On 09/04/2024, Paul Pu wrote:
> This changes the judgement of if needing to round up the width or not,
> from using the `dp_flow` to the plane's type.
> 
> The `dp_flow` can be -22(-EINVAL) even the plane is a PRIMARY one.

s/even/even if/

> See `client_reg[]` in `ipu-common.c`.
> 
> [    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22, possible_crtcs=0x0
> 
> Per the commit message in commit: 71f9fd5bcf09, using the plane type for

Commit 71f9fd5bcf09 is a commit that only exists in downstream kernel.

> judging if rounding up is needed is correct.
> 
> Fixes: 71f9fd5bcf09 ("drm/imx: ipuv3-plane: Fix overlay plane width")

Commit 4333472f8d7b is the one to fix in upstream kernel.

s/71f9fd5bcf09/4333472f8d7b/

> Cc: stable@vger.kernel.org

Better to mark the versions for backporting the fix.
Cc: stable@vger.kernel.org # 6.3+

> 

No blank line between tags.

> Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Maybe, the patch subject can be something like:
drm/imx/ipuv3: ipuv3-plane: Round up plane width for IPUV3_CHANNEL_MEM_DC_SYNC

You may find example patch subject prefixes by looking at previous commits
which touch the same file, like
commit 71e3657cb126 ("drm/imx/ipuv3: ipuv3-plane: reuse local variable height
in atomic_update")

You may specify those fixed odd screen resolutions of your "HDMI" case in commit
message.

> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> index 704c549750f9..cee83ac70ada 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> @@ -614,7 +614,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  		break;
>  	}
>  
> -	if (ipu_plane->dp_flow == IPU_DP_FLOW_SYNC_BG)
> +	if (ipu_plane->base.type == DRM_PLANE_TYPE_PRIMARY)

plane->type is more readable. 

>  		width = ipu_src_rect_width(new_state);
>  	else
>  		width = drm_rect_width(&new_state->src) >> 16;
> 
> base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6

-- 
Regards,
Liu Ying

