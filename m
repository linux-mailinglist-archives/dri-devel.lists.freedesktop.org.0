Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D276AACF782
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EF310E33E;
	Thu,  5 Jun 2025 18:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CAN01-YT3-obe.outbound.protection.outlook.com
 (mail-yt3can01on2101.outbound.protection.outlook.com [40.107.115.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B310E7CF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktmABRNcAvSHIMko9HchSOXR8lFzElNhT6g7tTk8TQrKRjahFDW89D5U3jZyecso8Xju93rUWplKZPqUfLN69DkEW/2PrYRdecHd7FbPSq81t8vIyk3259ybqU/qlT2WXmJk+5xjWIaGLIE60IOV7cQ1c1aXhd+Bcl+FoAGXocULpYo2gfWL+BSY+/6lDxCJ7Hbut5Kmm61r1Petp+mlDov0bRJKagUgEdUVnlCgyCJfe1Dexeq28lePmgaFt8KV3CYTrAz/n6d3nKTEKkgGEe/GbiBpxTstfmuiOv/Cw0o0p7quTs8V1jDTR4qUAOr09NCPe/mFTlzBhtDjDZXivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOPm8rIVRS6TLhBy4Qe0l51IZ6z50lYLB6oljLFAFMY=;
 b=nZQquvC4IDtdQP2s3eH6pGiA0fkg5h9g/r50T8V7BmHJCFGo5Jr/5d5bIrIEGI3o2tlrxMaz68YtaikiRNwuy7X0Fa4e9c611UBnZ09csvFs4CjiSwEuSKKVb5IJIUpIeAKxiye1s2KS3czJohNZIbsYcHeHQI3iwKvMVoyPnvWLKgaUOC69zPD6CKcl2nqJm9S/15r7b34jaXQczbjmKzLiEnYKnTO5iaTI6kJDKY9FV8I9d5drPdNRyp52Fpl/q4hKL26pmRwVRr0Dw/v2xCM+WuYqEVspSlvlR6MK8MGo0F+EFXdvXfEcK+XyxKn8WqLXDQQI3sDzc5WYwhpnSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dimonoff.com; dmarc=pass action=none header.from=dimonoff.com;
 dkim=pass header.d=dimonoff.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dimonoff.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOPm8rIVRS6TLhBy4Qe0l51IZ6z50lYLB6oljLFAFMY=;
 b=CuOWop+ZF+5HG14HXq3OQY5yBCV6bgDr0D0TgDfeMthnDjlyS9XvYT1IjR4Bpzb8XcQ9Hoo3c7bI0phD3dkedSVPx+aPDIvkjlj9NROvw4p9/m8qxoDzLXMyI6Mt4x10kF2hG2hW2sjR2cTkCY6Vlj5B/ElZ3yIqMAPxmP10UKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dimonoff.com;
Received: from YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:28::5)
 by YT4PR01MB9877.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:38:05 +0000
Received: from YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7c39:4edb:65a:520a]) by YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7c39:4edb:65a:520a%4]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:38:05 +0000
Message-ID: <03072c2b-2459-4d8a-9a84-c450f33f9350@dimonoff.com>
Date: Thu, 5 Jun 2025 09:38:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host
 transfers
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Hugo Villeneuve <hugo@hugovil.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>
References: <20250604145306.1170676-1-hugo@hugovil.com>
 <20250604145306.1170676-2-hugo@hugovil.com>
 <TY3PR01MB11346884D4BBC705AB64801B0866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
