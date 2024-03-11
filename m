Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C710787803E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9252810ECB2;
	Mon, 11 Mar 2024 13:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FxFeWB1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114810ECB2;
 Mon, 11 Mar 2024 13:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muLWfc1nKeEsZPI2By8UKAOzcuK6sQhO/ka8dX/CG6jvkrQbmX73XFBRIuavzrVk+deZDqVXyz+23jXtrstjgZQp1sgYm/7fmy8jyPe8DT2oBevm8acLkKsuN1GK3MQMqF70jJ8IoGnGMI1WWhRyzewWvIrPxxAeUm9A6Uy3uUJE1vhkcQyy5r+e5l5jYDN4mtFDw4ySRWeTR+wne3DoWEaiA/8QsjUtTPlCJ+UnwXW1TvC5oJT9YdMt8J9AcKRharZgxgyu7U+NcbJaI6OiaozHo1cA5VyOb/kSa1aLSiVHBDycFI36Od1mva+7GG6ybkKstcTWMglmwHEMI8Tl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0jLPtirJY+RE7dg7moUnP8VqbgTqovX4QWHm8XyecU=;
 b=E2SU6drup+IybkKsB7di6hB8KqM2ayVuHXDpZv8XEYHmmeGoGfr4D2F0PeWxt6zTM5IZ2ajC60vtXzIHnedcKUJyPxzm4AoMfoJiuE0ixaKICk2ppexzBnbIi7zTe445uy5bSfc2HrIr/e3vUGFAxIlVcvl+/Zq4Om0w7XtzHbmsthSqhmQQanpm9h15E3/FC8Vc3ZePPeoLk2Y3cNbrL7+5NrNIwfq46BpMbAFzQGmLyekTT7QUxlkB1fKnxcXmA93TlIp/yhClbRMJ5+haodK6fBPnBWcW0cfxmpeesA1PsxGzaa6I589CScpTPVBMFMezr2E8Oi7EjZuVvrtSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0jLPtirJY+RE7dg7moUnP8VqbgTqovX4QWHm8XyecU=;
 b=FxFeWB1IWvTi+th+T3h7MZs1WZ+jMa/Ib19oo0rZukTeq2Sc3RFqnIyxrZW/pW2efIlTHSLomMuTyDSS1CjSWF6j+wpmWtQfMggP9OndlGWLfrxtLvIrZdyjWfHNa2gVhwobErJtExPsb5y4YDHYOzF1NoWlIYuOQCCORzAkY68+Lg1Ii64ff5U7gVfSSNLffqi6Zq4HWud2kOfFVItkoi8ktF31zcT/SBVi6OY/ZzJW5rta+jk4C3nhQcLhUX0zjv9D5DLuWtFaMiLkOkMcpn7aNYGW7Tz8y7QTStBncp/3OiyVq2wWnjQoT6nPk8HF7NkN2mZBKHA4PIUP1mc0Qw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 13:02:50 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6%5]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 13:02:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Subject: Re: [PATCH] nouveau: reset the bo resource bus info after an eviction
