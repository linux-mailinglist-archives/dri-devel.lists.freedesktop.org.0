Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F3B58EAA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 08:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143E10E690;
	Tue, 16 Sep 2025 06:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="RezSnPPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011003.outbound.protection.outlook.com
 [40.93.194.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA1E10E690
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 06:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWXYXuAtL2u8m9k2wAs/XIGU1OXeYiCWSRJPG6UPS79S+J6cFw5mmuVaqzev93qFHD8AqoaokB0Y/lI1LsF4J8OKJpp1l9Bg94PJS3VFJ4wWTUYYqzacycET7lcUW5ofu9bYASQdigLgRL0bHbqx1+U1p/TTu6vUQKoK29OCDWhlh7jCv+lMLi5h8H4AiVR7SBRXxNAk1fUVLdkV97XjNw9JssbnlTuqKiyPhzQ8Zs5h9tHu+6ubKqkFvA+LFGHJhVl/hiOa80dAfY1eaKAgl7kGZI4Ogocb6PGnrDHcv6WVAlF6dbH0w6FL+dtWB3hCZb9S30lXFrVa1ZP6ioZieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJBRf7uLYCDr+15ZQA5QcdvdwNl4QKAf81fsPTbtbSQ=;
 b=ax1IT8uORHI+1SigeRW54lRNLrNe+YYgsqJiSxNLopBV9Qtp2zE/cWStCR4MwMT3NAEf3TWukx0Vhib9+c7F+Aq+9GjwLQpVr3tJQZGYy8i5XtB9dnm2THArG+O3fCTD4HzEC/Vb74OE8MFUYRLpRu+YFgK3DbxogL/EJIIeaSWMVVYqzQLCqIz6p1+qgLyJU8dRVhxejasL9WhdwsBWZlMckatu6vrfCOqyMf6JPMwUYCYJYGFuLfXUOzS/ySAbayND9xfFXPqGUnu5OZrc3dlUctBahHibXjUJA7xD7Uy1sPiYluJ98j1QxV/2wbSz7XFNCVEaO0ECnG5Pyg5c1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJBRf7uLYCDr+15ZQA5QcdvdwNl4QKAf81fsPTbtbSQ=;
 b=RezSnPPRBd2QrHX2dA56ctXXa2SLxrzuRzv0Ro+SkmmmKCN8NeH8MAB8q3Zd8cDVgArzXtcejh2wtnhyrG2ILy+vNm+bdxGH0t8qZ82JGHcNbEHh5EGAZyCj9vWTAG0jm24dUckHazBlmf3sfiPEdl904bmiRWqdFiq2ipPOGfFt5rCq5ReUuV/JkuZ2f9RE/xIKWm6aTaVQc5uQa4+7JwEzKlV8PMxngIBAlXjvpXxNZJu/MnK7edBk4821yul+5H9jFw4VUyRXn2H9tY2SkukMMoTgJHNCQfIAK0VQ6A/mRXMCK2lAf9+YUn+7iRZ6sNxlYrIjeDC46AzuLrOaMw==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DM3PR11MB8758.namprd11.prod.outlook.com
 (2603:10b6:0:47::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 06:52:32 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 06:52:32 +0000
From: <Manikandan.M@microchip.com>
To: <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <Dharma.B@microchip.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
Thread-Topic: [PATCH v3 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
Thread-Index: AQHcIXzjwEv1ZVR/rEm0ZGEqVOKfi7SVafiA
Date: Tue, 16 Sep 2025 06:52:32 +0000
Message-ID: <233730c1-0c70-4dee-99e0-d2c6fce386b5@microchip.com>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-15-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-15-1c7a7d960c33@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DM3PR11MB8758:EE_
x-ms-office365-filtering-correlation-id: 6480fc62-7387-46d1-23c3-08ddf4ed9c7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MG9yVmNobzVoWCtQakoyeGUvSk1NdXVrVi9EajMrWkVWMVRCazJmTmpEMW5X?=
 =?utf-8?B?cXprUWZWa2NsNTZHTExLM3h1NlR4cDRLTEt5VFBkbUN4ZGZFRXRYa2daWm1z?=
 =?utf-8?B?OUJvUlkreVVQVGlVdDdEZTNoNWY3UTNpRGx1Nktldyt3K0lGV0xkTnJtdlBP?=
 =?utf-8?B?ejlJRFpIOTZzOHBIVEVSb092QnlHa2VwUjB1ZEpQZ1V3blBHZ3dtN3Yvc1JC?=
 =?utf-8?B?WlF6SVhqcnFFRkJ3dS8yR1dSVnc2YzYxY1A0dmNOaFlWUUU2WC9TT1VJTU0y?=
 =?utf-8?B?L3BVOHRmdUEwc2IxTFQ2bGRtcFBqZUdMc3FXZmVwYmxNQldESXYrYTljakpN?=
 =?utf-8?B?ZEs2M0x5M05iYjVKQkNXbm5zcU84ZmVydW5CYmhVVGJRSTBUZDNpaGlQQml2?=
 =?utf-8?B?QVZXWTMwdjhBaGVmL1pIbVYrVGJaK0hLcllwZ3Zjc21GY29KZGxsZkhwOThh?=
 =?utf-8?B?cmNyMWJXV3BDOTdlQzdSenk4bDhPeEVvS0draGxTS3ZYai9RblVpYXNEU1U4?=
 =?utf-8?B?cHE2cFNaUkRVRiszaDcwVnhTbUNqREtpZmRWL25iQzBEbWsvd2pPakVkUkJS?=
 =?utf-8?B?cVRiL3BDVkcyZG9xZy94QmRmTjZvQ01IL1ZhVlVCNlVrL05oSUwzcStVeXpE?=
 =?utf-8?B?NHhoNG45QjNyaEpDQUdOQzN1bHZxZXFCSXlRbVUrTThqblZzdmtpRFJKVVlI?=
 =?utf-8?B?NGZld1lDRGNhYjJIZ2FtM20zcTZ6RFc2RVlreWpFWU9sdU9OV05NM1pET2NX?=
 =?utf-8?B?QzdkbS9YUld3Slp0NzhVMzNqSTd3OEpDQW5VSDdYOUFCY2pmSVRGWkVqVlo4?=
 =?utf-8?B?Y0EzOUV2NUVvSjBMODFCMW1EblVyZW1wVHZvMVJha0NTamlteEZFTUcvOHFO?=
 =?utf-8?B?a1JrSnU1YjFkT21xc2hMa3M4aW5iM1dnZkZkWk5zN1lCcE95Y2tZZEFZVzVu?=
 =?utf-8?B?T1RwYWh3WW1La0RKMVZWL0IrMzNFY0srVzhaV0NIc2wvNE1jTE44NlphTVhn?=
 =?utf-8?B?NElxa0RjR3FxT01uZkU1VHk0cmFYejlGNzg4c2hjM1dMbUR2RElMa0VoeENK?=
 =?utf-8?B?L3JXaVY4RmhhRmM0ZTAwOXpHL0FwSHp4cU5KOStmSS9ENUhWZjNJNnJmVFFx?=
 =?utf-8?B?NC9BeGZtSGRzVnh3alBVT1lucno4aEpWQnpNY0pTMTkwdWNYNWp4Z09yRGVS?=
 =?utf-8?B?MWFTcXA2QXJlZDJWOWRvdGxSbEtpaHduTlRtM3J1VWpiUDhYQi9iSnU5Z1FW?=
 =?utf-8?B?V3ZuaW1oc3hJaVNzZWxOL2dZQTcrYVMrdmYvcVFXMW5pMTh2cXJrRkFZa0FS?=
 =?utf-8?B?akJyNzFKNlVCUitjL25EekdVMkhpdWVSRldXZ0hLcUVrdUZ6cVNxaFdYQktn?=
 =?utf-8?B?QUp5VU9EK2hrVkJTV21pKzZpMFVzTnd4TTVhcXA5ZkRBNkI3V3puQzJQbnNr?=
 =?utf-8?B?VThnb3pqZGVPNmc2V3N3QmQ2dDBjQ2Mvb09nN1JOZWJUb29vYjZsVkg5ellG?=
 =?utf-8?B?cm8yeFpCWkhZNU5rWTJIcWVyYzZaWGwzUjk2QjZObVM2aTBrcDl6R3VrcmVY?=
 =?utf-8?B?NXFWMmdLeHV6VnNHSzkrVjNZeTNFQ0orU01ZYWhNNVpWODFxNHE5a0RLMFNE?=
 =?utf-8?B?ZmplT0JrTjMvclFNTW1jU3dEL2ZaZ3JZWXJjOWRidkRWb0NhRVdEQ3BzT2dp?=
 =?utf-8?B?K25LOHNXWUx1dTRJd1RUc1gwdlNWWlBJbGFkZXdpbldIb3BrSlRUYUsrYkJQ?=
 =?utf-8?B?TFlJMUtWNDlKSnpUdzhMNjJUNUpJTXA0dHBhZytKQ05LZXV0WjQ2MkQyaUVM?=
 =?utf-8?B?MEpuSzBQUldyNXJoNHRadG41cER1dUR1VkJURnF2V2VtQTVZelBoYTdYeExF?=
 =?utf-8?B?RlAxNXFqemJmeGhJc1FqM3hYRkduUXhrQzZEWUs5UXVESHNhdTFiN1VPQ1Zv?=
 =?utf-8?B?a1BHZmU3U0pPT2hyQTVnTWh5eEdSQnd6ZUZTUDBZZTlYOUltd0FlR2p6cjh6?=
 =?utf-8?B?ZHpNeVRpVUpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFFsOGU4OEMzUGFwa0NRREhveUM5SjRsOHNyMDFtRk1LVU5QY1JUUmdKTWk4?=
 =?utf-8?B?QVZLUjdVTXpyY0l3czd1RTlVbVp3TzNNeTNxaDlHOVpUN280Nm85MHNhL0Zh?=
 =?utf-8?B?RmUvWjQ0bFh1NGZkQk0zTWptMnJqZ1JyZUhlUTNpTWw2ZnV4MmtiRkdmZnBi?=
 =?utf-8?B?cVg5cjFDNmtMQ20xMEZ1T2creDAyYzBET1dZUUVTNHBVc3ZDbTQ5bGdmN0hw?=
 =?utf-8?B?VUNjTDlNMTZuS1QySTRocnk2Vno2cU5FSm11SU53SWNrQ0JtbmlNUnJiL0xN?=
 =?utf-8?B?SnRqSFV1KzFZejY0bjlxVk1KeW1EY2phZ1hVVFZKdFBWRmFldWdOT2NrcFJs?=
 =?utf-8?B?NTQ3ZmMrL0dSSWQ4QzB3MCtkeGYycURmaXpBaDgwMjR4eWpMV3c4cVVMeWFS?=
 =?utf-8?B?TlNRaHZ4YXkxaFliK2hXSDdIV2plWENCOXkyQ0lEUEdVa2FhRGtGRTJyNksw?=
 =?utf-8?B?UVAvWVFyeVFvaGUvNHZ4cExVK2kwMzFmR2w5TmNRWXg5U3YvdVZsaVJoTDVu?=
 =?utf-8?B?bHo3UDBLYnZESHpWZGR3UDdRUXZPcS92Q3dVdVZDTE51QVVSa1NnOFBwUU9O?=
 =?utf-8?B?bE94ZTdUN0s4eXJTZGZtMzNtd0NLNFVFQUcyaUNmdDlJMGY2bno4MTc1bVp6?=
 =?utf-8?B?dkI0RTNjd05UM2hDUndtUWNrdEVWWWVNSkdRVHZnV1Z3Nk94NmpNSnozTGI1?=
 =?utf-8?B?Z1pic0JSeU54SUdINlBWVjduYVlEOXZCVHBPNFIwQWVwbitlY1FJWFRUTzds?=
 =?utf-8?B?OU5GdUUwakhGVWFsb3VpdW96aFljMUNUNS9FTzRIVlI0N3FsZkV3RDg5SkQv?=
 =?utf-8?B?ektBSFdVYnRaK0ROTHFpUXplSjY1V250dG5jYjRNZG5jZWFLZGlQR1hMNHZX?=
 =?utf-8?B?dkkxV2hJckpxTmtDK0lRbGVnWW9LZElpWmovQmlzOTI1TXF4T2dEMVRabGxN?=
 =?utf-8?B?YVZmcnY1MXBMOGxWMmxaNkxJVDJuMFkySUhZMGtRSU5mTGI4LzY0SGk1QnV0?=
 =?utf-8?B?b1V6Q1hHU1VFVG04THh4eUN2bDdreGNyOUVIZnBBaWVSZXhuUXdRYks1eVl0?=
 =?utf-8?B?YVI2SWl4SlRrMXZ6Y3I2RnZsbkpTR3h6OVJWQzc2L0phRFJJVXRSdWllKzNP?=
 =?utf-8?B?Q0k3bGVZZDI4cEFodjFYUU5LZWZnU090SWo4NVJ3RzBwMWpwTG05eFM3eFdu?=
 =?utf-8?B?V0RuaUIxMnhhN2R1TzY2L214bXJXc1MvbmM4QXowYmhrSFV3aXpvRVdZbnhQ?=
 =?utf-8?B?emF0MjlvZHNHcGdsa0VHV1F2YVZmZ2VnbHZ1ZWdIYjA3VFdUYXlqMWxpMnpS?=
 =?utf-8?B?WU9DcWpJWThodU8xWURjdzk3ajMxM043YW9pVGxXVjYySk0wcUQwMGUrcVdU?=
 =?utf-8?B?b3BiZ3ZvQUtJSFVLMTh4NUhDalh3WlVya25FbFU2NENvVEVKNTUyT0trYXVs?=
 =?utf-8?B?Qi9MeWtXYzVxQ2M2YmJFanp0Myt0eWlmUWlKVHovQWhJRkloNFFhUy96NGlz?=
 =?utf-8?B?VzlNa0s2MFhGdzRnUHAwbXpPaHZvV2FBWXBJeENCWTJZVjhuU09WWXhWMXQ4?=
 =?utf-8?B?WDFuQTQ1NWRDdk4vNENoNmdsRWppUHZZSENLQ2RIWHhVYUh3WHp5Ny9DRTFo?=
 =?utf-8?B?dUttWmRmOC9XbjhiaEF3NGxIMm1vL3kwSGJwNW5yNFlaMHRnUkVwTUt2RFhT?=
 =?utf-8?B?bkpST0xHVUEvb2F6bDVlWDNQNGlNcHdzdkRMS05iMWMycDEyaTVHZEphTzZJ?=
 =?utf-8?B?cUQ1M1BDK0oycW1QOW5kblZUeENYNTBXUVovaHE1QzhGS3U5M2ZUZWNUbE1N?=
 =?utf-8?B?UUdFYXB0cU5hUkhxRWNYenFGeWFpamhWZVdSa01UeG1nenlUQW1HMHBJU0tV?=
 =?utf-8?B?MVlrOHBMeGVrSjZZSWU5TGltanpUUzhEUVNLYjJteXFJRGJVVjArYlNEQXlo?=
 =?utf-8?B?cHRHMWNaU0ZPV3FCNytaakZSampVYmNnTTBnOGZIYThWNlFld3Y4dzlMVnBM?=
 =?utf-8?B?VTFUTW94MTIxc3FBSUJRYU9WUUdVMGFVNmhITU9obVROMnNiMEhyMWFlU1c3?=
 =?utf-8?B?Ykh0REF5eUNwbE1VNXp2Vzd3UUNmNmFRYk9meTFtcFVqM1pJTCt4MDdxV2FY?=
 =?utf-8?Q?Pm5sHmhPkB0aFGdDBevxygJlT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <217F0F9C1D437142AB7AD0F0FF21CF84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6480fc62-7387-46d1-23c3-08ddf4ed9c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 06:52:32.5853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHEi2pRVjZ+ReQwo09hZG9f0fjG7cykTpWGNpCATlbKmY34xXf3OqZFb6/jep4vnDGpPpf89cpcjSPZUmBLZixqYpkD60IIqbRukfdhvwMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

T24gMDkvMDkvMjUgNDo1NyBwbSwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgYXRtZWwtaGxjZGMgYXRvbWljX2NoZWNr
IGltcGxlbWVudGF0aW9uIHVzZXMgdGhlIGRlcHJlY2F0ZWQNCj4gZHJtX2F0b21pY19nZXRfZXhp
c3RpbmdfY3J0Y19zdGF0ZSgpIGhlbHBlci4NCj4gDQo+IFRoaXMgaG9vayBpcyBjYWxsZWQgYXMg
cGFydCBvZiB0aGUgZ2xvYmFsIGF0b21pY19jaGVjaywgdGh1cyBiZWZvcmUgdGhlDQo+IHN0YXRl
cyBhcmUgc3dhcHBlZC4gVGhlIGV4aXN0aW5nIHN0YXRlIHRodXMgcG9pbnRzIHRvIHRoZSBuZXcg
c3RhdGUsIGFuZA0KPiB3ZSBjYW4gdXNlIGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKCkg
aW5zdGVhZC4NCj4gDQo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8
bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQoNCj4gLS0tDQo+IFRvOiBNYW5pa2FuZGFuIE11
cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+IFRvOiBEaGFybWEgQmFs
YXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+IFRvOiBOaWNvbGFzIEZlcnJl
IDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8
YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+IFRvOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19w
bGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMN
Cj4gaW5kZXggNGE3YmEwOTE4ZWNhMTllY2EzZmQ4ZmViZDFkYjFiMmQzYThhNmUxNC4uNTliZTVm
NjRjMDU4ZTJiZTM5OGYyMDdhZDQzNmY5MjIxMzVhNWFkMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4gQEAgLTcxMiwxMSAr
NzEyLDExIEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fcGxhbmUgKnAsDQo+ICAgICAgICAgIGludCBpOw0KPiANCj4gICAgICAgICAgaWYgKCFo
c3RhdGUtPmJhc2UuY3J0YyB8fCBXQVJOX09OKCFmYikpDQo+ICAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7DQo+IA0KPiAtICAgICAgIGNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9leGlzdGlu
Z19jcnRjX3N0YXRlKHN0YXRlLCBzLT5jcnRjKTsNCj4gKyAgICAgICBjcnRjX3N0YXRlID0gZHJt
X2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsIHMtPmNydGMpOw0KPiAgICAgICAgICBt
b2RlID0gJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGU7DQo+IA0KPiAgICAgICAgICByZXQgPSBk
cm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZShzLCBjcnRjX3N0YXRlLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMSA8PCAxNikg
LyAyMDQ4LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJTlRfTUFYLCB0cnVlLCB0cnVlKTsNCj4gDQo+IC0tDQo+IDIuNTAuMQ0KPiANCg0KLS0g
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