In-Reply-To: <TY3PR01MB11346884D4BBC705AB64801B0866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0169.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::12) To YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:28::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB4266:EE_|YT4PR01MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5d2145-927b-4d81-a0ca-08dda436334f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTM0Y09CbXVHTzVvcXpsZko0bjZpSGRjcWZ1eWZFVXFFU1ZMU1hLVHY0VjVT?=
 =?utf-8?B?OEcvVDlrMjd6YzNKTVBQRnhMR0ZweklhVkRyeEVmL2dCVXB3L3BaSFBNVEtR?=
 =?utf-8?B?akpCekFKSyt1TDFCa05IdVdNNkEzY0twZUxqNG5nNWtEaG42ODc3TTZhWC80?=
 =?utf-8?B?WUZySWpVcmdwWU9CS2F1ZzF5V2h0RFFVdFA0K1A4QThkaHMycXFKc0pkalY4?=
 =?utf-8?B?MGlNdXB6Vm5nSW9OSjdyNVpNTkZ6bHRJL0VpVnloOE9BRFZjeGNHVzhSTnF3?=
 =?utf-8?B?TkpPd1JmcEN0UEhjTGt5ZGZjb2R3emVOSStsNHI4VWN1TGR0TUhPdnVldVlL?=
 =?utf-8?B?L0hHTU5rdnhJUXFIclFnY0tmYkRJamNvdE5sOHJhNzVKczIxeDRRN0Fxa2U1?=
 =?utf-8?B?RXRFaEhlbkFlRkt3aHMzT2Z5d1ByaXhDRnNjRjYyNis2NCtQMWNpc3MxQ3l2?=
 =?utf-8?B?dm44NlJRdlV4NU5MeDlJNUJBWjZja2pTTXNpcGlDMmRleUhRUTdSYkN1UGtY?=
 =?utf-8?B?d0FCL2ZTZ3NvT3BlWkNpRnI2ZTkzZ3J5Zm9jZEpLSEtFa0pwQW9yOFErSUty?=
 =?utf-8?B?Z3hMWlVjc1ZFUWgxd0hSdEYrZDhqSEdmSlI1U0doNThXQytXUlhkMFl1UkYx?=
 =?utf-8?B?V2k2b3YwN3I2OHFyZWx4bjB6eHkxUlYwbFVFdGpDWTlnNTc4UDNSeUREMHdJ?=
 =?utf-8?B?QmVDeVBQZ0pGOGVEL20yOFprU2xFazZiRElTRURGbGJsbkVsRGVBTnUwaVJU?=
 =?utf-8?B?OXBIQ1NhcXVndnJLcG03d2gwU3JTZlQvVzkzL0l1a2xhSVVEbG5jaGFGY3Jn?=
 =?utf-8?B?eEFYbE1oNGFBd1VvcDZZcWVZSHQyRTVOc2V2c2JESExKZ2tYYytoL09qaFY0?=
 =?utf-8?B?cEJGNk9ncXIwY0l4TFNZQ0lzTlFGOVY2ZlVPTUxWYkZXOERpM3JNZlZCdlg4?=
 =?utf-8?B?d0R2Y3B5a3pEZ0J3OEl0NDNQaVNveFpkYklyWHFTejdmS1pkTm90RllTZytI?=
 =?utf-8?B?d2NmQnRvVGNCbGhzVEF1b0lPMjFUWWZQTWVTS1pPTWxkb3JpdXgzVXJyVTZZ?=
 =?utf-8?B?WUQyNVVzcU93THJZRnpyZE94MUI4YjdGK2FmN3g2T3V1VDU2YnFDMDZ2di9k?=
 =?utf-8?B?UU5XOVJkSlpNRmVnQXJmR0dKT3JROU1wZzlFS3NFNk5qaDlRdVJFK1VzVFE4?=
 =?utf-8?B?ZlBudm04TE1nWVNBbDRwUlRHc0FZUkRRblhrOHV0Y2xjTjUwTzJtNHNlaURT?=
 =?utf-8?B?VHYzRytpOHlWUWdxZk02UE5lbC9hd1lNc09uNzFrQ3RTZzhEZGFMSlFLR3hU?=
 =?utf-8?B?RllJSjBIMkV1bVdaaHpFNWQ2OWZzbkY0eXM3ZlJYNEY4TjIzcHVkSWdvK3pD?=
 =?utf-8?B?QUR2eEJjd2VnczF0enYwL3hic09sMlNlQ0RXUWpWemZnUG5rYzVZeUc1K1Bp?=
 =?utf-8?B?c0lBZUpTUmVKQ2xTb0dZVFJNeTNvZklRSFhJTlB6Wm50Z3JkTXV6T3lWSVNx?=
 =?utf-8?B?WHpMT29mdGZrM2hUdUxVN2QxUURoTVVLOE4yNGVDb2NmVWlYZWt1SzE0L013?=
 =?utf-8?B?UHE0TVpmb0RkK1VMQm1xWTNsc0NzQ1ZESzlEdjlqVGorUHRCWFJsOWZMMmE5?=
 =?utf-8?B?dm0zSjdrZTdFeVhCUThOOGtmYktFL09ncExlVDh6L2tUK3ZCcGN6b0tUQ0Zo?=
 =?utf-8?B?blpkc1dJZ3praytDc1Nmc1V2S2gveHIzQjdiRnRNSnJZdWNreDdTejJCNFR3?=
 =?utf-8?B?OXROL0FqNFhEVVBkRXNJOC9DdEhuM1lFdGNLeWdQYndiRGswYWhIQmxsTWs4?=
 =?utf-8?B?R2owd1ZpU1cyWWhWZC94OWhreVRPcFE3Y0Z5KzRRQW9IVGV3eXNLbGlGWnBV?=
 =?utf-8?B?aFNpSDU4ZkJINzdvbXREQWkxekRwZGRxVEtMaUNXdmRLWTBkS0Z1c2tNZmJl?=
 =?utf-8?Q?dxPs8ypijvQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGlmbmFqZnFWSll6cUJUOTZjRWZCY3ZEY0gyV0VKWGZSUUZFalNqSkdXaXFD?=
 =?utf-8?B?T2gyc2hGSnlHK0JnZHNuakhTMjRzcldNcDF5Ky9JTUdzMVlReEFBYXpZMmY4?=
 =?utf-8?B?U3p5UzUwWjByNlcyRFdURzB3Z0Y3RGlOdWFLdTNOSUozSm9wUWJVc2Zla2JZ?=
 =?utf-8?B?SHFMQlpvNGh1b2pUM2lZU1pCVjNqRjhkTjJmaGdxaVh5MTVyU2VPa2kzSDVF?=
 =?utf-8?B?dXhlQ3YyeFhEYkhnWHNYYVpxTDM2TVczSEV1WlQ0dWR5MkxqallROFQ3VW5K?=
 =?utf-8?B?SU9FR2xqRjVOSjVpakp1YzBOOXdscjJZMG1XOFBBT0Z4cG5JZTRkTmxCcndq?=
 =?utf-8?B?ZmhHbjkyaG5SWTNlN1lTaDlJeWRQSU1DeHd2YnRrMTR1WkxOVG5vVDRyRmJ2?=
 =?utf-8?B?T2FUcmlDU2dwOE11OTAyT2N2bmh1QXJycmN2RHE3clFaWEtTUmp4V1VoM1d1?=
 =?utf-8?B?Z0x2ZzlMbkRCVEQ3aUJVcFZRTGdyZ2ZxODd3azhXMUNDTlloMU90U2hDd2FX?=
 =?utf-8?B?akx2UStMOWRNODZRQnhPVEUyTEVETFUzQy9sdGtyT2gwNkFPQk1hZnVWZjZU?=
 =?utf-8?B?YjNTT0tPclZiV3ZxeUpueVBOREJVNVJ2cjlZaW9oNmlkZDBpYlI0RTZwY1RL?=
 =?utf-8?B?RjhVV2QzQndsSys5Mml5VnBOVmRzWFZncmNSMEZRMjVqcXNiZUZ2NWtNSmcv?=
 =?utf-8?B?a09KUzNvNXRJNktNK2pVTnBNQnNHb0JuUVFFSUt4dkdBeUhRa3p4VWlldU5Q?=
 =?utf-8?B?YUVSOTl1TVMzcEpLS0FONkE1b2NmbHl5dmViRjUzSnhpQ29iT0hGQXB0MzFF?=
 =?utf-8?B?SldyY09QQTgvVWtwNVZpVmxWbDlIUWh2clNheEJPOXJkbG5UOEh3MzRSdjV1?=
 =?utf-8?B?UGpwYnlsMzMzQlZhSy9YZ0NZR0RQc3VUY1FyZmtqbEVEOXhwTjEwd3FoRnhi?=
 =?utf-8?B?OFFzdFhqZnpiNE9QRzNKSTZKQkpPVjJWZmMxUzJxKytPQVJJaFI2WTdTN3Z2?=
 =?utf-8?B?bkh4UjcxYmJ3NXo2RTQza01MaTlVMnU5WU1iNGEyZ3ovSE11N1R2RXIxVk5n?=
 =?utf-8?B?Mk5SRk51Sk9OZTlRWUFoYVZDd285Y0l2Z2YwNDUrMFdHSUVMVWdSaVc3S0Yz?=
 =?utf-8?B?VUtrZFRFbHRkNXl4bTJDTXA0UjhoekhnZnlWeGt6TXZKWHJqMWtNYkZBdjdQ?=
 =?utf-8?B?TjViMi93UmxRWW5uR3pQMzczZ2plL0JMY3dYV0ozY2ZqdHYzR0cyYXdDRGtz?=
 =?utf-8?B?VkFUeUJJY0Z1NmRiSEwwVEF3VGJwNGNQYXpUa1ptSjBkVjlhT01ZTVFya2Vl?=
 =?utf-8?B?Z3h3SFArYU9ZZUt0ZGs2MXZQZTA3dThMOEc4dW5EQjBaSmZ5Sk8ydkR3OVFp?=
 =?utf-8?B?MFg5UUR3QjliSlluTE13dnhseENKeEdtRkZGSStVMlF6VFh1KzB5WDVpK0Na?=
 =?utf-8?B?Mkg0Zklsejd0bUwwYzVtVWpOVFdOWnJnN1FUUExEN0hBcGlYR1N6cTBGenJl?=
 =?utf-8?B?MzUyaFVJRVNaQVVrR3BpQ1VKYTdocHluSExySDFvanV2SUhOWnkxSVNHY2g0?=
 =?utf-8?B?blpTOE5ZYTM0ZjJSc1VJRWorZjdHR0dzeGZlRStJMS9zUGhYZUtZMjhTeTdJ?=
 =?utf-8?B?NFhTV01pSWhqVjgwb0NGcGV5WEZRRmhqck5zcFZTaDNvZWF3L0k3UjhKTUlC?=
 =?utf-8?B?TklJN3FubGl3WWEzWHNZZjlkTG9GeldCZDNCTTNPMWpvVEh4bThxWldTOUpW?=
 =?utf-8?B?ZVBaYmk5TWxIU0lLenA2c0NrZlo2aklLQWR6MlBybG1sczFxVHBieHU0UWpJ?=
 =?utf-8?B?YjF1RnR0a21tdEExNGgxT0trVjAzVDcvK1U4clJXNU4xYzJtRk1TMnQ5cEJv?=
 =?utf-8?B?bnpQWW9uYkVqM0NDVFhSWjFlekxTbkJiZkh4TW5ITis0S1krbG82ZWFlUHYw?=
 =?utf-8?B?RFRTV1hFcUFIaGdlZnR5VWFJdlNndkJNdDVGT01OQjJoTjJHVzFXcmRtZ0p5?=
 =?utf-8?B?T2N5OHordkh4K1VlQVlSakx2Q3l5MFdDVlF3Vk9DYkxHb0FWdVVXZVlsbkZ4?=
 =?utf-8?B?amEyT2dyd1ptZEU5ZnE1NW1XLzRWNkNzakpuRTBUU0pwRncwcE1iekptZWFh?=
 =?utf-8?B?Tm44SGZSYnoybkdWRFVOeDAzczhqa0xmUEFDVGRqMkFYNmVqMmpjTncyZ0l6?=
 =?utf-8?B?VXVZcHNjb0RYRnBZdGJwazdxU0FLWXlLSFE1d0FwUUhLZ01BbVZ0VkUxV3NB?=
 =?utf-8?B?R1lXNzZxRzlheGpvcXUyLy9IK0tBPT0=?=
