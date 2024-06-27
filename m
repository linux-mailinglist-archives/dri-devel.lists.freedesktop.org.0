Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA191AEC9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 20:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EB510E30C;
	Thu, 27 Jun 2024 18:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f/5w2mTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4F710E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr84jJFF/EVtFDqPTGk3ii+jiNQRhmv1K4vmXrA8wGWQJp84nbo1CpK3LTCbTN8UNAYcpycLmdoOlZRIx9dSdhg+2PHzi/bsPxZel1NaGUC9vuYmsirHR7czngSdNst2ctrrJAXzgOtT5DlxSqHxgiH7+UjcTldRFn2KOH51V1KZEwJRTDXmf9K/sR60Sss8jkmIalA7QWneSzy9PoMrlG7BRuOpqjy6N/eWGBVymurE8Ic9Gye3h8BJGsS4hfFWLbpQWW4ERa8tnnTxrccDefNSsbqx9At/lz/6qFZ+P654+feP5UVSeSlEgFS8oJPgFLUkSgoip8f39p2MI2lhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ziAs8fCn6+O5lONWFNNM2p7glSAr2xCdcUUZ/gugp8=;
 b=Kb5Iqkzb9WonERLUE17i46UsW/bU3Hch+d5+vuvbaMDMcVslX2CpCFRm+yJbU3129nM8QvPCBsPdLkET49o4ELVM5NaLDVhzSQveo0GYyABbSixaVE0u0OsDPJKhtQEf7Mxf4FjNImHneq67ACvzyBO9gt1+t7qIUKBLauTN3x0aUHFd+KCwqPjgu7m5hvf4xIUQ/9IrvAovTJD16uCA781ikh1xSI4suM9AgPHLpHd2A3vSOVfVdPAfBQvecGWtxiQLqy7Nd6Cr7lMD4fbVm0U2QEXd8jnLrY21hzNoEcjfPEfg4DZv1NVAtWywjo/RMRa7R25+YamSxnABqj7BTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ziAs8fCn6+O5lONWFNNM2p7glSAr2xCdcUUZ/gugp8=;
 b=f/5w2mTIsBpXvjAd+Sxnix11juDhEnbvMvJ0lnAnC963OBuVUrwUuYWAMpwY9fkxTOi6jxG8LbKDlZ/G52uovSqnQjErYhgEo6PnTTM+mOwd+mRLsElT7dSCZ2aDmIp5bO5K7IuE0nbPqKcQ5aoaAqYN0FX950N0A56ucOuv/eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 18:11:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 18:11:15 +0000
Message-ID: <a160a3b4-1193-490c-aa25-8761142f4e08@amd.com>
Date: Thu, 27 Jun 2024 13:11:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>, Hans de Goede
 <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
References: <20240627175947.65513-1-mattschwartz@gwu.edu>
 <20240627175947.65513-2-mattschwartz@gwu.edu>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240627175947.65513-2-mattschwartz@gwu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:806:27::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8886:EE_
