Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC3DCRJmc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C4759A8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393D10EAE0;
	Fri, 23 Jan 2026 12:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NiValQqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E06B10EAC7;
 Fri, 23 Jan 2026 12:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXNl+1VMmemvYvd19NZp1oMTKw4IdFIrie/Xst/8W2vlhTfrJLQS64zP3R7et33cXBGXFXde4DgJ/SHMhe4KICfypy9RNae3bPnvTOaoaguaVPc/yDEB17fULDMIzJ/yC+f7NLt72VBbj7xW1yOkedizjlgHr8XIGAyTHLRn+gUdL1x3xmThymnCzPflV4rrrTIVVPqvMQJ2F6+XWILOVaYDwPS/qFlL7jpM/uWGoVPQFBbvqKJQX8m9YOkJEYjdVQoDyJVuuVpAYUmN4qiqwZUdB50RDV2x7qPokIKiFtAFp9L428TRrEhskc3URsk+SQ1XPPsV0Dcs8iO4LaRSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=p4s/GVvjokzAyPWIBehQiHVaoBWACO4biUX8u4aqKHthk3ZCM+wu00zi8PDOKhFzM63OtUjM9oG7Ye6q4gKtX3BphTDBZBpi6aaU0KAB7FlwqvukQFRfyRs08SfIE+tAy7auOHIHRxpRZvQQ8IsC4w5+Oy4x7AMXkX69gi6Jl3Jv9h8wlm/b/z8PumCNpbLi5kl9zPl2RrS8E22oKRaxQbqkYD+QfP1tBdjMO3Gw33PJ4C12YfKazyBWS7FP1uLY6JO3/LdVwkNcA1ZXNwu8UqzIrson/Bo8DQ8kO4Me5fpuQXMC44pIEFL+qd35EnI5Pt8AdRglYfNeAVgFTnfTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REx9ZFL33SHL/Y3hf7WaBe4cOQ1mtKshVcngJgPkt0U=;
 b=NiValQqNdTSX1/nxSW3jEO4ri1rWXgxg5iU+X/2OoX7rKgySZb5W5b8N8yDaBkwuAZtywqAbPvtWvrGPkRqB4Nc+rhYWvbRghUkAvWj65T4PnvilmKmdtV3GUxwOLQpTw666aa6/u96jOYjVg6ihFzrqUMhxhPJ8hAL2l6x18z6SRSzZSF6hG47Yw8jjeoM/vUZVwJpaZUWp9CH05o55Z/pS5acqUSi7xTPNrP7NoR0SEPHzRG/MpfOHqoJgNO5P78dja/7MnlqLd211DtJvdw5SElQ8qAlxyPoFZIuhE+c96gUJuIJYD+Mftmpcuntri04yIU/EH/I4nfB69Q6Hcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:14:01 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:14:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 23 Jan 2026 21:12:38 +0900