X-OriginatorOrg: dimonoff.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5d2145-927b-4d81-a0ca-08dda436334f
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB4266.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:38:05.3838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c4063547-e5e6-4866-a386-58c3965da102
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7/Lu6ISxU0ZUyloNUM14gT+IcanscRgt29+Tx8DoCe3xwUKXMvFG3j0nxdDQm+4KJ+yVPqQ/CEG+SpR/lY8fY+dRMl+fih0OKOmI4XhpKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB9877
X-Mailman-Approved-At: Thu, 05 Jun 2025 18:53:56 +0000
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

On 6/5/25 04:18, Biju Das wrote:
> Hi Hugo,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hugo Villeneuve
>> Sent: 04 June 2025 15:53
>> Subject: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host transfers
>>
>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>>
>> Add support for sending MIPI DSI command packets from the host to a peripheral. This is required for
>> panels that need configuration before they accept video data.
>>
>> Also for long reads to work properly, set DCS maximum return packet size to the value of the DMA
>> buffer size.
>>
>> Based on Renesas Linux kernel v5.10 repos [1].
>>
>> Link: https://github.com/renesas-rz/rz_linux-cip.git
>> Cc: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> FYI, Checkpatch is complaining about duplicate signature.
> I can fix this while applying,if there are no more comments for this patch.
> 
> I am seeing below duplicate tags with your patch now.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Tested-by: Chris Brandt <Chris.Brandt@renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> $ scripts/checkpatch.pl --strict 0001-drm-renesas-rz-du-Implement-MIPI-DSI-host-transfers.patch
> WARNING: Duplicate signature
> #19:
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hi Biju,
I don't know how this is possible, considering that the patch I sent 
(https://lore.kernel.org/all/20250604145306.1170676-2-hugo@hugovil.com/) 
  has only this:

---------------
Link: https://github.com/renesas-rz/rz_linux-cip.git
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---------------


> total: 0 errors, 1 warnings, 0 checks, 306 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or --fix-inplace.
> 
> 0001-drm-renesas-rz-du-Implement-MIPI-DSI-host-transfers.patch has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>        them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> 
>> ---
>>   .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>>   .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>>   2 files changed, 240 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_mipi_dsi.c
>> index 91e1a9adad7d6..50ec109aa6ed3 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> @@ -4,8 +4,11 @@
>>    *
>>    * Copyright (C) 2022 Renesas Electronics Corporation
>>    */
>> +
> 
> Normally, changes like this should reflect in commit message.

This is linked to the new #include, so this is why I didn't add a 
separate changelog entry...

Hugo.


> 
> Cheers,
> Biju
> 
>> +#include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/module.h>
>> @@ -23,9 +26,12 @@
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <video/mipi_display.h>
>>
>>   #include "rzg2l_mipi_dsi_regs.h"
>>
>> +#define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
>> +
>>   struct rzg2l_mipi_dsi {
>>   	struct device *dev;
>>   	void __iomem *mmio;
>> @@ -44,6 +50,10 @@ struct rzg2l_mipi_dsi {
>>   	unsigned int num_data_lanes;
>>   	unsigned int lanes;
>>   	unsigned long mode_flags;
>> +
>> +	/* DCS buffer pointers when using external memory. */
>> +	dma_addr_t dcs_buf_phys;
>> +	u8 *dcs_buf_virt;
>>   };
>>
>>   static inline struct rzg2l_mipi_dsi *
>> @@ -267,6 +277,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>>   	u32 clkbfht;
>>   	u32 clkstpt;
>>   	u32 golpbkt;
>> +	u32 dsisetr;
>>   	int ret;
>>
>>   	/*
>> @@ -328,6 +339,15 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>>   	lptrnstsetr = LPTRNSTSETR_GOLPBKT(golpbkt);
>>   	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
>>
>> +	/*
>> +	 * Increase MRPSZ as the default value of 1 will result in long read
>> +	 * commands payload not being saved to memory.
>> +	 */
>> +	dsisetr = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
>> +	dsisetr &= ~DSISETR_MRPSZ;
>> +	dsisetr |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
>> +	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
>> +
>>   	return 0;
>>
>>   err_phy:
>> @@ -659,9 +679,168 @@ static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
>>   	return 0;
>>   }
>>
>> +static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
>> +					    const struct mipi_dsi_msg *msg) {
>> +	u8 *msg_rx = msg->rx_buf;
>> +	u8 datatype;
>> +	u32 result;
>> +	u16 size;
>> +
>> +	result = rzg2l_mipi_dsi_link_read(dsi, RXRSS0R);
>> +	if (result & RXRSS0R_RXPKTDFAIL) {
>> +		dev_err(dsi->dev, "packet rx data did not save correctly\n");
>> +		return -EPROTO;
>> +	}
>> +
>> +	if (result & RXRSS0R_RXFAIL) {
>> +		dev_err(dsi->dev, "packet rx failure\n");
>> +		return -EPROTO;
>> +	}
>> +
>> +	if (!(result & RXRSS0R_RXSUC))
>> +		return -EPROTO;
>> +
>> +	datatype = FIELD_GET(RXRSS0R_DT, result);
>> +
>> +	switch (datatype) {
>> +	case 0:
>> +		dev_dbg(dsi->dev, "ACK\n");
>> +		return 0;
>> +	case MIPI_DSI_RX_END_OF_TRANSMISSION:
>> +		dev_dbg(dsi->dev, "EoTp\n");
>> +		return 0;
>> +	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
>> +		dev_dbg(dsi->dev, "Acknowledge and error report: $%02x%02x\n",
>> +			(u8)FIELD_GET(RXRSS0R_DATA1, result),
>> +			(u8)FIELD_GET(RXRSS0R_DATA0, result));
>> +		return 0;
>> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
>> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
>> +		msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
>> +		return 1;
>> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
>> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
>> +		msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
>> +		msg_rx[1] = FIELD_GET(RXRSS0R_DATA1, result);
>> +		return 2;
>> +	case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
>> +	case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
>> +		size = FIELD_GET(RXRSS0R_WC, result);
>> +
>> +		if (size > msg->rx_len) {
>> +			dev_err(dsi->dev, "rx buffer too small");
>> +			return -ENOSPC;
>> +		}
>> +
>> +		memcpy(msg_rx, dsi->dcs_buf_virt, size);
>> +		return size;
>> +	default:
>> +		dev_err(dsi->dev, "unhandled response type: %02x\n", datatype);
>> +		return -EPROTO;
>> +	}
>> +}
>> +
>> +static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
>> +					    const struct mipi_dsi_msg *msg) {
>> +	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
>> +	struct mipi_dsi_packet packet;
>> +	bool need_bta;
>> +	u32 value;
>> +	int ret;
>> +
>> +	ret = mipi_dsi_create_packet(&packet, msg);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Terminate operation after this descriptor is finished */
>> +	value = SQCH0DSC0AR_NXACT_TERM;
>> +
>> +	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
>> +		need_bta = true; /* Message with explicitly requested ACK */
>> +		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
>> +	} else if (msg->rx_buf && msg->rx_len > 0) {
>> +		need_bta = true; /* Read request */
>> +		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_READ);
>> +	} else {
>> +		need_bta = false;
>> +		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NONE);
>> +	}
>> +
>> +	/* Set transmission speed */
>> +	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
>> +		value |= SQCH0DSC0AR_SPD_LOW;
>> +	else
>> +		value |= SQCH0DSC0AR_SPD_HIGH;
>> +
>> +	/* Write TX packet header */
>> +	value |= FIELD_PREP(SQCH0DSC0AR_DT, packet.header[0]) |
>> +		FIELD_PREP(SQCH0DSC0AR_DATA0, packet.header[1]) |
>> +		FIELD_PREP(SQCH0DSC0AR_DATA1, packet.header[2]);
>> +
>> +	if (mipi_dsi_packet_format_is_long(msg->type)) {
>> +		value |= SQCH0DSC0AR_FMT_LONG;
>> +
>> +		if (packet.payload_length > RZG2L_DCS_BUF_SIZE) {
>> +			dev_err(dsi->dev, "Packet Tx payload size (%d) too large",
>> +				(unsigned int)packet.payload_length);
>> +			return -ENOSPC;
>> +		}
>> +
>> +		/* Copy TX packet payload data to memory space */
>> +		memcpy(dsi->dcs_buf_virt, packet.payload, packet.payload_length);
>> +	} else {
>> +		value |= SQCH0DSC0AR_FMT_SHORT;
>> +	}
>> +
>> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
>> +
>> +	/*
>> +	 * Write: specify payload data source location, only used for
>> +	 *        long packet.
>> +	 * Read:  specify payload data storage location of response
>> +	 *        packet. Note: a read packet is always a short packet.
>> +	 *        If the response packet is a short packet or a long packet
>> +	 *        with WC = 0 (no payload), DTSEL is meaningless.
>> +	 */
>> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0BR,
>> +SQCH0DSC0BR_DTSEL_MEM_SPACE);
>> +
>> +	/*
>> +	 * Set SQCHxSR.AACTFIN bit when descriptor actions are finished.
>> +	 * Read: set Rx result save slot number to 0 (ACTCODE).
>> +	 */
>> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0CR, SQCH0DSC0CR_FINACT);
>> +
>> +	/* Set rx/tx payload data address, only relevant for long packet. */
>> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0DR, (u32)dsi->dcs_buf_phys);
>> +
>> +	/* Start sequence 0 operation */
>> +	value = rzg2l_mipi_dsi_link_read(dsi, SQCH0SET0R);
>> +	value |= SQCH0SET0R_START;
>> +	rzg2l_mipi_dsi_link_write(dsi, SQCH0SET0R, value);
>> +
>> +	/* Wait for operation to finish */
>> +	ret = read_poll_timeout(rzg2l_mipi_dsi_link_read,
>> +				value, value & SQCH0SR_ADESFIN,
>> +				2000, 20000, false, dsi, SQCH0SR);
>> +	if (ret == 0) {
>> +		/* Success: clear status bit */
>> +		rzg2l_mipi_dsi_link_write(dsi, SQCH0SCR, SQCH0SCR_ADESFIN);
>> +
>> +		if (need_bta)
>> +			ret = rzg2l_mipi_dsi_read_response(dsi, msg);
>> +		else
>> +			ret = packet.payload_length;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
>>   	.attach = rzg2l_mipi_dsi_host_attach,
>>   	.detach = rzg2l_mipi_dsi_host_detach,
>> +	.transfer = rzg2l_mipi_dsi_host_transfer,
>>   };
>>
>>   /* -----------------------------------------------------------------------------
>> @@ -779,6 +958,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>   	if (ret < 0)
>>   		goto err_pm_disable;
>>
>> +	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
>> +					       &dsi->dcs_buf_phys, GFP_KERNEL);
>> +	if (!dsi->dcs_buf_virt)
>> +		return -ENOMEM;
>> +
>>   	return 0;
>>
>>   err_phy:
>> @@ -793,6 +977,8 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)  {
>>   	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
>>
>> +	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
>> +			  dsi->dcs_buf_phys);
>>   	mipi_dsi_host_unregister(&dsi->host);
>>   	pm_runtime_disable(&pdev->dev);
>>   }
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_mipi_dsi_regs.h
>> index 1dbc16ec64a4b..26d8a37ee6351 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> @@ -81,6 +81,20 @@
>>   #define RSTSR_SWRSTLP			(1 << 1)
>>   #define RSTSR_SWRSTHS			(1 << 0)
>>
>> +/* DSI Set Register */
>> +#define DSISETR				0x120
>> +#define DSISETR_MRPSZ			GENMASK(15, 0)
>> +
>> +/* Rx Result Save Slot 0 Register */
>> +#define RXRSS0R				0x240
>> +#define RXRSS0R_RXPKTDFAIL		BIT(28)
>> +#define RXRSS0R_RXFAIL			BIT(27)
>> +#define RXRSS0R_RXSUC			BIT(25)
>> +#define RXRSS0R_DT			GENMASK(21, 16)
>> +#define RXRSS0R_DATA1			GENMASK(15, 8)
>> +#define RXRSS0R_DATA0			GENMASK(7, 0)
>> +#define RXRSS0R_WC			GENMASK(15, 0) /* Word count for long packet. */
>> +
>>   /* Clock Lane Stop Time Set Register */
>>   #define CLSTPTSETR			0x314
>>   #define CLSTPTSETR_CLKKPT(x)		((x) << 24)
>> @@ -148,4 +162,44 @@
>>   #define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
>>   #define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
>>
>> +/* Sequence Channel 0 Set 0 Register */
>> +#define SQCH0SET0R			0x5c0
>> +#define SQCH0SET0R_START		BIT(0)
>> +
>> +/* Sequence Channel 0 Status Register */
>> +#define SQCH0SR				0x5d0
>> +#define SQCH0SR_ADESFIN			BIT(8)
>> +
>> +/* Sequence Channel 0 Status Clear Register */
>> +#define SQCH0SCR			0x5d4
>> +#define SQCH0SCR_ADESFIN		BIT(8)
>> +
>> +/* Sequence Channel 0 Descriptor 0-A Register */
>> +#define SQCH0DSC0AR			0x780
>> +#define SQCH0DSC0AR_NXACT_TERM		0	/* Bit 28 */
>> +#define SQCH0DSC0AR_BTA			GENMASK(27, 26)
>> +#define SQCH0DSC0AR_BTA_NONE		0
>> +#define SQCH0DSC0AR_BTA_NON_READ	1
>> +#define SQCH0DSC0AR_BTA_READ		2
>> +#define SQCH0DSC0AR_BTA_ONLY		3
>> +#define SQCH0DSC0AR_SPD_HIGH		0
>> +#define SQCH0DSC0AR_SPD_LOW		BIT(25)
>> +#define SQCH0DSC0AR_FMT_SHORT		0
>> +#define SQCH0DSC0AR_FMT_LONG		BIT(24)
>> +#define SQCH0DSC0AR_DT			GENMASK(21, 16)
>> +#define SQCH0DSC0AR_DATA1		GENMASK(15, 8)
>> +#define SQCH0DSC0AR_DATA0		GENMASK(7, 0)
>> +
>> +/* Sequence Channel 0 Descriptor 0-B Register */
>> +#define SQCH0DSC0BR			0x784
>> +#define SQCH0DSC0BR_DTSEL_MEM_SPACE	BIT(24)	/* Use external memory */
>> +
>> +/* Sequence Channel 0 Descriptor 0-C Register */
>> +#define SQCH0DSC0CR			0x788
>> +#define SQCH0DSC0CR_FINACT		BIT(0)
>> +#define SQCH0DSC0CR_AUXOP		BIT(22)
>> +
>> +/* Sequence Channel 0 Descriptor 0-D Register */
>> +#define SQCH0DSC0DR			0x78c
>> +
>>   #endif /* __RZG2L_MIPI_DSI_REGS_H__ */
>> --
>> 2.39.5
> 

