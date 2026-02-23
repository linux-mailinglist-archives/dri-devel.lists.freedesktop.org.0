Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EfFM1ionGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:19:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F9717C451
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A37A10E41F;
	Mon, 23 Feb 2026 19:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bhVOiI/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D03610E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:19:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrns+GtXfgulT/a+LsV5R0VBghP0+NcSCcuMAqeP7+LCYZCRPdUeDBow5J69cbr5uxe8VWtuTA6dTQtKw1G0KtQp/fiJ8KIdaoZ3sFmAwHIDbakjMWG4orvtYUkKGVnpMmoVK0s7Ma6HxLd9+GmR3t7istnhMEZMHL3tzTkNcVkdAWiW+VXGcdUCRp3P8ahOf3a6e+gkhzpH8/mfkbuCfIIG0WrJgPLCAppUsjjb+ZlpCIXKOZ7SOPbG3WddbbRI1/cfgdqmUSkkP8BM2bKZ/+WRV3MbUQuBmW1Sx9fXLRKyhO/0jFy9V00V/+u9MVb+wgNCfVhCRNUwoX3NlhQpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCG7PMxmaCTQEO2CfCY9bzhhmMnxe4GSg0pDJnKGhlA=;
 b=lh4AuTC7ltuoLWav0s7XsKuNbdJ15HkxcN8XFxZMkCg0d0p6auaxEJBiFAS0QXgt5m8MM2IY7IsGAb09THMApB+mfDZZfUq1Db9oJcrOz1dsZiX7do0tuMHj0GbONxLikOJOGBh6NwGcZ6fZcABzDgUSgRDcHpeod0TDmL9f6yD4QflKD/P97PIkDS9bjROfbo2A2+NJOPiAhzHdHHgz+QL59SLuVoVHXuiqiSqewsVKmOTjapRfitZ7CBzdoBUetcD3t3DzzSLIPnRwpdJmVx1xFA6R+8ZC8TijedtowFncFILvp7TZEdg/v9Tn3DsWVlnhjA5IIWc6Bh0J+jEKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCG7PMxmaCTQEO2CfCY9bzhhmMnxe4GSg0pDJnKGhlA=;
 b=bhVOiI/V5bZ8OpnnVdsIkQEjVQy52W2TgUcU0WcEBwaVocLfXES4DCkwiPbOiEUNNegDbrE9kRuyfbuUwiL36cP+2dwDFA4BYeuK2uU0YNzZE3lnTdXtdKiT7216+YATMCPHabVRbuyZxWUP4DX72IJLWD5aYVGj2Id8SRAf93U=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 19:19:42 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::56ac:f44f:8336:d7ec%3]) with mapi id 15.20.9632.015; Mon, 23 Feb 2026
 19:19:41 +0000