Subject: [PATCH v2 1/4] gpu: nova-core: gsp: fix incorrect advancing of
 write pointer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-nova-core-cmdq1-v2-1-e797ec1b714c@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: be2acc16-04ac-40bf-68db-08de5a78e45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlJZ2pqOWhRblI5dTgyeE5KenNDMXROdklQRGN1K25VcDhBL2tBVmtMMUs4?=
 =?utf-8?B?Sk9lWWJYK1FJV0pDdUZHNlo3TkVOeWU0MGtpSDgzdEtUU0pGVDl1SkVBV3Zl?=
 =?utf-8?B?cVRTbWhVcHFhN1ZpWldUM1htUUFxYi9IQTdIbzRkK2RRYkY5MktHY3lrSUc5?=
 =?utf-8?B?Y3QySmVQOHlwRmU1dXNVaWQyZnZYWG1HcTdzMHMxUDJFREs1WnVGV0I1WWU5?=
 =?utf-8?B?RnF5VHQvUmpMYk93WXVuTC9ySWNFbHRnOVFGS0xHQngvTlJka1dLUlp6UkR4?=
 =?utf-8?B?aDJzdm8zYUNud0UzTHp0MUNFWjV6WlBlNVhSYUtOc1cwRFRXaUprU0tNdFZo?=
 =?utf-8?B?SGtZVERkOUJyUjN4QUZRK0JqR0lkRENLV2s1d3VNZFg1Qm41NGQxNzBEdFho?=
 =?utf-8?B?WENDZjdlSk9ydkcrV1VsZUVEd2ZVeFZoU0NLMEhnVTAvMlA1cXoxUnBIWW11?=
 =?utf-8?B?NHBQZm5LbnNEdXE5NzBxQjZTZUM1YWJlSVN1Uk5CY1FWUDNMV3hZUHNxWTdq?=
 =?utf-8?B?a0J1T3F6Yk5TVU5jMmNNVEhXQ2kzQnYrYUJJRlF1cFhlc1Blb21qNVhHVDZP?=
 =?utf-8?B?OCttaG96RXczMEZENWlQOTBzbVJjSVpnbHpZKzFId2xCSlNUaDZ3MVB4bjlq?=
 =?utf-8?B?QmxBM2pMR1JzRER5L3IxbnIwbWZ1Y2ovQ2hlVnRybURyOWtZSk5Vd3h3Ykht?=
 =?utf-8?B?OXJUN1R5TVByMkUwNzRndHI1R0o5TysvcGtJdHF0Y3NMY09teTFERUQ3TTdP?=
 =?utf-8?B?NWQrVExYQkdUQmxyMzNvM3l2UXptSWtsOE5jcXM3V0NHMTE5azFqVHdUYjdz?=
 =?utf-8?B?RnpDTWpBcTlJKzNNb1dZS2swZVk1SGlON0Q4M0h4QWgrMnErMkdyUE0rZEpa?=
 =?utf-8?B?RFpKUW1EWm5RVTh4SVlEVGxCMXpEdVRpNzdsK0FEVHBSbDg4M2k3cGpWVDQ5?=
 =?utf-8?B?b0txd1Vva2dXOHRBbTFwcDgyaUFKSUxEb2lxVjl0c3djQklrYzB4bkpzVjQx?=
 =?utf-8?B?YTRtWW9rS3VXWG93QVNMbjhjSEN5cVU1eVF5K2w5cWRLSWRRZHRkZWNtbVFK?=
 =?utf-8?B?Zmo1UktYVkdGVTRNWFRDZXIzK2FvYXJSMjlZN1YycGpqYi8vMkxRTUtFSHQ4?=
 =?utf-8?B?V0p3d1hYMjRaa1htNUI5b0I0dmxSTndaV0E3cVZMejZxZ0MzdE9tcFh5SDRq?=
 =?utf-8?B?RUVFZ1JhVXBiMzRsTG9PNzNqYkhPdjNFM3RvYVloRDlRNjNYVHY1ejhYM3RO?=
 =?utf-8?B?dHVxQnhNMVNZNVpzcjZPaDh0eFA5MHA2WEE3ZDJMMTM0NG1IdEM2ZGphMEtm?=
 =?utf-8?B?ZTliY0JxYmFSbytBYTFxYWVLSUZ1ckc3NlVaNFp5cHVycXZaSkFtb0cwQ2VS?=
 =?utf-8?B?RVZuZFZjRGlpbnpmV1F6QUplSUhLbzBqREd3ZGlZeGJZcFN4RFlhNFQvSmZo?=
 =?utf-8?B?bEJTeFJjZ2FPclRqKzVyQ1ZET0xBaHdMMGZFQVU2TmZ1UzJwSWlmU2lWRmNO?=
 =?utf-8?B?a2hRN0FGcjlESndrQ1hwdGlraEk1bXdMbUxMRldRaXN2OG5RaUt2SlI4VkY4?=
 =?utf-8?B?SkM0SVdUTmdmRUdRMGowVTE2UkUzZy91N0lQc3dobjBNSDlLSDBEWkVFWGU3?=
 =?utf-8?B?cGhBSGdvNE9XL09Oc0xuRHMxRXRjZmlsb1ZYUDZsbEVVRTkzMGFCa2tsd21z?=
 =?utf-8?B?TjFMTEVLWVMwaFVKTWxacXBCMlZ5V3MxS2YvVXI1YldTeHYwMjB4NFloNzFj?=
 =?utf-8?B?NE1YTmdhWFU4WjIxNnczSk4vRHkvNmdERVN2NnprbThJOStiY1B2aXNrRUFt?=
 =?utf-8?B?TUpRSWhVV0hZQkNaUWFUY0pPV3ZsRzQrTmw5ZHhEeW5PcFNMZnVBRGNMNHcz?=
 =?utf-8?B?cmJVdkxuMUdYcEEwbU9pKzE3VFovZDA0K0o4NVlKdUU2cGx2blFEVXQ4ZFFi?=
 =?utf-8?B?bGZoeS82NTZzcnh5bnpGd3YwdmcwZDRoV1NZK2NzSTZyeDFOYXVGSCtWSWNR?=
 =?utf-8?B?U1ZiVWJUQ0VLWjI0RlhOZGRiTTFMc0dkQkRHREFDSDdmRXR4U1NpdGJsZ1Q2?=
 =?utf-8?B?STZaUE9rZnNIWktFVDFoeWY1Q1F4Sm1VbUVuOWg0aDVTTEVEaTMwWHBzUE16?=
 =?utf-8?Q?IAxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJsNGNtc0FaU09yYnJVREdtYWhOTjRINnVtcndURlRhRCs0UkJiMDBVRFVw?=
 =?utf-8?B?NngrdXNKd2FHYmJxMTNaY3p5dlhEcnU4WmsrOEZwTGhiUUhFaGEwZmhkb0My?=
 =?utf-8?B?NXVxeGRyUzh6WlBwbHp5NGpvY2ZUdG1CUXFzT1BqdzE2VkhHYitXaTUrVWgx?=
 =?utf-8?B?UFZyZ2dKaXBqV3Fld0hFckIvaG9HRWRIM1FIRVJLRndvenplMm9YQnA5RUM3?=
 =?utf-8?B?TGpmU21tUEcxdmpZdlVHVjMxS3l6RkNSYUhsOEJHRm82TUFLUDBQZnJTU1lD?=
 =?utf-8?B?RFROVTdNL1VyMFE2VFBsVUI3NFl5SWtXQStYdENqVEhubHVvR2xua3g1cmw0?=
 =?utf-8?B?SmtaVGpTMWladG5CcS9aUU92anhwQ2JLTk9qMHZ2aHh2TEE4VGUxMG0vRG1J?=
 =?utf-8?B?Z0FFR1R2UDdGbUFqV2VSdmQ3S3FXR1BBNGY2cHBsYnVUS3lvWC9lbWZuZjdL?=
 =?utf-8?B?Zm92QzhXcXpJSkcrNlVOTEpxL3lNcE1tOFlxVzZ0cEozenVQZUpWNThLaXZy?=
 =?utf-8?B?dWZFVHBjRUtxY3l2SkwvYks4OHhmaEc3Z0tQTlNIeXlRc29OMjVGNEw2QkFO?=
 =?utf-8?B?NWdHV2lGM3h1UUFUOXdsNjhGSXUzWmN5YUp4U29lY0ZDQVZlNGdhRFhVZWlB?=
 =?utf-8?B?YmVoYmRUSGpBdkNuYTl0bTA5T0ZpTWtHdWFQZzl4dXA4S3RUYzByMnhEN2s2?=
 =?utf-8?B?Z2tFVVRiWXNZQURqTDZ6UVJZRU16SVNiSzZ2R3c3TXE5dTZZd0lpOWZkekxr?=
 =?utf-8?B?Y2FENmcwdnJPYndLdVovZTVoSEphdFpiOVM0TUNBWXI4ZmRNVjBFdGwycXFr?=
 =?utf-8?B?bWVxRlhsdHNiWmRDOFV3ZE01WWF4OHRxOWU5UHNYRnZSL1JFNGEvTWlTeXp2?=
 =?utf-8?B?ektQaCtwZkxCeVlyZFU5VzZJTGZ2dmdsandpNjdYZ1paQ2RRcHVTNGE2NlVO?=
 =?utf-8?B?RTVxTXdnWjBaWS9oanl4d2x0UFo0VjBINEs0WjNXajl5VUJwRnFjSUozY1Na?=
 =?utf-8?B?RHNNNENkb2g1aitacFpJYmlOeUliUlVxTmJYRXBQWGtXcGhwU1cvYU9SV2RO?=
 =?utf-8?B?VDZ5U29TWVNlclBxV0U1WThHUTkrZzcwcHZhZVEvblA4WmxNd041R1I3Zkhn?=
 =?utf-8?B?M1ArY2prTTgrMHRsZzdQZThGMFV5UGQxdWtRTk0xb1JZMHFka054ejQvSnd4?=
 =?utf-8?B?aGNZTzNkd3lzblFGdVJIRVhIdGZSaktXT3MvdEhZNEpEeFpxbnNQMVMyOFNO?=
 =?utf-8?B?Qm5pZUpSUGZpdHNDL1VUdVRjaHlHL0h4NXQ4dkEzdWNPdWpCeTRwajRKNDFD?=
 =?utf-8?B?QkhCZGVTbk5abCtFQzM5WEVqc0VNQWFTcHlJNHBOd3Z3SHNUOE5aMHFVS0xs?=
 =?utf-8?B?dnBhOGZqN3BkTUZMRU9aZEhqeUxFQ1QvMm44K3dqRzYwcW95cExGNDN0U2Qx?=
 =?utf-8?B?S0Z4ODJxVUErVGNWdjJLMTNWamUzNzV0c3owV1hHME5zOW9QSTY0cUYrd2Vh?=
 =?utf-8?B?NitjNHlScWVHVGpjZmR0K3ROUDM4REJhMm1sMUVuOXJvY2t3RjJHV2RYd3l2?=
 =?utf-8?B?SW5TbWd0dFJCSU4zM1poL2JEOFVROHplWUNTRi9RR01pUjYwOWpPWkFkRER5?=
 =?utf-8?B?KzhpaGhPdm9BQlpmU3VSVCtVcGsvWmt1c3hoaFRWV0M3bGRoQyt2RGpEdTBQ?=
 =?utf-8?B?cE02ZDg3QXVYTmtvSVBkWU1rb0xhaS9DWENoTThrQmg4bXVuTWpDbkdwMk9K?=
 =?utf-8?B?Zko3UEdZaVRFcHdkOXc4RllRVFRKMlNka3E3UVhLSzFKako1NW5hS1didzFk?=
 =?utf-8?B?RDBXK290RTQyN1d3bnJiZmxONnFWZ1RLc0kvTUNjNy9DcnJ2NitTdFdFVE5N?=
 =?utf-8?B?b2FWd2w1dkFoOExMaG5DeUlxYllpeWh0VkNwT1ZXTVRjNlA4L2VvdE90UjBj?=
 =?utf-8?B?RHdRd1VQdXpYMFd4TFBpWGI0RzY0d3ZNYVk3cUNNQzE5aTMxbytDZ2I3WXJN?=
 =?utf-8?B?SnY3eGVFVDdOR2VlNU5mVDgzSWZxTDJDSnRoMWdKM1FKRDk0RTdBcURtdU1K?=
 =?utf-8?B?NW1RaWVyYkIwdUhieDVIRGE0RjVIbHl5M0UyV2dYbkNxUEhMLzcrQU5rR1Fl?=
 =?utf-8?B?bDJSOGRqMFQ4SkhVNFZkclNyaDNSZFNSQWI3TVBGdHI1RWVyU0ErRWFwVFF3?=
 =?utf-8?B?NjFwNWovdExSdTBLeDRSeEIwYUUwWTN0bFVWTTlyN0J6enBFR1Q3cXRWTlJq?=
 =?utf-8?B?ejdYY2xEcTk3cFF4ZldBNFZVbEpBdkpycXBoejE1em5OZFQxWlVpZVpFU3p3?=
 =?utf-8?B?Mi9KeDNEYThxazZhS3dDUkIwVlVYNXZXVFlPd3M4cEdEM2VzMnozQWRLQlNu?=
 =?utf-8?Q?Uzm2jeDtSNM4wg2GzcCF0DxWaxtb0386Qr4neQqM2e1uQ?=
X-MS-Exchange-AntiSpam-MessageData-1: 8mP0zNCVlSjY0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2acc16-04ac-40bf-68db-08de5a78e45a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:14:00.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mh/ikAAMEWYLF1nkPgg+aUhDcNpbNNQm9JWUAlI9bqBpVpaV9B6mzhKEEvY5ukhrAO1myfC5IPcXNAPJyJLYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C96C4759A8
X-Rspamd-Action: no action

We should modulo not bitwise-and here. The current code could, for
example, set wptr to MSGQ_NUM_PAGES which is not valid.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..f139aad7af3f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -384,7 +384,7 @@ fn cpu_write_ptr(&self) -> u32 {
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         let gsp_mem = self.0.start_ptr_mut();
 
         // SAFETY:

-- 
2.52.0

