Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3767F73E6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7079310E1D3;
	Fri, 24 Nov 2023 12:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583B710E1D3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:35:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AOCOxok013643; Fri, 24 Nov 2023 12:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=OH0oRBtsLKxZahiO6bogIztu0LdDfTrke5+cOVfflbM=; b=
 Tvjm8mCAqHjOcox7Mcip3uVQAZeE9NpVLMPO00qWVS4tXafFxSDE5EsYj8OIxsO+
 wm37saBdJhkwzUcSU/3L5Bdhhp3vCb6RW2ssoz5nSj0kaU4QswOWdpdVuImsLUVN
 epjjG0EYoEq03pLNVqp0orLP80K5d8iJNzm2uLSSsZxPKDy0mTpAFMNXDf6+7Q0+
 UgUVfgrYLZTqyPauBghn23tUV0OOkiJJ8TsFltXGA58+JTlo5MALw/TxCThiHWiO
 nXpFBC0bNIGs/sgDiAtfFXBoqMyyO8yAcX++s/XDyIL+bWBvBItd6BYziF223qzw
 6njrMMIvRET5xYy7BIfRug==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gb2d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Nov 2023 12:35:33 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 12:35:32 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 12:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTvOM9oSwOFM476LwsFcwPJEEQISsF59qb/dP9nICmN13fT2iQ25PhjQd0UfUlw0J64RU20kcRoHCgDuO0WZOAcwo2q53et63gveBNqlEMqL+IchxTKavDI7dNeMgGfjrpcImU38RIPCovX7sV8PtxNXQC8Ij9jyJRAiJRwRB5HDmNxaeCCdoqhdeJPiElV6qDDtdP73ZkCKXyEAEF8FP6XkyI3T3xHYwcPcR5Mp5jz4Cegs7gqwpwWC/ky3jzGhqBZgK6MQc2yhCJsLPOkgeCMozO37kn2Ayq6k9Jph2oJ9Qgb4zhUbQv310a1mOWdQ4if7Nzei22DdcX7cb4mqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH0oRBtsLKxZahiO6bogIztu0LdDfTrke5+cOVfflbM=;
 b=gHWMrqoCo5DBOUFMf0hwpSVy7HZDFhecU+9xSzDM959s1T5byDDION8WeZv5qMNf7ts3nd0dnRD++TaN42JbhNRgtwwJvU8AdlpN//rI6ciUwddnRXe5FpWOCgNMShASZhgfkuqlgsSbjWCLUhJv/rRyudEC/IZCyhiDYl/aK77Gls2P/am/Ft96cmvFPuAI6pfgn1MTNzAn+JYcCb01S52zA0jx26+Njk2qj2I4s3Y4MG5h3sEViFZRHTMbYAsJ88ipkw5sWxepbgWNE76z22cpBCkaQMHn0JCjqh+5V9au5PZroFrIV0nbzigp0FJf5AnKlcl15dUPKa0t7iKpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH0oRBtsLKxZahiO6bogIztu0LdDfTrke5+cOVfflbM=;
 b=RXfcKdwQC9hF/9mwiqZxssCxWrndLkFmbNgfSYT7NilimQqP/vaZSbhP/JNWMzf1xnDNhjWIOWUxszcD8Mig+MdrngeVUZ3VuNGvw1lNi+yMF2LtPZvM+5fe3kWUBfd4aLYDAck3RoR2axo3sTzivtgh8GsEHj9U+pMYpLG8VY4=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6830.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 12:35:31 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 12:35:30 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "airlied@redhat.com"
 <airlied@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Thread-Topic: linux-next: build warning after merge of the drm tree
