Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89549A7EB2D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 20:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8763210E546;
	Mon,  7 Apr 2025 18:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EblMDkLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D710E3F5;
 Mon,  7 Apr 2025 18:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bApPQPBPusNn5+WV+esObptKGKzzg1r0/RgOURERgTOPKz2gUQhNaXHBn05yV7AmeR8OJNUAgJA2kdegR3Mu1yWZg81YGsCOnFkwL9INIOuzxjpaws/sV9RKFFvW05M/bhc/gBV2PwuC+ye7Ejh889JEbcGDdvN0+RyiSJOWdd44FcxrkKG7sTnxTiiBWVNlnwqZEaieMOJTTtL734WO4+qoy9DWmIyh7vD45nkjBwXU+z6Tn16EWAUsA2TVZKeqaXNMv+W2svU6WpDROagbsi6V4GMmyExzGpZsavCIBlcSg57nzOjm7nyIcG3aSDcFtNAEryj0t77pKDzZp05/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3bP0ZrJixMlNCT+oQAH2cSOvXCptNi1ERGi6whDmEI=;
 b=GycqLdWuekbY+Hz4b7+8ksucAv6FcVkAUCKvG+Cy8DLErZ8XceP8rhBHIxyCUNghcZARAUY6uL+XsC/rH6hqJ4LznGqMnfdVup0cbTpnYntmkOkohcGOJeZSKv1loFP9rMY5YRLWbfaGRcDYaWR2Bx61kTHBRdxOj6HR/Yt7cyuD+pO3v/I7+c6lXzPRp57pqH8+z0Q8T1rpPtdT7twaIZ2R0ZC5XnsyQ5+OJxbuBT++yj3k8HnpEmebFvaqv+wdM15xL2NNM4Q26RKd2qnD3eYDbhS+/MY81ZbAYpyCQHuH5JboOoA89MNqqHnUNvPTrzufIhOz59+Xvdy0N8VRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3bP0ZrJixMlNCT+oQAH2cSOvXCptNi1ERGi6whDmEI=;
 b=EblMDkLz7xIlIU0jKyLCMlfBV5+vdw5hYVFz4AkSNsoxeANF/dAgjtjJXYKnhkB9kLJbbsS2F5ZbUbwl1lx4NjavoXt9oJ0ncNrkuBBP1CF1cz3DgeZcTTQ+P+toX6OXzqsVhTAcZCPnknBhLSOMKnrAygMjRH1i0TPlVs/GeY4hwgXcsad71PxpWkdsb+ttFUNMJWpqKQ1A14Omzrgc806EZLUJB41ivRqJZqdPNMlfEnOlMqJorhsRf1iprogg0Bmg82SLLixBIxkmETLsmpXOPFODN/qrZnVIy3UPhTWihGDtBIBVkAPOzgyoykT/fEr/ryPTw/xIggA0x59FJA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB8428.namprd12.prod.outlook.com (2603:10b6:510:243::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 18:47:34 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 18:47:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWAgAACUACAAAJUAA==
Date: Mon, 7 Apr 2025 18:47:34 +0000
Message-ID: <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
In-Reply-To: <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB8428:EE_
x-ms-office365-filtering-correlation-id: e909f549-ac06-48e3-af08-08dd7604a906
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c2pEMFNiWjBQMmVPUWdlL1JHWEg1Qk44eDF3WUhmeGxoSys5ejVaNHRyMENS?=
 =?utf-8?B?TWJZQUFSSDJ4SmZaUEFIbGduREdnWEcyNVpYTlhpQ3lQYzBubXBjWmIrYjdG?=
 =?utf-8?B?ZmVPNjZqZFJxenNxUEd4SVpqL2dSc2hwZVhLaWkra0xTeFpvY0NEZmRSeFlP?=
 =?utf-8?B?Z2xOWisrbmg5TGFLMm9YUUtsakpuT1lTRkJiZHo0WVpPcThsWkxaQlpnWGZO?=
 =?utf-8?B?K1RwVUpHQ3l4OFNxZ0RpTDdkdEVabGVOMThLc29EU1FramVaT0NQc0l5dnJT?=
 =?utf-8?B?dmJIZHNINE90RGZzU2F3Um9GOTIzTlJIQmJCSkxPT2RXazcvZHZ2U3dkVTVK?=
 =?utf-8?B?SWxXQUh2aXFCSWk4bVRHWUV4L2lKODNIMHc4a09Da1ROUG4wYzVRcXJxRmtB?=
 =?utf-8?B?eTloek9ld3QyaDZveTQxeXF5dnh3aS8razNOZ0tJV3N1MzZZT25nOU1MdzM3?=
 =?utf-8?B?bklhOVVMUWFoT0NlMkUwazE1dU01cUZhQTdUdTRTdHhZeTBMcitiOFZOM09M?=
 =?utf-8?B?eFJHWm5NSjF6NFgwYXZPTUl4UXJQajM0d1N1ZTJ2R3JCMDZ4RVZMcVpjdjJr?=
 =?utf-8?B?ZFN1WG9tMTJEUHYyRmJyMkN2aisyOWU3czc2ZjZVVVAzcG9TbzVHbVR2c2dQ?=
 =?utf-8?B?V0sxM2VtVkpObzE0bzMvYW0xbXVKb2NZY0lwOWFSSHRuS1JUb2ttZnB2ZDNq?=
 =?utf-8?B?ZTJleHQ4WThGWnNNdE9DRFVMdlJkSWhkQXF3ZVVpZS8wSk1LdE5kRnhHMUNX?=
 =?utf-8?B?blhHZEI3ZVhBd1YvdVVhZE1TUFVwbUpjaGYwcnZDQU1FUmVGcVNWZUlXRWtJ?=
 =?utf-8?B?Uk04MDh1M01KSXFxRjQ4dG96NjRLVXdxd3RSVUYxU0M5WlREU0VDZHV3VUd1?=
 =?utf-8?B?K1RSV2lWRjNSeGU1Unc5djVnQ0pHc3NHLzVBWXVoQkZ1S1BIK2FUMUdLRXU2?=
 =?utf-8?B?N2NDc2p3VmNmYitnTUV0QjUybU1mNGdjaThNckhSejFoT2hSTis1NHYycWdx?=
 =?utf-8?B?Z3o3eWJjajE3OWNobW1FOER1OUcyamovdXBudEF2NTYwS241Qk92bzdQOE91?=
 =?utf-8?B?VERrQzRlQk5LSHRzb1R4WW1zeitpMENMc0cxcUxLOEFhdlJ5SXBGc2NZL0hl?=
 =?utf-8?B?VnBLV2ZtaWdpOHlZa1RlY2l4TFpKUkxUUG9HbnpOZWE1cjFXQzZJQ2piY1VQ?=
 =?utf-8?B?WVBsc2RxME4vTlVYZnpjNTlwY1JMdnZLWU9lZDhWanlveS9wY3RIRHNsbVVj?=
 =?utf-8?B?ODh5L2d6NE5hcFdSWDB2U1htTFd6UlBWNjJxNHVWWUN0MWNNc1Fyc2QrUUMw?=
 =?utf-8?B?cU5Qd28zaG1weUxsZ2JlZDBRUmJEdHU2bVJ4bUxuMUloRklHMTNWeVpFWGdK?=
 =?utf-8?B?RTkwaS9BN05xcjJRcnJYOWNxcElxV3F5VDdxMjdZbFBQd3FvK003VHZZZVdM?=
 =?utf-8?B?WHgvaEtkaFhzeDMxNEFnWUpmVzY1SXhmNmxaay93VjZiNjBmN2Nzd2Z6bGhm?=
 =?utf-8?B?Mnd6MTlkeGVuZm53am5UMTRrSkZ4MXp1T25LT2h6Wi9qL1hxcUpNdjBrb0U0?=
 =?utf-8?B?Uk1sa3ZINTNjME1ZWEkrclh5b00xNEs2ZGo5VHdNY0xZdjY4NXlFZjBnYUlI?=
 =?utf-8?B?MU5CcnVzY3FYcmwyOUJjRTZqUUYySjBqQzVkMFBsblQvMTFza3RzYWhsRlFL?=
 =?utf-8?B?MXBNaUZWZG5IaWQ5ZEFGcUxSbGliM285VHBBRkE4dHpxamQyZ0JEUi8rNGpy?=
 =?utf-8?B?YkNBSmtPRURBb1lzbkhncTVLYzNJZjlXWkxrWGlpbDN2REIvY2hzbzl4V0Js?=
 =?utf-8?B?dm8rUXpVNCtEdUpLUXhNcUY3a3JLVGVYTEh1TEVob2gxWWp0S2tNOG5VOHhi?=
 =?utf-8?B?cUxXajAxMFlwMm9XbHhhVTRQWmR3NWpKWDk1c1VPdXFmMDZHNTNhRE9GNlVp?=
 =?utf-8?Q?k8sYdPyfbdhNY8Qsmlf7gDSAqDaR6cTR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2dtTk15YW56c3dWWmgrT0hPU2N1T2ZtWG5rU3dOZG1uL1BZaXU2NktVVUZF?=
 =?utf-8?B?NXJFY0pQVGRjQlowRWpwU21zL2dxWXIzZlRsQ2VqYnBQTnJLSW1WdkxPZHNz?=
 =?utf-8?B?azZveEkzd3N3T0o5RXBUSmY3TXorc1lmdWpLSVZpc3lNcEkyczdNdzZYZDY1?=
 =?utf-8?B?TENkTXBROGlVNDhjODZ4dlF1dkFGZG4vdndrNldOcnBORndSR0ZzMEFDMS9k?=
 =?utf-8?B?aUNobG5pOWJKQmJvcE9nUElnSHVKUjR3SHdPVDBISnV6UDlreGJOMytFMWdK?=
 =?utf-8?B?Mng1Snh1bGVqbXFWUjQxWHFTbmRvWHVjNU5zeFNwNm50SzRyTUJVb2lrTGx1?=
 =?utf-8?B?YU1LcnRrMTJUTVhnOHhBSncxTGdHTURpSUp1OHR6eE9ZYkI1YmhXVXE5eEM4?=
 =?utf-8?B?Y1psTE8rcThEL2VrZGtudURLSUFLRWttTWdwUVowSHV1RFZ5WWVSQkg1SEVI?=
 =?utf-8?B?eit5MytoV3ZDbm9jZGZqV0JZcDdRN1YyZms3aFErNTRNWk14eTZ3SlN1MGJD?=
 =?utf-8?B?UkMwSjY2V0djSmxzbStDc296TW5DbDBvRlgrN0FFSUF5VW5IVkcwaTNCTjds?=
 =?utf-8?B?YnlpalVrb0FCVWtDcnRkaGk1OXVrVnRFclpjMmhEY2J1aFQ3c0o5MlV3NnU4?=
 =?utf-8?B?MnU1K2RZVXpiOGxERGVxT3RtaSsyWnh1ZE5YOTF0Ym1yYlo2QWF5TUZkTUtJ?=
 =?utf-8?B?eWRzRjdSWU8vd2JkUDJScmJlOGdYQkVLT0QrOHIvYU5SU2pYaFJRZzdpU2V6?=
 =?utf-8?B?anE1YXZXblFxMkJuL09ZazlUR2hzeXhHV2J6OGJ1TWZLWjA1K1dlMzZkbTNL?=
 =?utf-8?B?VnovL05ibndndzRnT2xWNFdKU21raWZzRTRhbmdocjlrNXRLcVVKS1pTWWRZ?=
 =?utf-8?B?aTF5bmlDdDRxdjRqcWthM0VVdzA5ZUswcEwvNzBiQ0FsT3BybEk4Nm5rNE5n?=
 =?utf-8?B?TU9kbGl3anIvekdWUDlPY0J3N0tCV3lwbGs0a1J2dXc2SzZkOVRJd0dnWUZP?=
 =?utf-8?B?Y3ZxS3V0Nk11bDhSS1dTMkd5bGRKMm5nMjZvWC9YL2V6TW1tNjVxcWQxbXVs?=
 =?utf-8?B?QzJJTHJVb1N0RlVEYWsxYmlwS1FTOXBvVUk2amNFTVNwaE5WQ2tFeW5pSjhs?=
 =?utf-8?B?WHdrb3h0aXJnVTRvQ3UyTnkxWUQxbUd1a2RaYitlUjdSelNVV2hLTDY5ank0?=
 =?utf-8?B?ZnNDdHhOc2hvZU12SmhmazJvNXJiT01XaTN5Z2daTWpVNEdlazQ5U04zTHN4?=
 =?utf-8?B?d0Q5d20vWTdOL0x1aysvTmROQTcxNVBWZUJWa3ExU2t3b2psbzdRakhuVWov?=
 =?utf-8?B?YU9FbnhGVGlhS1Bydm53ZEhvdnQ1MklqamJGNG5uVEROeHdyM0xsNU9CS2tl?=
 =?utf-8?B?L09yTkVIM3N2UitnNWVkZ0RlcDNmWStmL3hmandDa0t3SCtubG92UzBTdWQz?=
 =?utf-8?B?TzFmdlBIYjBzRTlMRGhwRmhlQmM5SlErSjZiNzM2S3RZN1N3bXRXMzJZeWJQ?=
 =?utf-8?B?cHIxYmNtSStlMzZkOENtUi9YQU8rN2twbXBQN2M2cWV4WXl2TjJDdExhVk5V?=
 =?utf-8?B?VUVQOHI0WjFmMjc2d2Y1LzFEaHQvaDVPeGdxamd0UWwyVXJvSE1CK0dMNlhS?=
 =?utf-8?B?VDF0dzJJWXJVYkZnZDBsa0FPaWV0K3Z0aWdYcUl3K2xyM1pzS1YySjB0bVEw?=
 =?utf-8?B?dXRrck5EV3h3b2FiZklyenNmQU5XQ0h5NTRzaTRWa2hYeVJ5eCs1ejF2aUQ4?=
 =?utf-8?B?akJBWU5WcU1LWjk5S05pUERqL3VDL0pmSHFyZnRpMnc1S1BaR2RNUVRsVGZn?=
 =?utf-8?B?WWNPaldDK1p0K0pLZkhFd21HdHM1NTlmSUF6R1ZPdjNhL3o1OUFUcW02dUwy?=
 =?utf-8?B?S3gzbEtSOW1XWmh5bHMvMi9yL2tIUGVNVlhqNDEyYk80V0ViSjJ1TDJFYnM0?=
 =?utf-8?B?c3NuZFc1MytVaUtaeCtGOGMvMVkyOW0yb2ozVzVGUUJRb1NqRXNDZ0UxakUx?=
 =?utf-8?B?c1JBQlFCL2V4VDhsNmZLUXNSOWNmRk9UbzN5MkNvUkJiK29KTjRQY2h4L3JZ?=
 =?utf-8?B?Qm5uYTNZcXVlOU1wVGd0aVE1cmN3Q3pFSk5ndUppWXNkb1JDQmxpU0tEeWVk?=
 =?utf-8?Q?RHTRuxDu7G60qKW9OV/hGHK+m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45102AFB373128468EF2B2C2B2AA0C13@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e909f549-ac06-48e3-af08-08dd7604a906
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 18:47:34.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QADMdMQRU7AX56AeFcQgKFNlBTr5rq+YtMikU7GWKAuXSeL5z9zfjk3XjVFVq1EkMt1g2K9z01OI+nsD5pkvhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8428
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE5OjM5ICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IEknZCBhbHJlYWR5IHVwZ3JhZGVkIHRvIDYuMTQsIGFuZCBoYXZlIGp1c3QgcmVib290ZWQg
aW50byA2LjE0LjEgd2l0aA0KPiB0aGF0IG9wdGlvbiBlbmFibGVkLiBJIG5vdyBoYXZlIHRoZSBm
b3VyIGZpbGVzIGluIGRlYnVnZnMgb2Ygd2hpY2ggeW91DQo+IHNwb2tlLCBidXQgSSdtIGFzc3Vt
aW5nIHlvdSBkb24ndCBhY3R1YWxseSB3YW50IHRoZW0gdW50aWwgc29tZXRoaW5nDQo+ICppbnRl
cmVzdGluZyogaGFwcGVucywgbGlrZSB0aGUgb25ib2FyZCBIRE1JIGZhaWxpbmcgdG8gY29ubmVj
dCBhbmQvb3INCj4gdGhlIEdTUC1STSBjcmFzaGluZyBhZ2Fpbj8NCg0KWWVzLCBidXQgeW91IGNv
dWxkIHNlbmQgdGhlbSB0byBtZSBub3cgc28gdGhhdCBJIGNhbiBtYWtlIHN1cmUgdGhhdCB0aGV5
IGFyZQ0KYWN0dWFsbHkgd29ya2luZy4gIA0KDQo+ID4gPiBBbnkgY2x1ZXMgb24gaG93IHRvIGRl
YnVnIHRoZSBVU0ItQyBvdXRwdXQsIGFuZCB3aGVyZSB0byByZXBvcnQgdGhhdD8NCj4gPiANCj4g
PiBObywgSSBjYW4ndCBoZWxwIHdpdGggdGhhdC4NCj4gDQo+IEF0IHRoaXMgcG9pbnQgSSBoYXZl
IG5vIGNsdWUgZXZlbiB3aGVyZSB0byBzdGFydC4NCj4gDQo+IEkgZG9uJ3Qga25vdyB3aGF0IGlz
IHJlc3BvbnNpYmxlIGZvciBlc3RhYmxpc2hpbmcgdGhhdCB0aGVyZSdzDQo+IHNvbWV0aGluZyBj
b25uZWN0ZWQgdG8gdGhhdCBVU0ItQyB3aGljaCBpcyBjYXBhYmxlIG9mIERpc3BsYXlQb3J0LCBh
bmQNCj4gaG93IHRoYXQncyBzdXBwb3NlZCB0byBiZSB2aXNpYmxlIHRvIHRoZSBub3V2ZWF1IGRy
aXZlci4uLg0KDQpIYXZlIHlvdSB0cmllZCB0aGUgcHJvcHJpZXRhcnkgZHJpdmVyPyAgV2l0aCBB
ZGEgR1BVcyBsaWtlIHlvdXJzLCBOb3V2ZWF1DQpqdXN0IHVzZXMgR1NQLVJNIHRvIGRvIG1vc3Qg
b2YgdGhlIEdQVSB3b3JrLiAgR1NQLVJNIGlzIGp1c3QgdGhlIE52aWRpYQ0KcHJvcHJpZXRhcnkg
ZHJpdmVyIHBvcnRlZCB0byBSSVNDLVYsIGFuZCBOb3V2ZWF1IGJhc2ljYWxseSBkb2VzIHRoZSBz
YW1lDQp0aGluZyB0aGF0IG91ciBvcGVuIHNvdXJjZSBkcml2ZXIgZHJpdmVyIGRvZXMuDQoNCklm
IHRoZSBwcm9wcmlldGFyeSBkcml2ZXIgd29ya3MganVzdCBmaW5lLCB0aGVuIHdlIGtub3cgdGhh
dCBpdCdzIGENCmJ1Zy9saW1pdGF0aW9uIGluIGhvdyBOb3V2ZWF1IHRhbGtzIHRvIEdTUC1STS4g
IE9uZSBvZiB0aGUgTm91dmVhdSBkZXZzIGNhbg0KaGVscCB3aXRoIHRoYXQuDQoNCklmIHRoZSBw
cm9wcmlldGFyeSBkcml2ZXIgZG9lcyBub3Qgd29yaywgdGhlbiB0aGF0J3MgYSBidWcgdGhhdCBj
YW4gYmUNCnJlcG9ydGVkIHRvIE52aWRpYSB0aGF0IE52aWRpYSBoYXMgdG8gZml4LiAgT25jZSB0
aGF0IGZpeGVzIG1ha2VzIGl0IHRvIEdTUC0NClJNLCB0aGVuIGluIHRoZW9yeSBOb3V2ZWF1IGNh
biBiZSB1cGRhdGVkIHRvIHVzZSBpdC4gIA0KDQpQbGVhc2Ugbm90ZSB0aGF0IGFuIHVwZGF0ZSBm
b3IgTm91dmVhdSB0aGF0IG1vdmVzIGl0IHRvIHRoZSByNTcwIGRyaXZlciBpcw0KaW4gZGV2ZWxv
cG1lbnQsIGFuZCB0aGF0IG1pZ2h0IGZpeCB5b3VyIGlzc3VlLiAgSWYgeW91IHdhbnQgdG8gYmV0
YSB0ZXN0DQp0aGF0LCBsZXQgbWUga25vdywgYnV0IHlvdSdsbCBoYXZlIHRvIGJ1aWxkIGEgbmV3
IGtlcm5lbC4gIEhvd2V2ZXIsIHBsZWFzZQ0KdHJ5IHRoZSBwcm9wcmlldGFyeSBkcml2ZXIgZmly
c3QuDQoNCg==