X-MS-Office365-Filtering-Correlation-Id: 8521ea01-5617-4be6-a41e-08dc96d48925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3EwUjY0a3EwelJBSWJxc2M3VjBVbE1WcGNUSnFXZWEzQ0xXNDZKTjBXb2tZ?=
 =?utf-8?B?RllBSzcvSE5DdFpVcXVyU2NQSHFVbjRtTFBmWEk5SFllOFFheFVtZGhnWE1s?=
 =?utf-8?B?OGJhbzMxWmo2Rll0dXNMM3liV1g5aFkyQU85U1ptRDNYWTdhY0t2TzUxNk9V?=
 =?utf-8?B?a1lES3FrcE5tVDEreklDYjFuS2JhYWpWam1XRTBoUUIrT3RmRENwRXRMY09T?=
 =?utf-8?B?NG4xRndvS1NjUXFybFZWZUptNnAxeGoyNkhXR0REanVEbjM0NEhlOW5BWmE0?=
 =?utf-8?B?dE1KZzNyUHlaTTI0bUhYV0NkV0U2Q1lIVVlYQklrcUxsaTE2NkFkMjZkYXhz?=
 =?utf-8?B?azhLVVBKOXV2SmFKRjZnaXIzcXdpYlFRTFFtbkE4bWxva1pHcjB5emlqMTUy?=
 =?utf-8?B?bFlDMUdXVTlGaFBZVXh0bWVlUnlESmZwZ0NFU21xaVpDdzloSlo0WHBqT1hu?=
 =?utf-8?B?OUxpcHZDUlloRHlrTDdqY1ZXbkhTMTRFaUlZbkVobWxvaU02WGhwMmpVQlJ4?=
 =?utf-8?B?aERld3BLSFlNWlUzY2FpMTZqUFZUbEU3V2xKZVF2cHNZcVdGYXMzMkpwenRP?=
 =?utf-8?B?dmdyRmlzWlJEK2RnVUZFd0lCMWlrK0NTbDR2N0lJWG1PSzF2Q2RuOGtxRnNS?=
 =?utf-8?B?ZDNRMVpsMThhRmtDTXFIOVkzdVRpa3oyVmNCWExOK3JKU2NFQ3dBZUtnK05H?=
 =?utf-8?B?R1ZPWDJYZWZseW1IWGMwYnQzNkN3Vzh1ZFN3b09OWVZYSlN1SnNRemppbDB6?=
 =?utf-8?B?allUU0hZVXZXUEMveGlGL3dkYSszOWVkZXpDUkh1WnVaWFZxdThnN0ZVOHla?=
 =?utf-8?B?MEJVODFPaGJaOG1lT3FrWnJ5L0Y2cERxa1V0OTdMcTlhVXNrdHhuSE5QeC85?=
 =?utf-8?B?dFpwaGlmN3BKMS9kTkFRZWR6cWhGdk4wK0FPRTZaQk8vU3pFd1RMNllYcFkx?=
 =?utf-8?B?SEN6aW5CUmhiMElDUnBnQlVzcnEwdC80KzBEOW9OZGtMMGpIRW16VTdLNVRa?=
 =?utf-8?B?aUcvSDNLbFBGMzNTY2RmcGVtRHJjN3Z5OEVDZTdOL3BrYWdoYTBSa1k5WkVW?=
 =?utf-8?B?OUhGdmVQR3pmTkYrY095S25SZVNscGw0b0tYT2krNW84UklmakJwbm1ndFZZ?=
 =?utf-8?B?U3NMa2dmeGM3VmNYREhRQ1J3bzdkZHN4VE4zYmxkOEUvbFJKYm9SbWpBbHI1?=
 =?utf-8?B?OVE4VXZxSVpZUTZaMkNsdm1YS2pJdkU4Ky9HaEZ6VHNBN21OVVgwR3JNcmEw?=
 =?utf-8?B?Y2tMdFIxVDlyYjZsTmJTa2tZeGc4aEppMHFranUvaDRWU1FNb3pySFZhQ1Iz?=
 =?utf-8?B?K0ozTWlneWxqbWNMMXhtekdadUFHQis2MTdNR0tzMXFKcnNtSjF5T0hXKzdH?=
 =?utf-8?B?eGpEOTNuM2RCcVVkekNrbEUvWG0wMnJac085T3BwYW45cUoxZnkyaHA1cHEy?=
 =?utf-8?B?R1FGMzBTUHc3ZEhEUzA0SnZvbklnL1Y4QmRuZGRNQUlNbkxSZmRYRHU4L2p0?=
 =?utf-8?B?OGdKNnVSckhQK1A1ZUQyaUpjbXJjdERhNlNRay8wa0VnUjg3WCsxRU9kemt6?=
 =?utf-8?B?eFU5M1htOHYrYmtTTlo2VEdOU1gxZWRHL0NTbi96T292eWZ2NGNGbW04dVRx?=
 =?utf-8?B?L0lTdlBMM291a3pOMkh3QlM3UDVqd1V3Q1pXSzAvYlZaamg3Rm4rZEpkNHZa?=
 =?utf-8?B?YlJqdWJXb2JUUXUyWU4vZUIyYUFrMnIwZjFmUU8yZjZGODV3b1NHenJuazl1?=
 =?utf-8?B?NEtIcFV0c0wyTDdGSEN1c09BM25mWmNnbWFkYUlieHREdTlpSmhYREdXbVNm?=
 =?utf-8?Q?QIV6trDUiQnBvu775aXxFx37Fd1BaGWd+09ow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnV1QklPNTcrbmpqeUhVZmtjcEdLUG53OExEZ2FuMkVHU0UyU3hzbFQrRktN?=
 =?utf-8?B?bUMrRUxsMDNvVmp6TlE3SGFqb3JQNTVyVGFZQzlsWFh1Y0xycFNaM3FmMnAy?=
 =?utf-8?B?MFRwV3lZN3dmRlcyQTZMZm8zWGVpcVJKeEtldm5PVE5BVVBlcHM4UnRxeXRt?=
 =?utf-8?B?dlQ3TjdwcjltSHcvb2c3QmI5Y29ZSjhiMkE1MkxxNHVOa1VZYkh2SGlDZGlB?=
 =?utf-8?B?VmcrdDZsam54cTVCMHdDSzIzeW5qa1JsY3VJUUI2ODVzUW5tMEVvblZwdUUw?=
 =?utf-8?B?WHBjSllMLy9oTGxUcUFqRGFoNG56MWxVR1hqTVQ1eEg4c1BXTmFOY3ZKZ3dP?=
 =?utf-8?B?Tmdsb1plbERPTkJCYlIzSzVlRDI0UnZXcjk1ODZjOGdtV2xsVUdzTHRqbXl4?=
 =?utf-8?B?MlNsczZPZ3dHZi9uS0FUQnJBRktMa1dsT2hyQ0ROMlZGY2VkV21mUkhFZDRl?=
 =?utf-8?B?SnlJWlhIaXdyME1raVNuN0xlZHRmRElTMk9RbGxsY0pnb0lNbFUvYlFsdk4r?=
 =?utf-8?B?V3k1ZGcrS242VkRxTjhKajdTVDMxQmd1dmdLN2kyUlV5bzNrd2pDaVBzVzZT?=
 =?utf-8?B?S1llMVJHb0hJSVB5WnptanFraFdpdG1OZ1ZxOFNhQmdqL2ZSMFNLU2E1QkdW?=
 =?utf-8?B?WEJUYmVNQ1ZLZE1qWFhQV3FGYS9XZWtoaW51RFJXWlBnN3pCRUExRERCakRO?=
 =?utf-8?B?NnpvY3lpNGZrbWhoNVliVDNJWDU5MmtCZkh2bmJwdWhKUFZ4c3hBN0lNekhh?=
 =?utf-8?B?cVJQaWIyU2xiY3BsZmtZbGFXa0JzZ0g0Wi9JamttclBNUXg3VW5LaS9FRS8r?=
 =?utf-8?B?Um1CWEdpeTVjOU5EdWlXbFM3WWdhUXgrN0t5MUN6ZlNYdTcrWFRwSFVIdHNu?=
 =?utf-8?B?SjYxeEFtRlQ2WGNMam9kYjcxTmN1MitnSzVla09OeUNKNi9WUG4yTUlPdDJ1?=
 =?utf-8?B?RmticG9YclV1djVpV3pmQklyVURiSFV1cFVhdXV1UmIyTHpYUFlKeUNNZGwy?=
 =?utf-8?B?T3gvdUlEZ3VmUENaRkNNTGl2M1RHTVAyTCtreklySXRmWlhRbXJuTXh5dm1N?=
 =?utf-8?B?LzZTSnJBRmJBQ3VhYjBYQkpVcFhmNHl1b1AxYlJMNWRrdkZVWDZRZTloS0VG?=
 =?utf-8?B?enBUNk5WdWJ1dVJaMkc1QTRmc0FBd2JJWTU3S3ZGWXViU3hPWkdlM0swc0RX?=
 =?utf-8?B?TXdHcnV6VXZtRlBDRDluc3Y0ZUNFYk9yM0Jtbk56WlVyRnB4aDdrRXZOazVj?=
 =?utf-8?B?dHYzY0c4am1VcGhmYzdIOXFOWVhYcFd1dmhBWFlsdEc2WXBpN0d3Q1h0Rjg0?=
 =?utf-8?B?MTkzbit1WWt4SHFJcm13ZmlGbVRRMGk3ZmxmZWJBckc0WUZzSEMzaFhVanN0?=
 =?utf-8?B?SzYxL0lmQTMrOUV4MXBKczQ1U3ArN3dJaG5pYkM4MUpYeG5tbjhHN2ZxZmVY?=
 =?utf-8?B?WEtXREoreXZmUUR0ZnhGNDAxbVYyZUtUYlFzOXJyV2dmWEszZEFlRmFlTlp0?=
 =?utf-8?B?UFlJOXBrQ01OeDE4S1p0ZUNIdlJyYXhIZXRLN245M0F6WTN0aSt1SFJMV2lR?=
 =?utf-8?B?aVlCK1YvZmc2a0pHVUM5Sys5b3NtUFVPYWtXQUt5UlpKWjNncWlqQ2VGaHl0?=
 =?utf-8?B?ZXRnU21xbW5IUExnTzk2dk9yZmhGYk52cFhpMHJzNTZKOWR2UmdpY25aemdk?=
 =?utf-8?B?OGFvNGRBMlpyM3JKTURJdkFMQzRpcXE5T0VZT2JtYUs2UDFRTkVhZXBpbVZ0?=
 =?utf-8?B?SjdOa2lETURBdUUyblhRRnBiOStnMkc0b0hKZ1U5QnRCeTZyR29YTmZjRkhI?=
 =?utf-8?B?OGNIZ1p1TW0xK2Y0TDZ5VHF5eWVlZmhPRmtvamlmNmp3L3FmV1ZiUFU3alZH?=
 =?utf-8?B?SU43ellOT2VGUEdkcENxbGRBVE40MTE3SlBQSWhpbjN0RW5PTHdLaXRabHRp?=
 =?utf-8?B?OHdCRWhsU3hoQzkrUjdSR1hvTnMyNlpwdnZMeGYxTUdPdURKazdER3VLT29F?=
 =?utf-8?B?ODFvT1hkS1hzclVvU1hXQTY5aXBBK01yZXM0N242WlhzR0R1R1BTNFhKZXV4?=
 =?utf-8?B?T3FIZisrdytsUnhFMExmelBYajhQaHFCeHVSZFEydXRxU2dBMktLR2k0M2V0?=
 =?utf-8?Q?ivtVTTbta9XPvPaa5zaOGTTak?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8521ea01-5617-4be6-a41e-08dc96d48925
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:11:15.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKRfGal303xOltkKiEOpnQ/VLggARvEsgLCFIR7SgrtXmlrNeCbJRkT8Ik4tkfwIPjBBlQhTUCXAjCIrFPe6hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886
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

On 6/27/2024 12:59, Matthew Schwartz wrote:
> From: John Schoenick <johns@valvesoftware.com>
> 
> Valve's Steam Deck Galileo revision has a 800x1280 OLED panel
> 
> Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>

Your S-o-b should be the last thing in the patch commit log.

> Suggested-by: Matthew Schwartz <mattschwartz@gwu.edu>

I think in this case the specific Suggested-by should be for:

Suggested-by: John Schoenick <johns@valvesoftware.com>

> Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b35a8cf6978afbbd55c80d2d53f4f > ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3d127127e7cb..ac8319d38e37 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>   		},
>   		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Valve Steam Deck */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>   	}, {	/* VIOS LTH17 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),

