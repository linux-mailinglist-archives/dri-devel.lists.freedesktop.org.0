Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF78C3E2E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 11:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437B10E1FF;
	Mon, 13 May 2024 09:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="rJQRJsq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9428F10E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTxDjA3fTeY2OmciMBWgMDLW31TjUm3MOcWwFonM/trhbqi8zd8NXoVAKOAtd+tu6N/wA45PjF10FxEyxTCwW+9aGpuSeibMckrsNzLrgKA2OpaAFfl7/XZB7BJlbLI+VjAvYZTWG/8iJMXovgSNisy5QosPdYT3+56xD9VVB4SLsbDXhbfU6uRSB8l2dJJ5TGx0s1jTBATfXt0qB+hJl9HXVZBn1acw199/WXnkaDqgrxWKYUHI5+NVZHxNdxtc/K6pmAbnIly2bKW0LsVnoX3Dsz4AoJ6IU7v/uOOgWs+GJPUM/1rFxpkEsctGUwOKyPaJn9S7hhydrOcFPEvL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQSBYGRbO3LTSAqLwG5yYPHo6PBSW5pDoltAkWMOVJA=;
 b=HA5T/Iyfr9Rjvr9WM0J1VSieRE3jv3mXEVK34UuGhu1IKk2vQOjdvT4voX8W6uTS0PDOl7W0QfMhsOrCvuxB1Bn4SPpFsXsw16o4mcqf2DIndJoUQZtIZCQnu2ovm/1ic/Xv8+D0G4qgDA5q4TahpF8b0THLeZWGJbnszW6aH90JOh87x1TtUTSfsNKR69Q5x/or7cPx1xVfU+oJJO922wbzigXnf7Wqna0ao9tEVnj9X+T6VXaFwlTGOun5fTESbLrGltNQStqtB4VRSk7jd+FG2b/bSx6boli6LWUOa3wd0cXL5TIeAMo9igSWsodBXxy3GOd8nvHLDVgRAnFZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQSBYGRbO3LTSAqLwG5yYPHo6PBSW5pDoltAkWMOVJA=;
 b=rJQRJsq5WUF2QqcbbfiXpZcweowxTH7ybUjNoApb4U6C0qp+RrkAHxr76/taO7n2O5QMQuY0+BtSn1tYsdAyuyVRF64XMW66XYqtC1KZskKmnmYxmsXTdRDjXO+w64VSVKK+bmp/8Ijz8Md5tw05ReS4/2W+LfB/3eVorFdjdXw=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by PAXPR02MB7312.eurprd02.prod.outlook.com (2603:10a6:102:1cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 09:34:46 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 09:34:46 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel
 <kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: RE: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
Thread-Topic: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
Thread-Index: AQHakZjqxmgDfsPuIEK+T0Zct7BqebFupm0AgAWz0NCAAHGugIAgPbKA
Date: Mon, 13 May 2024 09:34:45 +0000
Message-ID: <PAWPR02MB9281B32E144205CCEEF0C53D9BE22@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
 <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
 <PAWPR02MB928111F5EEB4A46B56A89B239B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <29352160-4943-4271-97f5-34afd6f35df9@linaro.org>
In-Reply-To: <29352160-4943-4271-97f5-34afd6f35df9@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|PAXPR02MB7312:EE_
x-ms-office365-filtering-correlation-id: 5856e1de-1d88-4d36-3591-08dc732fed17
x-ld-processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?c3VaMUhPQzRxTFRMVi8zeDdPZlJmYlFPbXkxUFZ1Z0FXWE9iRmpZcmtOcXRC?=
 =?utf-8?B?WkpTUVloc0h1SFhCRUFXV3B0UGxkcWQ0TFRhYXVBcFByTXFrd2FkVGh4Ty9i?=
 =?utf-8?B?bEVSVWJiV1FXU0xzVm5KcmRVZVNMNnhseEl6NWsrUlBqQkdNQXE4Ty9pK0Ez?=
 =?utf-8?B?ZXgrTjJ0Y3k1RGtFKzUxczl2Szh5b01kOWVCQlk0YTMwVUdYRkNqbjJCN2ZN?=
 =?utf-8?B?aDlwZkwxb01peXdQNTVIanJySXBsK092ME4wTWpVUjNuV1JPRk5KWEhEQWdw?=
 =?utf-8?B?ZThEVUJtQTBONTY3dHFyREozeXV5dFlHTlBpMDlxVnEyU2taZFJIRWVKRUdn?=
 =?utf-8?B?dC9COXZTWTQ1MjhVRHM0K2tyUlBEalNaZDRma0d6OHVTQ2wycm9xVytQSEND?=
 =?utf-8?B?NUhpTi9FZjgxSkdpdWsvdmhhL2FjVEVVUFFNaGRTVXNjTUd1RmJrdmk5dlJS?=
 =?utf-8?B?TzNzZ2thY012aXJNR0JKMFkvajl0c0tyNW5ySEQvS1N5K2FHNnl2Y1lndjMz?=
 =?utf-8?B?T0YzZlRqSnZTRWdaLzBGbHhaSzkwanFiNlVrS3ZmbHpyNU15Qm5WbE1VVHdv?=
 =?utf-8?B?cmJab1FWRXZwNkJUSHBwME1SQkp6UldvWi9lOWxQVDBicWU4TmFiSjZXK2Fq?=
 =?utf-8?B?TzZ6VStvZkxnd3NWbk9ScmMrQnBSVVZtdHhqVlBiQ3c4Wm4zVnkxdDhOeFM3?=
 =?utf-8?B?WXFBUjl6bVo3cFlQazZ5TXBLN3o2Nk9rRzA4TkhlNGNtYUdUby9aWTBtRFN2?=
 =?utf-8?B?blZRV0ozemhKdWpQem5oWHJYT01yajhSeVE5aUhjWmpqbElJYng4b3k0RG9M?=
 =?utf-8?B?dHZ3T2l4NnJHN09vTWpGWlJUN1hmYkQyL3FVWVVVdjd6a3gzMEg0OXVQRjdV?=
 =?utf-8?B?WUkxeUFKa1ozbXlqRHd6NEFsbEY5enUwLzVRTkxzT1ZkVnRIM0lHRW1aUVhN?=
 =?utf-8?B?djI1Q1NKZzhUcUgreFl4MnQ1akQ2aGFSQTlMZ2l0WlRPd2NZMWhrUzEvOXoz?=
 =?utf-8?B?Tjgwc1kxcmR3Ympwa0w2dEJvMWh3WlppNGZ1WDhsSXdPS3loNXpwcGhXQ3VU?=
 =?utf-8?B?QnZDc3NQTGxFNjNaZ1h3eC9IeHMrSkk4enpjV3Qza2l2MjR3UFJ6M2xkUHVh?=
 =?utf-8?B?YUtRcVl0c3NaZGZvTmVhQnZTbG9kdG5tblFCNGRVMHBWMFdvMVZFczRXMUpy?=
 =?utf-8?B?WVZHYVZJMUFRelBKMGQyaHdBTWk3MHRZSDNrbGRQdmROM1djMEErRnE4UUI1?=
 =?utf-8?B?QjlVaDJkblR3UlJjOE1rMzhoWE9TRVowNjZ6VDNseXRXNStiSDlucXRscVJJ?=
 =?utf-8?B?OWJORHA4YXd5YlZRRktNTUkxZWpvNHRGdGpoM1RiZ0liS0pTZ3g4WTZTa0Jv?=
 =?utf-8?B?VlFwMDc5a3lZY201YnBzalZVK0t5OFRhUXFadTg4VU1QYXdRcmg1Rm56RC9K?=
 =?utf-8?B?bkpwbHpXU0lKVlc3MFMwMzFqaERWYmlOVXV0NkVHdlIxRmxBaHdsQ1BqcVN2?=
 =?utf-8?B?NEZPNVVGMzJBRnYydjl5Y2N2aFBodm94UVN1SmQ2RklnaUUwaEpVNVVkdEdv?=
 =?utf-8?B?ODI0VlBoa21kQUdpL0dxblhscCtrdVpEVWpJSDBkQkhhaWgwL1hNdU1KWmVt?=
 =?utf-8?B?TkZVdHhmTW1xQkRCd1V6NVdBdHowUitRWDRxQWZBcm5Mc0pSY3VhV2hGbDlz?=
 =?utf-8?B?RWRPdTRTNTcwWVNISkR2UERxK3kwWFh4YVgrcVNqWEZBMW02SmxPYVhqUzVo?=
 =?utf-8?B?dUIxSGlCOWFmR25jZ21ORGRGSDloQUMrREtIeXpWbmJiUzdORWwwK01mNFRR?=
 =?utf-8?Q?oiUfzMX55jRRhkAsn4Cz/cMt1lf6TN+DC7Iv4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9281.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vzd1b0xiTUFNME9Va0p3VENJOXlBUXhjN1RRNHdveWpUak85VzhnUXFmcWRC?=
 =?utf-8?B?SEpCQzBJb1dKWDZabHRCU21HVTBVOFNnMUhoV29ieG5QS2padWpQMWtubXhN?=
 =?utf-8?B?Sm11d1paczZHOEh5ZFd4UHovQ01LdXd6WkxJa2dzMGwyVDFqN0dLMm1EK3k5?=
 =?utf-8?B?OFVsNEVOZjZ5OTY5NGZhTURSb1hXRzltZHk5T1UzeDlwcjNVNE9VUTN1K1ds?=
 =?utf-8?B?RUJsM2taZkhjQVROaWJDd1JpSFJES1RDV0E4YmN0RVlGeW9ZWmhRaE5UcnNu?=
 =?utf-8?B?aW9PZHY1c3NNcDdmNmRhbndaUUdMc0VQbDBUM2VqSVJUdnlwS3haZmM0VXFk?=
 =?utf-8?B?MFpGVGluK0F0TFZnY0JPK1NYZU1TMTMzZmRQZEtiWURKeGM1MU9XUUhQdzlC?=
 =?utf-8?B?UGIxMFkvUG9YdmE2NlhJQ2RndHlMMDZPTWJqeWhsYWoxZkZJYkNsS05Ra0tW?=
 =?utf-8?B?MVpmQWptOGl4UlFTUFluN3RXaHBEVWpEMCsxaHY4aGZvZDRoNUxwRVBKLy9u?=
 =?utf-8?B?Y1phR2VJTHl2ZHByV2VicnJyUGlKcVNWUEJIdDVuNkpNNmNCclRJWkNxajg1?=
 =?utf-8?B?Q1R0YkhtV2ZpanhBWXYzUnA4WHpvWm9OSUFKQnJlNndJam9EeGtGNlRlUk9z?=
 =?utf-8?B?QmtxL1NUOW9vSktha2dBVDdhQzF1ajdCc1k4Q2taZzFVY0R4L1dwZUpuTXRk?=
 =?utf-8?B?TVU5UzQ0WjZzNFhaS29MWUV5VjVvVXE4eFdVaWJIWmF3NkZsM3JSVUtWNVd4?=
 =?utf-8?B?bitjRWc4dktVSEhYcVZlK2VjN1NXNVUzQWVTeklpNUFpUEt4UktiVHJ5Z0pO?=
 =?utf-8?B?SXBwSVNPMmxFbG43QSs1R29SOUxYMCtRSTc4bml6NnJWWHJpSDhVRjR4ZTRy?=
 =?utf-8?B?VWR5L1AxQXpWU3JiRnRUazY0S2Y1OTIwQVRPVi8zTHJITDcrREZ4VWd4V3Vk?=
 =?utf-8?B?YzFPMm5RTHNTRUZMR1U1TWNQUFVpVVR6M3B5ZmJHWE5wSjJVME9QRWI4Q1ZH?=
 =?utf-8?B?NEVHYVRyNnRtZTZwS0ZNUlpFeEZIWTFOc1ZSRUFsWkVoUG54aHFOMWtic3Mr?=
 =?utf-8?B?OHdWbElSZEFjeG0zdHRwYTQwc21iR1cxV0NsLzVlU1l5VU5uWGtvOVZJL05s?=
 =?utf-8?B?Q1hrVXpzTTJhSlZSQ0RyR0xmUyt3R3FWTE5yalFTdTlJQnVHOVBGUGw3NkVz?=
 =?utf-8?B?RDdBZ3BsYTU4Y09XV2RRUXFaZC9FczA3c2hzZGJoek5BRVRWU3Q4K2FuU2Jn?=
 =?utf-8?B?QVA0MS9RbjFHYUZyZ2F3NEsrY1RDM2FrVFhtYWZSWXRUT2t5VjZianZZcWNp?=
 =?utf-8?B?b1RmUkhUR054TnRmeFl0ZTk0VFprQUozbzRQTGR1eGQ0RUViTVBjK1JnQzdK?=
 =?utf-8?B?Sy9ib0lWbmtreHdleGdaL21TVFdEL2xkRTFuVi8xbWQxcGMvVlp5ZGQrMHo1?=
 =?utf-8?B?RzlSbHJFdTZxMTNMUlRXaTg4ZEdpL0ZUMis0NVovL2dKNjdFaGJIb2RJTGJ4?=
 =?utf-8?B?dEpFUnNNemw0bWJtZys2M1J6QUlWKy81ZTN5VnB6V1djR09GNi9MWFg2bGRO?=
 =?utf-8?B?VWplZVB5eVlXU05EL3NxVXFwUWVxNFA1aFdtZm9vbThGS2wrL05FdUJxTGdD?=
 =?utf-8?B?TjRZQUlXRFMrTHIrTE0zQkREM01hWWZ1UDFtSUo2RWsxcDNTTmpKWUxPTy8z?=
 =?utf-8?B?VDBkUVh3bnk0d2gvcUMvNDgrNUR0cWFpSWVZZTIzbGYxNWZMWDlVZkl4Mkha?=
 =?utf-8?B?b0liby92RzRlUmxsYVAweVhNak93UHdJTFowWXZ5UjdNS1FFRUpDdCsveDVE?=
 =?utf-8?B?TG5OVGVlRmk0ZVVLakl4UmZPR0t5YXZYMkRlRFc3NXJob09UZmNoSCtCcGtp?=
 =?utf-8?B?a3pGWTVSSThEUGFKdE4rdWM4TEFoTEs2SnFNbXJDWFg5bFh5M21NbmhQQTVO?=
 =?utf-8?B?MFNOWktabkIrRGk2V1dRZnJEMTJrb3B5NllTVmVncGlLMWxCSWU4Y3ZHdGk2?=
 =?utf-8?B?N2x2ZmdFQnJ5OURjck9URHJ4Ry9YWnFFTWRiZ3AvQUNUb3piRFhkRDlqOHdZ?=
 =?utf-8?B?czFBbUhUMStlOFpONFpwNmQxRlVNZU9nY3l1L1M4MUVnNkZaOVdjL0t2UG03?=
 =?utf-8?Q?S5a8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5856e1de-1d88-4d36-3591-08dc732fed17
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 09:34:45.8114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkrPYRnw0DtiLZLJOuPBdGsbFPHPBv8ROk9dFHeP/tTQojFtuD88/ouXR5jkm83W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7312
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gDQo+U2VudDogZGVuIDIyIGFwcmls
IDIwMjQgMjI6NTcNCj5UbzogSm9oYW4gQWRvbGZzc29uIDxKb2hhbi5BZG9sZnNzb25AYXhpcy5j
b20+OyBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IEplc3NpY2Eg
WmhhbmcgPHF1aWNfamVzc3poYW5AcXVpY2luYy5jb20+OyBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+OyBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2kr
ZHRAbGluYXJvLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFRoaWVy
cnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+Q2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBrZXJuZWwgPGtlcm5lbEBheGlzLmNvbT4NCj5TdWJqZWN0OiBS
ZTogW1BBVENIIDIvMl0gZHQtYmluZGluZ3M6IHBhbmVsLXNpbXBsZS1kc2k6IEFkZCBnZW5lcmlj
IHBhbmVsLWRzaT4NCj4NCj5PbiAyMi8wNC8yMDI0IDE2OjM0LCBKb2hhbiBBZG9sZnNzb24gd3Jv
dGU6DQo+PiANCj4+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4+IFNl
bnQ6IGRlbiAxOSBhcHJpbCAyMDI0IDAxOjA1DQo+PiBUbzogSm9oYW4gQWRvbGZzc29uIDxKb2hh
bi5BZG9sZnNzb25AYXhpcy5jb20+OyBOZWlsIEFybXN0cm9uZyANCi4uDQo+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIDIvMl0gZHQtYmluZGluZ3M6IHBhbmVsLXNpbXBsZS1kc2k6IEFkZCBnZW5lcmlj
IA0KPj4gcGFuZWwtZHNpDQo+PiANCj4+PiBPbiAxOC8wNC8yMDI0IDE2OjAxLCBKb2hhbiBBZG9s
ZnNzb24gd3JvdGU6DQo+Pj4+IHBhbmVsLWRzaSBpcyBzaW1pbGFyIHRvIHBhbmVsLWRwaSB3aXRo
IG92ZXJyaWRhYmxlIHRpbWluZ3MNCj4+Pg0KPj4+ID8/Pw0KPj4gDQo+PiBJIGd1ZXNzIGEgbW9y
ZSBjb3JyZWN0IGRlc2NyaXB0aW9uIHdvdWxkIGJlICJwYW5lbC1kc2kgaXMgYSBmYWxsYmFjayAN
Cj4+IGluIGEgc2ltaWxhciB3YXkgdGhhdCBwYW5lbC1kcGkgaXMgaW4gcGFuZWwtZHBpLnlhbWwg
Li4iPw0KPg0KPkkgbWVhbnQgaG93IGRvZXMgaXQgZXhwbGFpbiB0aGUgaGFyZHdhcmUuDQoNCklu
IG91ciBjYXNlIGl0J3MgYWN0dWFsbHkgYW4gRlBHQSB0aGF0IHRha2VzIE1JUEkgRFNJIGlucHV0
IGFuZCBjYW4gc3VwcG9ydCBtdWx0aXBsZSBkaWZmZXJlbnQga2luZCBvZiBkaXNwbGF5cywgYW5k
IHdoYXQgSSB3YW50IHRvIGFjaGlldmUNCmlzIHRvIGF2b2lkIHNwZWNpZnlpbmcgYSBsb3Qgb2Yg
ZGlmZmVyZW50IHBhbmVsIHRpbWluZ3MgaW4gdGhlIGRyaXZlciBhbmQgaGF2ZSB0aGF0IGluIGRl
dmljZXRyZWUgaW5zdGVhZC4gDQpJIGFwcHJlY2lhdGUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0
byBwaHJhc2UgdGhhdCBpbiBhbiBhY2NlcHRhYmxlIG1hbm5lci4NCg0KPj4gLi4uDQo+Pj4+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLWRzaS55DQo+Pj4+IGFtDQo+Pj4+IGwNCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWQNCj4+Pj4gKysrIHNp
DQo+Pj4+ICsrKyAueWFtbA0KPj4+PiBAQCAtNTYsNiArNTYsOCBAQCBwcm9wZXJ0aWVzOg0KPj4+
PiAgICAgICAgLSBzYW1zdW5nLHNvZmVmMDANCj4+Pj4gICAgICAgICAgIyBTaGFuZ2FpIFRvcCBE
aXNwbGF5IE9wdG9lbGVjdHJvbmljcyA3IiBUTDA3MFdTSDMwIDEwMjR4NjAwIFRGVCBMQ0QgcGFu
ZWwNCj4+Pj4gICAgICAgIC0gdGRvLHRsMDcwd3NoMzANCj4+Pj4gKyAgICAgICAgIyBHZW5lcmlj
IGRzaSBwYW5lbCB3aXRoIHRpbWluZyBvdmVycmlkYWJsZQ0KPj4+PiArICAgICAgLSBwYW5lbC1k
c2kNCj4+Pg0KPj4+ID8gRGV2aWNlcyBhcmUgbm90IGdlbmVyaWMuIFRoaXMgaXMgdmVyeSBjb25m
dXNpbmcgYW5kIGNvbW1pdCBtc2cgZG9lcyBub3QgaGVscCBtZS4gQ29tcGF0aWJsZXMgKm11c3Qq
IGJlIHNwZWNpZmljLCBzZWUgd3JpdGluZy1iaW5kaW5ncy4NCj4+IA0KPj4gSSBndWVzcyBJIHNl
ZSB0aGlzIGEgZ2VuZXJpYyBmYWxsYmFjaywgdGhhdCBoYW5kbGVzIGFueSBkc2kgcGFuZWwgYXMg
DQo+PiBsb25nIGFzIHRoZSBjb3JyZWN0IHRpbWluZyBldGMgaXMgc3BlY2lmaWVkIGluIGRldmlj
dHJlZSwgc2ltaWxhciB0byB3aGF0IHBhbmVsLWRwaSBpcyBpbiBwYW5lbC1kcGkueWFtbCBNYXli
ZSBwaHJhc2luZyBpdCBzaW1pbGFyIHRvIHBhbmVsLWRwaS55YW1sIGlzIGJldHRlcj8NCj4NCj5C
dXQgcGFuZWwtZHBpIGlzIHF1aXRlIGRpZmZlcmVudC4gWW91IGFsd2F5cyBoYXZlIHR3byBjb21w
YXRpYmxlcy4gSSBkb24ndCBzZWUgdHdvIGNvbXBhdGlibGVzIGhlcmUuDQoNCkl0IGRvZXNuJ3Qg
cmVhbGx5IG5lZWQgdHdvIGNvbXBhdGlibGVzIChpbiBwcmFjdGljZSBhdCBsZWFzdCksIHRoZSBu
ZXcgZ2VuZXJpYyBwYW5lbC1kc2kgY291bGQgYmUgZW5vdWdoIC0gSSBkbyBiZWxpZXZlIHRoYXQg
ZGV2aWNlcyBjYW4gYmUgZ2VuZXJpYywNCmJ1dCBJIGFkbWl0IHRoYXQgSSdtIG5vdCByZWFsbHkg
ImZsdWVudCIgaW4gZGV2aWNldHJlZSBhbmQgYmluZGluZyBkZXNjcmlwdGlvbnMuDQoNCj5CZXN0
IHJlZ2FyZHMsDQo+S3J6eXN6dG9mDQoNCkJlc3QgcmVnYXJkcw0KL0pvaGFuDQoNCg==