Thread-Topic: [PATCH] nouveau: reset the bo resource bus info after an eviction
Thread-Index: AQHac4SqlLf21l6PrEujF/m+IOE2tbEygcyA
Date: Mon, 11 Mar 2024 13:02:50 +0000
Message-ID: <cb0550d573676489954d3f7f241dc291bec0205d.camel@nvidia.com>
References: <20240311072037.287905-1-airlied@gmail.com>
In-Reply-To: <20240311072037.287905-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH8PR12MB7422:EE_
x-ms-office365-filtering-correlation-id: 349f22c8-bf16-4d31-eec5-08dc41cb8e62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DgEKRHvL/jAcJxThIQpMVhnYG3f8Shiz0FCyRDT6hrbBgdvP//rJLLcPkLkMVi91RsfQM320/Nzr4reQZRxjCOx+QN8xv6R3E+OKAPkOaZYzbmGIkUG+PL1eGX0RqE5bzn43rEK/pwnD3uepC2G8Lq0Mo9SSpMrhf90qK+TkwoZfiCDj74ouvhxbsZa3pOf9dHf7AfPVy2TnlzzNXJnAYzOMXe4jr43XswGROsTiec7h9lHHwWSgLmhE/Sy46kAgr5DAwfgZSpcTbG8E26x5tFIQKpL1f2jFDB6IZC+tTRy/5csTVT59B/O4WNncXEeo7C/dxDrUW/Ig8+gGN4lsOrhwiz7wTKVspzpRBQ27b+iVuVOM+wdT+f+JwS69ZlyylIUfMP/6nMugtTWWLMZVIJRKUT9jFgOc0EAp702RGYUv6RaCgc6173YlpS17gUKk7Kerj9zeci0AjCMzqEk8TIOauax6p5t2xFojtOv174WNQ8l5Wrsq5fhUTFjoqhQtoDCNy2DV2bOI8LxBtdVhDqd6V3cGXicEXiRTitk2q/11+YqKsGK5bhGFuZ751evG82K2m7xVU5tuv2bkFOYX904XbfukB6PyVCa5nO9HFTmhqBQTDgAcIfH9Xkz8MwOhy2gq4Hs/gkwYUSnks7LffL+Z6ZR2RNvAGhP6+C8GIx/W0g2dTuKlqzCDdyD+hpF44y0W9f1/JKRykD0DsmuODpcBVD9fxCEA1veokOdBzTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3k4ZXB3cHBWeWRHVDJzV3krWloveisrMDhsTktESFpUS1hHKy9jVXJBTnFp?=
 =?utf-8?B?cEl5RGM2YjJ5VTFtUWVjRHZ1NkZEMGI0RXlvY2JLM0QwQUhoQUtYenFNSFYw?=
 =?utf-8?B?eFdvN3V3Vm1aYWhwcEx2dUduYVlYMFRKVGg1cHBYRkdhTWVNSlVBYjRwL3M3?=
 =?utf-8?B?c05Md1FQRWd6NVYrRHdZdElZNVNMckkyUllIMjBBNDErVmh0MUhtLzRGUHdn?=
 =?utf-8?B?N0ttTEdrcGRhdnRkRXQzTi9nMWxBdHVzMllYZDc4Z3NiWU1MZmxBZVhEQzNw?=
 =?utf-8?B?MzhicG9QdHpPdU9FTjJtZWF1NzN4Vm4yVlVubk1sQVlSbG9XenFscW92MzFI?=
 =?utf-8?B?Ty95cXNiZ2hXenNQM3hza0JNekt3U3R3QThkeXZQN1FGazR5c1BhTVVDOXBh?=
 =?utf-8?B?dm10TXo1dWNrVDJyVkdYTVRZeTlzeklzdkpRa0Z1bmtsMWkwb2hPMjM1NHg2?=
 =?utf-8?B?a2F6RUJoVzhmdkVoTlJNa1R2MzRlQytydGprTjk1SURPdW82dFlwbjJoclhT?=
 =?utf-8?B?SlIzbVd1TC9HT1djeFNDV2p0VkZnSnk3MjVKcTMzNzlTajVuUU45blVkZHV4?=
 =?utf-8?B?L0JJUklsOEdUbHg0czVkTXdYMmZjZ25KdDNFNm1IQ1ViWkovMTRrSWpHUFFY?=
 =?utf-8?B?dTRxY3d5Mm9VR1VFT1VUUW43T3JXeURiRFVHZFpsQXZsU2I1TW5ScERLV01m?=
 =?utf-8?B?YzNpR1VjQmtrZW5taVRza0FwZksxSEkwWXE5ZE5hZ1hNU2JYRDFLR0N2d3Bt?=
 =?utf-8?B?eE40MGhaN1RuOWFtK2Q0WFo3QmlxbWg2Z0FScTRPUk9iVWpPMThkZHo4NjdH?=
 =?utf-8?B?ZlRySVdNenliZEc0aW15SUptaGJoZDBLaHBWZ2ZTVm1nekNjdjJHU2hTOGM3?=
 =?utf-8?B?anFjRldhRlptYXJ2S2hvTDhid3hHV2NPYzJ1MzZScjdjT0FENGQ1SzBoZ01o?=
 =?utf-8?B?MVNab0xSOUExTlB1SmdTYmFtbTJLNDk1SFQ2NW5uQjlxTFl5V1BpQVJrZWYr?=
 =?utf-8?B?SmhKNHV1OGJ3UzUwWURxTktsYXE2cVllVEZ4SVhEWDgzc0J3bFNJUFQrMUNT?=
 =?utf-8?B?UG45QVkxelZ1Tmc1eHZuamQ2SVdhaENnWVdNcS9rS3FOYVdyNlMrb0dOSzlY?=
 =?utf-8?B?b2hwOUQ0NElTQVBPL0hYVzk3NXREMXY5SWtKbkxFVHRTd2NQc3p4bHphaHJt?=
 =?utf-8?B?Z1hWbTBKM2lubmkyS1l0bTNWdmdPQ2tIeXlRN05iM3RBdjNySEZ2aTc3S0Zu?=
 =?utf-8?B?VGNQNXdMTWt4TStlTzlndDU2ZkV0NzZ6MU56Qzl0M0NqeEt3RzhPTHdFb3Nk?=
 =?utf-8?B?R1hoWnl6S2o5LzFqN0F6emZaWG94aXNtYjVRczBQRGZEK29FVGE2eHFFWWRL?=
 =?utf-8?B?SVNHa3FTV3FITzN4QW5Bd3VoR0xJaEpMR2NLQ1NwaGE5WFpyR0xnM3E3aG9D?=
 =?utf-8?B?Sy9CYWpGc0VRV2dLQXFVdU9LSkJ4Q1NLZUZFVXp1OERjaGdYbDJrOXk5emxX?=
 =?utf-8?B?OFVJQWw2YUcweEVPN0lTM0xta3cyVDY5b25FNENqczdydC9vZE1zL0NmSVAx?=
 =?utf-8?B?L2tUUDd1dHhJZnhHMEYvSFlPR0hvVE05L2J2NDAwbHRqaXpJUmQyWXNjczBz?=
 =?utf-8?B?NlByUG92NEMrSTBEQm1VeHhwRWpDdkt2QnF2N2hjTnI1eHpQcmRVcVpmOGNG?=
 =?utf-8?B?VThPdFo3V3pCMTRXOUxmU2tySnVvdFMyOCsyZ3U5amg1NkhTaHBsWjBIT1p6?=
 =?utf-8?B?YlovellMUjNKcmJwazJFQVFjbWxacys5dW9HckdjVzdPeHV6alQyOWxQZHZW?=
 =?utf-8?B?N3p3Z2swcmlRazBMVGpEMjVZWmpBVHVFZkQ5UDVPQWpyZGxya1VGNk50bDls?=
 =?utf-8?B?ZHZ4VnJzTkZ5QXpOQktiQVhQd1RVNFRQNTVUUXNtcTNaajE4VzNxaW4rcVM2?=
 =?utf-8?B?RTR4QVlsbnlmcFdnSGZGNHlmNjhjdEtlOG5VOFBUeHZpMHcybUZXNXUwdG1V?=
 =?utf-8?B?ZTJMSE81NWxHN2tsZ1VraWlHclh1ZUtVS2FqTHllMTIzY0RjaGVBUUx3RTlP?=
 =?utf-8?B?cVNKWGhRTlpUQ29aQVlYaGUrcEJ5Rk43bVZoK2tuT282MWppVHVIU29vYXov?=
 =?utf-8?Q?hm7/wEn4qOew7bzM+Sv5ghOZo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DED9E7472D44D48A223E0345FDECB52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349f22c8-bf16-4d31-eec5-08dc41cb8e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 13:02:50.2588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHh08UZOAWUTwwV15QHWDPcwePhXfjSyDaJ6X+xcoYVGhPSJtjZOE7iHJ1KLvTIkSLUtnZLVAbdhjYkXvEounw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422
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

T24gTW9uLCAyMDI0LTAzLTExIGF0IDE3OjIwICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
TGF0ZXIgYXR0ZW1wdHMgdG8gcmVmYXVsdCB0aGUgYm8gd29uJ3QgaGFwcGVuIGFuZCB0aGUgd2hv
bGUNCj4gR1BVIGRvZXMgdG8gbHVuY2guIEkgdGhpbmsgQ2hyaXN0aWFuJ3MgcmVmYWN0b3Jpbmcg
b2YgdGhpcw0KDQpUeXBvOiAgSSB0aGluayB5b3UgbWVhbnQgImdvZXMgdG8gbHVuY2giLg0KDQo=