Thread-Index: AQHaHtK2xF+UUQnrM06Sduj7/fO2yg==
Date: Fri, 24 Nov 2023 12:35:30 +0000
Message-ID: <103e88dd0a1fa7a7b4e7881a9caae1462aeb8431.camel@imgtec.com>
References: <20231124132547.00f7e599@canb.auug.org.au>
In-Reply-To: <20231124132547.00f7e599@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6830:EE_
x-ms-office365-filtering-correlation-id: 50878c9e-a78a-45bd-08d0-08dbece9d8a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TGWAeI2mbOc86tbDAePUW9g0FJCKL5jG3e0dTPgfn3Bk+6QsLn79YtiyfHGBc1dPu/A3UZjf2qYluEG55KAC4mPaxkv8EbiXONhyem7NIqB3keH3L+1DUhsSaujtwZOMWOnYv5ygLTfmL6Ru2ZrkVADwc7SRPIb9dZ8YJPh3B5k0PZOnlkZQ+1cCqHiGH7mF35Nq2FcJx5Dk45goK2qsDAVdLq21Ea5LJ/f1sqB+TZFpNFTaM7RXxNpY00yLTk/bJGd1g3MFJh2O9Xc7qInFn40HbQyB7vE1PWNEyy90z03nRMCiL7FOGSam44eKrdSAE6k8nzRQ0Knei5PBC+KhPS7wyBEKr9cYuuLWCe1zg3wWkyRK+6yjHkrAwygvMvfzNj5HRyqQXKf9o9kEIe+OIU99jfVVi4pqyqJq/jn0TqQN1g6econvZM8iWd8oLOK+rLLyHTJWBYK0U2oK1lQ+inDicyJiD5ZAua6XqtgDIJ5hnGr6YL5ll/pHxr4ZT/drHS2dU/3T9oFjPAMYKpgfa3V2nAwh53WMa0gKyum4km+QuFgy6jeelmGTbnPzs4k9y4rsriB1oZ9IyA4tE5/E0Q7x+h02KVyr+prSlnRgLovDGMEx/0jtgu9S9aldhk7Tqc1NisN+Yq9p2bnSHvmmYp4OvDtdwzrzCqNC2n0HgPs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39850400004)(136003)(366004)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(2616005)(5660300002)(4744005)(41300700001)(86362001)(26005)(36756003)(4001150100001)(2906002)(6512007)(6506007)(38070700009)(71200400001)(6486002)(478600001)(38100700002)(316002)(64756008)(76116006)(110136005)(54906003)(66476007)(66446008)(66946007)(122000001)(66556008)(8936002)(8676002)(91956017)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjhSczZJallDU0RRNkhlZjd5RUN1WjRQK2RXb2hYWG4xWUZFcHBpVGxkb1Ns?=
 =?utf-8?B?bXhYRGNzQnEwQ3JHaDJpc1NXUDJZRmVwZkVIZGV5NFUyaXVPSXRXeEJwTXFW?=
 =?utf-8?B?N0k3amFGSHNIOGVIb1dOMjdPbFRZWmFBb1hlbEVmdUYrSE1Vc0dsSGhFM2g4?=
 =?utf-8?B?ZDBlYjMveGEybzcrZzQyV3A1UHhRNWkydWNQV2ZRaGR0T2cwR3R3SzB0L1VQ?=
 =?utf-8?B?b0VwWVVuTnkveU04RHB0QUpzc3ZsTDljTGFLUG5TV1hHSjFkbU1zQUtpOXN3?=
 =?utf-8?B?OTc2aXo4VkhyeTlnU0FaOGs0aXp1Q3NaRUJpaURoa3lMM0dXNk1pVEV1a1Yx?=
 =?utf-8?B?N0I2S2gzZDkvYUQ0UmFNV01lVDdCNHlmUGl2VTFLZG9KUUpSUWZEQWExWFZx?=
 =?utf-8?B?dGRiTGpYSERtMzJMQjgwN1RUSjl0Q010bFJFNnBobHhuRkxNZTNRdU9Zbmlv?=
 =?utf-8?B?SERFRWVmcDg4U0xSSE5BWUdxUC9ha2JrUjRvTGNMbFlvdzJoK2Q4OEREWDQ0?=
 =?utf-8?B?VWI3NUNtSUxTYm9PWVVGVElrU3piUUtxK2VkaDZZZFRIVHRIT1VoNGpTSU9S?=
 =?utf-8?B?dXJWTkJwL3UxQ3ZBMEpXc2ZBNXhDQVpCK1F3bjJOOU9Vc1JQNmNBZHRLRTEz?=
 =?utf-8?B?L2g2QXhxQUNqeXVGc2ZhQW96Q3l5dFdrZHJnTHFJYzRvVVkyWktnMExIc0R5?=
 =?utf-8?B?TmpxeWMzWFNGK1lCYmFvTFprM3Y2SmYyQVFDYzVxcWNWdnZiNHB6WVlXSFpn?=
 =?utf-8?B?VS9HemF0VzhsZDgzZHF1Mis2bDQ3dEl6ZmZRbC9TRVVzMUZ6MWlQMm5OWCtD?=
 =?utf-8?B?QjFIOTFENUxPYUJNbGRmdmhoOEJzNDBmYWZ1TGRuQm55bUgrYTNFSlVPd3Y5?=
 =?utf-8?B?a2Q4ZUwvRGxEMmtuTHNSUXI2Y2o3cU92NWFuQU5SelNraWwxdmJkK21WQldN?=
 =?utf-8?B?bXdPeGordkFhSStwYkZ3QlMxQlNndENMYlZ0ZW53VGhDZklZQXdtKzNDQXFK?=
 =?utf-8?B?ckFxMG53WWovb2RKV0tHSEtsRzJMNTVmeTQ3d0dGUWZvN2hvUnpGWDNzM0JC?=
 =?utf-8?B?cVFxVkFoUEpuOVBSWStQR2JIM01VNkU3Q1pVTFFxUkx5Mit4STNGVFZoSHFF?=
 =?utf-8?B?d2tXYUdiZW1TRkk0UFVYM1JiTURNVHBVdlQ3ekN5ckFyWVFkOThYNDdhbERa?=
 =?utf-8?B?R09KcEkrSkxVelVhZjZwbStTSHhoaG5pWnlDNnNMRGdxemVyMmxxRkNkQStF?=
 =?utf-8?B?UHVUYUZ0MEhaalAzV3hreDJZSGhzNU9kUm4zdWR4cFUrYi9hT0Ftd1EwaEdM?=
 =?utf-8?B?TEd1aEs2cjBUVi94MzlRZ04vc3FDMEZMdmRFdkllOERjMnhRS3pyYndaSkx6?=
 =?utf-8?B?b3dvZHcyeklvcTV1ZlBKcnBKRGF6UUNXOStPc1ZZR1JiL0h2TDYzalJmaHRE?=
 =?utf-8?B?cDVDMUdCdWFQT3B6eHVXOGtnWVY4aTZwd3Bwek0vNDU0K1ByVllNTEhtODNa?=
 =?utf-8?B?K1h5L2JlKzB2bHUxeEIzTGVsbEFTQUdwMVIyM2FaQ2J0Z3N2ajJ5cDV1RGxM?=
 =?utf-8?B?THpDZUd4Y25EdTdDSFZaT1RVUnppdDFHSThOV3ZOUExnRWJQZ2lxVWhidzVL?=
 =?utf-8?B?L1N5NkZNTElOcXBvWUNmamY4NFVvVEthd1Z6dHFoTHMzeFhFK1BKcFRpOEQ3?=
 =?utf-8?B?L05paWVEMDhxRjdCNWs3QzdPckVvclFxUHR1V000NlN1WmhTK0w3VS95OUZM?=
 =?utf-8?B?bDVSYlFHQVJuekc0TjhHL2ZvMDI5WjJkYURMTTlPd0dxbXJ5c0FCeXhjRXdL?=
 =?utf-8?B?MlJNcTNQdDVHeW5MZnNJaWZVY1YycEV4a2JGdkgyblZWdkxMNDBFMWZZODBs?=
 =?utf-8?B?SFB2U3JTdTFzVG0ybWk2djlxZkNpSlRyWVAxMEdoWmJvTEFzcGdVajVQNDlO?=
 =?utf-8?B?V0x4UzJ5cjlsYWluTFlZRjhMZWttRTRwdm5BclJwSUxubXZ4b1R4TjRxcnJu?=
 =?utf-8?B?NVorTnVPdXFINUI4c3p4Rm5xakpIMGNRR3h1cjUyZ0o1a3VNaEpwUGNqb0dW?=
 =?utf-8?B?OFpuUDhBVmNvTG02eG53TmZpUlRydFVYVG5qb2NjcWcwalEvQVpqUFRPdVhH?=
 =?utf-8?B?SGdTTnVhYXBQRWxwbWF3TXpPUVRiOExFY1pXVFpDUkpodFc3bVplWUpJcDRI?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99C666DFBCEB4F48A999C54BF873EBCB@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50878c9e-a78a-45bd-08d0-08dbece9d8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 12:35:30.8893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzl1TSGh3O9LWGNV0eBTQ1sYK6A2z9sqRhcvriUNiJS9Oi98ILFaq2AxoSgWiUkPhLXp8jeeiUKhwpr7EvlcGo3c4fGUmelrPZ3eQfmSspM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6830
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Zq2iBT-l6Jfb2a3FLPNFnd2-3paj9djB
X-Proofpoint-GUID: Zq2iBT-l6Jfb2a3FLPNFnd2-3paj9djB
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0LiAgSSd2ZSBmaXhlZCB0aGVzZSBs
b2NhbGx5LCBhbG9uZyB3aXRoIGEgZmV3IG90aGVyIGRvYyBpc3N1ZXMNCkkgZm91bmQuICBJJ2xs
IGdldCB0aGUgcGF0Y2ggb3V0IGFzIHNvb24gYXMgSSBjYW4uDQoNClRoYW5rcywNCkRvbmFsZA0K
DQpPbiBGcmksIDIwMjMtMTEtMjQgYXQgMTM6MjUgKzExMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3Jv
dGU6DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNvdXJjZSBu
b3Qga25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUgeW91IGNs
aWNrIGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBIaSBhbGwsDQo+IA0K
PiBBZnRlciBtZXJnaW5nIHRoZSBkcm0gdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICho
dG1sZG9jcykgcHJvZHVjZWQNCj4gdGhpcyB3YXJuaW5nOg0KPiANCj4gaW5jbHVkZS91YXBpL2Ry
bS9wdnJfZHJtLmg6MTogd2FybmluZzogJ0ZsYWdzIGZvciBEUk1fUFZSX0RFVl9RVUVSWV9IRUFQ
X0lORk9fR0VULicgbm90IGZvdW5kDQo+IA0KPiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiANCj4g
ICAxMDg4ZDg5ZTU1MTUgKCJkcm0vaW1hZ2luYXRpb24vdWFwaTogQWRkIFBvd2VyVlIgZHJpdmVy
IFVBUEkiKQ0KPiANCg==