From: "Francis, David" <David.Francis@amd.com>
To: list DRI developers Maling <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Airlie Dave <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: On kernel interfaces for a GPU top
Thread-Topic: On kernel interfaces for a GPU top
Thread-Index: AQHcpPjUJN0UqDzxh0mt6UqQZUGD3w==
Date: Mon, 23 Feb 2026 19:19:41 +0000
Message-ID: <SA1PR12MB8144E40D472D0255813AF4B8EF77A@SA1PR12MB8144.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-23T19:19:41.356Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=1;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|CH2PR12MB4295:EE_
x-ms-office365-filtering-correlation-id: 047218c4-150f-4d00-98b5-08de73107edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?LEV7SXSqNKEYMMo3f3Hlc0S6NGfNxkkDm2Uxjjp6CAEKAAaBfnyRXEnAC2?=
 =?iso-8859-1?Q?mRbHlPci20iXdeCPSUZ0YPyqFcBwfBmpPb9d2U/gafXDfbdApDE9njoukM?=
 =?iso-8859-1?Q?URZZb85bDxrGmRcPacmR9rlw8+WmWXz8fo3mYixLkUrsSm8ShMU3Vdak5j?=
 =?iso-8859-1?Q?70uSQViFwhMCy2FNXd32uL+F+D2A+PsQhO/wY+OfDhf9SdE7bRiMxFyj36?=
 =?iso-8859-1?Q?2m7xwYumnfcf6NoIau9BvCeGnIg3FIzsn9InFYcWLvDBQ9OP/YPcduK83f?=
 =?iso-8859-1?Q?1Q0EzeKt2Pgmzidb2/lW58Ahkrd03hEN0+wc/RvqBgcYGeCQiNE6Az4wF4?=
 =?iso-8859-1?Q?h9wJ8IncpCcRir6vBMTuXTlhYO4YNvnPhMhZRCQrEfWPjTGQNM6QMJ77nL?=
 =?iso-8859-1?Q?DKNHi4BwmE0YoDKggTlb5IWaW0UdYV0ptyWWQOOftgdSrgqrMdVXfy8JJZ?=
 =?iso-8859-1?Q?vot+s+7WL9nkmBUXx7e86fRl0oVicg9TKPNgR7OShx+sqWZPPvKBZ0903G?=
 =?iso-8859-1?Q?M2sabLtSByjQ3T5wxHE5nWDviozZEpmLMad7aUM6u5PNfJ0LrYwoM2II9M?=
 =?iso-8859-1?Q?xmUceGo4p2bydSk5H8biy6i+hobcVogu8kbu6g29QXtl1ixHZp/dunUyRl?=
 =?iso-8859-1?Q?Y0wurir1zGGXIUorXtQ9UYttD0favGKz1PwbDwFQF+DrryO6f0dusXTDz4?=
 =?iso-8859-1?Q?Mqqg2xkqlQvfA5s152XvhCnCXDZc2T3qk5CH/itzUzA75Q//ZJ6gOKpbdy?=
 =?iso-8859-1?Q?zajpCpJK12BBcRGfWPjqgR74zjUDp/KVxSIwT2emDFk26zWo9znkqD9NhI?=
 =?iso-8859-1?Q?Hj59BmyXRAmlYOHyvm8sfO1lopC0m3G6Fn8OsB8q3++y4qdGciQJXA8R2C?=
 =?iso-8859-1?Q?8KJ14knei8dZd9sBXxwNrk8PUl0DBidMjeupkc+iGTxIQpExDTit9Oolav?=
 =?iso-8859-1?Q?6guSmJRFkcNvRJS0fqQ+06t7jDvyFYFRBgYv8mtiHC/RLDVzcP7SWALq5v?=
 =?iso-8859-1?Q?YurQqrCC/Fc3pr9ANA+Jw5qyvr9u8G/ERRQ9oCurIjtsd+6dguLhDR//oZ?=
 =?iso-8859-1?Q?2Q4kD3z8FhuvsVKwI0QIFEWdG7/BbkNPZmnIRpwn9txTWj6OdSqcCO55RI?=
 =?iso-8859-1?Q?TCwolC6Dc40gtV4AVyw0uyfXyEBQiUxlyqyC899yrtcrRF/yPYtzQWK3iA?=
 =?iso-8859-1?Q?rnVIR/5N7e605A9AjZKcWD/9ybJPxTqa4fJPVQ9dIMyREf1XpS/YtNRuWW?=
 =?iso-8859-1?Q?LdECliwBXdxM4NqNOhtBrRx3Aaz9vVqCZ3mrQRE4JIJTq4g9DeiU5V1hhD?=
 =?iso-8859-1?Q?FGHorUfL4P/kJbRwsfNzbwbTU+RsSM1pHrncm+VyWyFwz/ECf4OmCho3Be?=
 =?iso-8859-1?Q?cE9ZiCJVU3tson6wPjJC4JeB/8n6jp+px0OLVKl9254WHrGDwIeh5fJsdW?=
 =?iso-8859-1?Q?TWetgrPFOyhsulb56MhpuOy/Q5VmcJ42IQqaQAMLaH5ujCNitS4gJg0AYZ?=
 =?iso-8859-1?Q?5qn49DWfsxkgq1His4U2VJA/7j2mSoNW6DbXSm799sJWcBq4aYN5ALyjv7?=
 =?iso-8859-1?Q?l95+2wEVZvG3M2pZOlgJk8qAmpeU/jVYOwOYQnfASB5Ett3q/ony/Oppkv?=
 =?iso-8859-1?Q?1PIaQwKqaufiu3z4lAOUuHyIf0CH0jdKjYNR8VQKn+3LzJOaQIUwZz4yN6?=
 =?iso-8859-1?Q?10vpF+RVb1c3EhyGJv4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xVlZER/p/Knh8+QuzZCPviAB5fKcT8i/45wMHYkjW3LttBsDtmEpINynGo?=
 =?iso-8859-1?Q?VNPo/f3H6UmaAYgD4XK4gvaHMmLblkphmZtnpopg4HJgnehm6fbODl9hGq?=
 =?iso-8859-1?Q?elsfpzz9BxuImLvj/ga9xM9t0dMOe/qRYtSx1L1+spGhtTenrerSjfs3JQ?=
 =?iso-8859-1?Q?GNvKyTaNcRR+Po7exCmHc8+9nr4tL9ggwtts4+UZhEWQmY8Re+O1Zzc7rG?=
 =?iso-8859-1?Q?k3vUGF6qqL0C1wEa+hC0ZxRLh9AP7FFOqQ7YKmhuEXiK5HzGaAIBuyeXxh?=
 =?iso-8859-1?Q?A4f3SGOyrIhxxjRWR5rQURFT6Jl2Fv2yg9KbPUR1ZzW1NfYY7LXe3tO7TD?=
 =?iso-8859-1?Q?KZqb3eCals8Bl9s2yem7muhFhxraFIcvlDjF+FDXiByhm16f8I6QTQJIi3?=
 =?iso-8859-1?Q?mtJaviPKSd/uYlodYLoT2f7oubF+l+lzB0zjrSIiwtKKvZxOUb+QBjBbY8?=
 =?iso-8859-1?Q?Jnnzq0OEb9ejTpVxhSwb1V1MVKwN+vN9A+H4p9y0WcEls6PQ8scgRQ3z9A?=
 =?iso-8859-1?Q?lyE1CNTGace064p0lEElt4IKNC6GbT520tbZhF22Sk8IJJV61fHpBb/8v7?=
 =?iso-8859-1?Q?TNNl3WsOf/GKDcmQdfETgqPnnD6pDWokFA8+4V2ROSsqcjHUQW8Xw8kmqq?=
 =?iso-8859-1?Q?45Dx5YioBlhnZsBEwDKVsHLK1+OQX2AuKJTuFZuOfvhcJAuXRxHo7L4LD3?=
 =?iso-8859-1?Q?0/WcRLjo1QYFtuHDqeqcvQlrfBIA6dfge3CrBjW0MzPuYC0e0fUkEJGryy?=
 =?iso-8859-1?Q?EO/O2SQ3Ttpmft/2WnaYoEeaws5tCMobGC69vWfJT/1XkxrHmxui53HZiH?=
 =?iso-8859-1?Q?Wtr20xTdybaMYT4PGzriZ1CSDGFZHCF/bmC2k7EZl9RPl1t3zZj+BIayn8?=
 =?iso-8859-1?Q?VfG0kN0gYgwJrmVQ0mQLbvBBm/1vHm4FW0Uki7pOKaIwhIqv8E8ViMpALQ?=
 =?iso-8859-1?Q?yPPQgaWKVexTET4wIv3N7QwjrJ6xOQtCDJkg1sRuMKoTDRsLS4Ekb7orYI?=
 =?iso-8859-1?Q?UhCXRmS/1m/uHvp7JT1VFjX6V/B9W0QHu5f9uITKa8y8X2sd/vuiNghrGp?=
 =?iso-8859-1?Q?n12MSTOmuv5KGgWIYidxZ76ZAANi9EE8KZZf/80dSRCUREDNlWXxUmL0pP?=
 =?iso-8859-1?Q?Y5r4MgJaDMQjeW7zjpNvuuskdQgBN0RR+4hmXbB7WXD30eplBXJAqXRQex?=
 =?iso-8859-1?Q?rmaXWm9pBBfB7SqVCUgxti4NWZuaX1J+WcGpfTtHKmpCC9B64TTU+GjTZH?=
 =?iso-8859-1?Q?1lsJapF06Jr1HJ5DVP5W4I0n4uw87PHDiVdhPOnEKnh9SBZLXtuhcA21uk?=
 =?iso-8859-1?Q?SyTzI8kSxCss4zk/ml8nOoyIHOIq3emqitOiz1pGAYYJo3IzE5XTk39Kzj?=
 =?iso-8859-1?Q?Mgvp7B6n+G7iiBOiJBQ6m+n5jWCIXtWoP+6oV+gl1Bje06xOmjgkK5cqEb?=
 =?iso-8859-1?Q?TZ2cJA7612sKDjzwSApAb6DNHkOQ0KLZm1t84FUww0KqhnlXHoVhzxqyYP?=
 =?iso-8859-1?Q?w9aAXTwG1J0PSeXKnpMynXrBTnNCyAIDsN62uFLmjAZi0vMD1ELMaLj5HZ?=
 =?iso-8859-1?Q?0P7jSBh+Gr0FCH9WShGT8N9Helr+2HOa9FErfDfsSAu6DLTLHdDlWWDKJh?=
 =?iso-8859-1?Q?eff/zBX0CWCvHBZU5ECRwNd7mz+HP2rFGEsakZdchdng01c9Vakh85T61s?=
 =?iso-8859-1?Q?8KAh2hgK18xsJNVBjJA70ZRdy8Qpm8vSTJ4XgPSk9uCjcpDrBJ28UEQHPD?=
 =?iso-8859-1?Q?rZqc50f2UEWH/K5GMwPjr3pd+VNKLXsIj7OhwUgujomhDw?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB8144E40D472D0255813AF4B8EF77ASA1PR12MB8144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047218c4-150f-4d00-98b5-08de73107edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:19:41.8111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vlgrYwJM6M+2rTfgDXLv2AL90WJZRaDW/BDu/dyEj4DuRp8TA32XSUb+bD7XdAb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,ffwll.ch,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[David.Francis@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,SA1PR12MB8144.namprd12.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 45F9717C451
X-Rspamd-Action: no action

--_000_SA1PR12MB8144E40D472D0255813AF4B8EF77ASA1PR12MB8144namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

We would like to have a GPU equivalent of top; some program that can effici=
ently get a list of processes using the GPU (or other drm driver) and some =
basic usage statistics for those processes.
We would like this program to be usable by processes with no particular pri=
vileges, in particular processes without ptrace permissions on the other pr=
ocesses using the GPU (which are needed for fdinfo).
There are two main problems
1: There's no way for an unprivileged process to get this kind of data. The=
re's fdinfo and debugfs, which can contain process-specific data, but aren'=
t accessible without privileges. There's drm sysfs, which can be accessed b=
y anyone (at least parially) but can't contain process-specific data.
2: There's no efficient way for any process to easily get a list of which p=
rocesses are using the GPU. This information is available by looking throug=
h the fdinfo entries for every process, but that's slow. drm drivers can tr=
ack which process created a fd on the device file, and which process last c=
alled an ioctl on an fd, but the process that actually holds the fd might b=
e neither of those. (e.g. X server opens a drm driver, starts some queues, =
then forks, handing the fd to a child process that then submits to the queu=
es but never does any more ioctls)

As a solution for problem 1, we have as a possible idea making some fdinfo =
entries accessible without ptrace priviliges; I would like to know if there=
 are any immediate objections to that.

As for problem 2, I really don't know what kind of interface would be acces=
sible and am open to ideas.

Thanks,
David Francis

--_000_SA1PR12MB8144E40D472D0255813AF4B8EF77ASA1PR12MB8144namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 0, 255)=
; margin-left: 5pt; font-size: 10pt;">
[AMD Official Use Only - AMD Internal Distribution Only]</div>
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
We would like to have a GPU equivalent of top; some program that can effici=
ently get a list of processes using the GPU (or other drm driver) and some =
basic usage statistics for those processes.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
We would like this program to be usable by processes with no particular pri=
vileges, in particular processes without ptrace permissions on the other pr=
ocesses using the GPU (which are needed for fdinfo).</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
There are two main problems</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
1: There's no way for an unprivileged process to get this kind of data. The=
re's fdinfo and debugfs, which can contain process-specific data, but aren'=
t accessible without privileges. There's drm sysfs, which can be accessed b=
y anyone (at least parially) but
 can't contain process-specific data.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
2: There's no efficient way for any process to easily get a list of which p=
rocesses are using the GPU. This information is available by looking throug=
h the fdinfo entries for every process, but that's slow. drm drivers can tr=
ack which process created a fd on
 the device file, and which process last called an ioctl on an fd, but the =
process that actually holds the fd might be neither of those. (e.g. X serve=
r opens a drm driver, starts some queues, then forks, handing the fd to a c=
hild process that then submits to
 the queues but never does any more ioctls)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
As a solution for problem 1, we have as a possible idea making some fdinfo =
entries accessible without ptrace priviliges; I would like to know if there=
 are any immediate objections to that.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
As for problem 2, I really don't know what kind of interface would be acces=
sible and am open to ideas.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
David Francis</div>
</body>
</html>

--_000_SA1PR12MB8144E40D472D0255813AF4B8EF77ASA1PR12MB8144namp_--
