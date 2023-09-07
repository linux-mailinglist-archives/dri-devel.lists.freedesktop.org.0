Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C04D797276
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2510E25E;
	Thu,  7 Sep 2023 13:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C506F10E25E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 13:01:16 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3879EQJI002814; Thu, 7 Sep 2023 14:00:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=VBT++pfI4+UzoCg6D7TkdpYUsAMsBgRROyHZvWM1TxM=; b=
 lj1ycheeRD4s+V7HXS/78yNOZ7HDFpursIA9AsNVSIWUqaXPFXZJZ+bk2dnMRtAt
 c4gvOi2DYXq1DgcnTzS9aPEDLycAZIBztYOZUdZYE3i/Xf7fJ5vmoz3ysYW6W2YZ
 JCnDZX3Yki7Ais500kjUVFaccmQGRxXXgv7W4ntYync6ZKqOp8BDKHDf5wib1Nrg
 UgCyawmbgriheRPC7PB5HgdcQE921Nvd2ztlaIWdh1hqfzR7ssQ5xDwdPE4v6rTV
 ZGOWXRt1e8iw+84TXC/cOoRAFvlxhvSXOtW5cG9eO9qD5CPlAdD+i75YFJtpvZbQ
 rd49A+6VT/pO9oQw7klNMw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanv2xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Sep 2023 14:00:30 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 7 Sep 2023 14:00:29 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.47) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Thu, 7 Sep 2023 14:00:29 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Atv0Fkw535+XlrkIan2IyuVGhA1aZi1JxUzDRAGU6jp7Q8t/FSLNMIX8+UWdlLUxDlBSIvjGRx6y4JtpkOtfcVqwngmIpUrUsl8+Fc9zxuUR5zFzT2+1nuLWrBcvX40BTMcDupq7uecO3H2C6V8mKL8nKXQoLS1mSK7QM5beb4mGyc2A+pdV2lemJnSiev7wJWM/7zRwI8wGKCd1EHBzavbzyZc4ZT/YN10YBrKUuH1wNbp+RyDBkkC4GSsO5rkj6rWEB+z+C4UaBxYHZIA5gCqNZkkfI1rbgfgMnUY5vUek7XctswlUcldDgnqwC2jorEbdiFWp4S5MEPjYw7jT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBT++pfI4+UzoCg6D7TkdpYUsAMsBgRROyHZvWM1TxM=;
 b=hCi7zutsg3//KBx2uLmu7rbfid0pYWYa5GDvDqdFR1CxV6ibu5ZXk/z+1P5hDAK9OL19rI1EBK+zE6DfA+5AG9BiHpw8F12p3R82EXQDvZ5YNt3t/lvlR7psGHKc9253sJJxIX+GVfsWJjVjXMHTNG0GJ+KkE9zef79n6bRBu13phW8YXDHROV3GfiJAMnvHf8z0t8zqOVOxvV+3ibVlyRBkqwZAyojuB0XfmyfDaT1MREpAO8DkEn0qPWoWS+YavlJkwJlxEbbyy3Ce7UULKxE7vETx8Vt2XB2XxwIFA/QX3P2bXeHVBpjzRe+wWfr/LK+L93utLeJM4vcL3XYPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBT++pfI4+UzoCg6D7TkdpYUsAMsBgRROyHZvWM1TxM=;
 b=gTLlnqyzCJx6GRTxGVXqSz/10fF/I8efiS2vbdrq+TKU1KqtPJNMdky1Cbp4ZgyWtcrk4rQw4Mk2dyqfKJ+uVVeRUn0iy1AuoGR1vJGOxqj3a2iaeLFmahck0uupCGFnldmiaBSIKjMmm4V1poQfZ+FJZ+rwz8Z1FaebPRQrcCs=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO4P265MB6745.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 13:00:28 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a0c1:c3ec:c36d:c365]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a0c1:c3ec:c36d:c365%7]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 13:00:28 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap from
 a remap op.
Thread-Topic: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap
 from a remap op.
Thread-Index: AQHZ4KhZrf8Ke7TH2kKLRR0LGLBxxbAPSFEAgAAM6YA=
Date: Thu, 7 Sep 2023 13:00:28 +0000
Message-ID: <5b7f431f26eea296193d9e49ea85e0377e6ebcf0.camel@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-3-sarah.walker@imgtec.com>
 <87a5tygoyx.fsf@intel.com>
In-Reply-To: <87a5tygoyx.fsf@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO4P265MB6745:EE_
x-ms-office365-filtering-correlation-id: 3c2814bf-fb61-40c2-c1d8-08dbafa268eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpnWndjeYPojRgTradEiSbrlCmWovRQlkwMzfLlX5imNv0VI4MVh2R5jDHwG1Pk4Oiqau0M8l1FotsRs9XbXFqJ8Ae41ZJwrGvXPNHy6UHH2p5T+Ch3E+1VW3f6kX2UGl6jgRYp4PPd3V6DC0JfIbHctUpILA2XikxngdUoHdn6JI1QUKSQv4RaZsPdUTorW77Wmyxzo3c72TCxOi0vjGJX+PP3rKJDzqXZJM3UAd3dh1s7Tdqkb2ZUl447tAMWjgJd09QuPbxtK8KEYoim4ibua3B4TTZgKX1Vacoqz6qwzEILKCP9pmeqsQT/rD4GpQS1KOPrLeEBJSbtBadOmgVwdM1S8t3cWCE+yeqytz1WqB2nY/83mFW5HD9tbl+XvnfnhNFogxvtUGsKGW9JrZI/+SjBUt7wgzKrDhseb06Rt5SwhKJJmTm10dv/cotb9a/R8JaSes57Em7grAIOzp3f3BF2B+OWzHZr/UazmU5Qr7a6zk4Fw96ZRnQdLHRsVRZE+OfPmEoxj/dNreGQRnBdHyqbgTDrWaLN41qx7IP5SfB65MlQK+NPLUHWkqoAUtaUM8IPZaJYnGo0bgw0LlyPkdzZTTUQmALiLAEv7x93693sYjV0MsWb1Cbw+iqlC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39850400004)(366004)(396003)(136003)(1800799009)(451199024)(186009)(122000001)(38100700002)(36756003)(86362001)(38070700005)(110136005)(478600001)(2906002)(91956017)(6512007)(71200400001)(76116006)(4326008)(6506007)(6486002)(8936002)(8676002)(5660300002)(66476007)(66446008)(64756008)(54906003)(316002)(66556008)(6636002)(66946007)(41300700001)(7416002)(83380400001)(2616005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTBjeE1WdFNMOENFZGZxUnNJSUZkZXNYeWRUNnk2VGNRWjlkaXQvVHZETGFM?=
 =?utf-8?B?WEgzV0ZvcEY2emVPOGw4MDZLc1AvUHRFVmZJOWM0M2dna2J0b2lWamZBSUFD?=
 =?utf-8?B?RVFEUVo3VXgvSHI2RXpaeHNTbnVWSWNaekppaUpXdHVVNnRjR3VPWWQxaGFB?=
 =?utf-8?B?R2FFLzNpUGtzNG05YnJkQWRBUEQxRFBuRkJiUStMNkVWMmsrS3ZMTDFDWWVp?=
 =?utf-8?B?OW95UGh5K2RFZTExTnFmZDZFU29LVG9aODZ0aXlZMmQzMDlaajh1ZmMyRllk?=
 =?utf-8?B?Z2pMbVFxVXllMTRlSXNGV1ErQkwvM2wwbmVZOU02OENMVkpZYm9xbTJFNnBm?=
 =?utf-8?B?OUE2OEhWYVJVVUJWaERCRXh1RWxXRDZvZS9ZeWR6MHJYbld6SVdsdzBQMHJN?=
 =?utf-8?B?ZWM5emxRMDRsS3FicEdpSVpvOFlLczhmOFcydWMzWFdyeEFuTkk3Nmh3alRX?=
 =?utf-8?B?RDBIeWduejU3UlN6eC9UVHJsWnVZK0ttOEdiSU1Xd2tEbTgzZGIrcGRlMW1q?=
 =?utf-8?B?K0RsV1lhWXo1QnRvRmo3UTRRV2pTTDZkamlOaU1TS0F4aUVSOHpMN0RUVzJV?=
 =?utf-8?B?OGR3dmZ4ak5yZ0JyQXFDa0RGeGJmSmRhczNmTWZhK1gxRHRuMFNNM1Y5eDh1?=
 =?utf-8?B?dkRtMXIxdDhqbklTWUxpYWtieWxUR2JHOC9MYlJwbmg5T0VlRXF0d0ozSHJ0?=
 =?utf-8?B?VWZ4SUw1WDEyNXc4Vk9SRWtGZG9lckgwZUJrOHhsdlZDSDFmb1BEVlVCcGhG?=
 =?utf-8?B?Z0NSRFh0dzFZZDVCTGhlcW5wcm0vOS9pVEtSU2Q5Qklzd0NCakxXdkxzYks5?=
 =?utf-8?B?RVBZVWlCN0YvTjYzZDNHdWxqeW15NW9rTlphdHRiTFNxZ1Fhc0hsMHJucUtq?=
 =?utf-8?B?b0tFZnlTYXpOZ0QvbDlHUktCZGZiODF5UUpLM0VHdHJ0K0xoMFdPUnBnV2Fh?=
 =?utf-8?B?ekFnekhXa0hWUncyTlZhZ09kMUx4ejF1ODNjTjk3K2h5M1NFcnpnb2NPay9Y?=
 =?utf-8?B?YXZLZjdNVUdXNHVFQUVpamhmWTJ5VEpWNys1d0F5NXI0Z3hsdE5RS3grYWpN?=
 =?utf-8?B?TTF0ckhCcUFkaXhpQSs1eDVBdjRwSmNpWUlxaEJ1TUNGWENPSTNyMGZxK1Ev?=
 =?utf-8?B?M2RVYnRsOWNZUmhYQkE2MXJXSnFPa1QzSVAwTmNLL2d6YVpITXU4anI4Wlho?=
 =?utf-8?B?M1ZMOFZoYzZHNjdTdVJGdkx1TC9rWVNlNFpHRDkrSjFZMGJJdXR1QkVUVmUw?=
 =?utf-8?B?ako2blNYMExORU9WNC9lRzdrOWJrR1ZkckFuS1R1SklYVWhvekJ1Q1poUjNV?=
 =?utf-8?B?VnQyL0c1NUVMcXVWQzVrK3laYWI1aFdMTGN0dEdkaHRNNTlJQ2pRbWNMM20x?=
 =?utf-8?B?TkZock4yRkY5S0hINTNjKy9XeEpOb2R6b0dLYlk3QTB4U1V0Si85dXdjS1Vj?=
 =?utf-8?B?eURTZDZZZThjbElrNnhyQVVHZzZnRDVQR25jWHI0QXorV3RTQlY0czYxRFZI?=
 =?utf-8?B?WlVpWHVxVnRQcW02NThCS3hCK2E4Skt3NjErYUFKT2I5QlRkQm9vTjdoVm40?=
 =?utf-8?B?WStldldvT01DNW9FOEQ3enVSUHBWWE81QzJmSjJiUkgvVGdaSUdWQ25HRG90?=
 =?utf-8?B?VndrMXl2S0JYNE11ZWQwaUNQOEpUVkFJb2RWZkZKNHhlak1lcnZ3bllsZEJo?=
 =?utf-8?B?YldzMXMwZ0ZsQ0lPMzhsL1o3NUxDSUorSndtY0kzQkhaR2lXTzc2OEdHb0l5?=
 =?utf-8?B?dUxNaUdpS0luQ0tNZC8rQmlCVmRjMUxKOTQwTlUzc2hUVjd3YWhGU3ZZL29F?=
 =?utf-8?B?REVYeUlDdFRDOEVFbFRUMXRGdmJKUFBReWFaRE1ETlY1WGJVcnVYT3hEeldh?=
 =?utf-8?B?eWs0aWtvazEzZDV6YU5VMHNDMmRPRGIwQ014K0E1TUtzSmxVRzZrVll1ckFS?=
 =?utf-8?B?eC93UjN0M3FQL1ZtS0pJZW15NXlBMkZLUis5a25nQit3MnpmZXVmUktpTmR6?=
 =?utf-8?B?TTlrdXpwZ0Y4QkxubnYyY2RzTnovSm5WMkZyWVVtc2pXWTA2NThGVS9kZUlj?=
 =?utf-8?B?Y2NBZUNPQ1greHJlMURVeWtLTlgxSjlWaWxYUzhvYmhPdFEwdjh2YzJOVFU2?=
 =?utf-8?B?c3NycWxVeUY3VnU4SEFXSTJ6QXpMb0lHdHBFQTZrMnZrMXEyNndQaVpqYWdv?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9AC2F4604F61242A4A663B427181649@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2814bf-fb61-40c2-c1d8-08dbafa268eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 13:00:28.2580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPY+c6iBtA1Air/NZgspytSjjZrnE8xdtcPIU8O9XpWWahoIrh0bHqjmrhRfOVh9EzmKmyBI2OpQCTIEZYAWIJFHwH0/ubwK1xJTr4B6Xio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6745
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: FaD7VvkfYtKkPVkNjNuE_yuPqevRhGD9
X-Proofpoint-ORIG-GUID: FaD7VvkfYtKkPVkNjNuE_yuPqevRhGD9
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "hns@goldelico.com" <hns@goldelico.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTA3IGF0IDE1OjE0ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gV2VkLCAwNiBTZXAgMjAyMywgU2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJAaW1ndGVjLmNv
bT4gd3JvdGU6DQo+ID4gRnJvbTogRG9uYWxkIFJvYnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMu
Y29tPg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmFsZCBSb2Jzb24gPGRvbmFsZC5yb2Jz
b25AaW1ndGVjLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2dwdXZhX21nci5o
IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9n
cHV2YV9tZ3IuaCBiL2luY2x1ZGUvZHJtL2RybV9ncHV2YV9tZ3IuaA0KPiA+IGluZGV4IGVkOGQ1
MDIwMGNjMy4uYmU3YjNhNmQ3ZTY3IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9n
cHV2YV9tZ3IuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9ncHV2YV9tZ3IuaA0KPiA+IEBA
IC03MDMsNCArNzAzLDMxIEBAIHZvaWQgZHJtX2dwdXZhX3JlbWFwKHN0cnVjdCBkcm1fZ3B1dmEg
KnByZXYsDQo+ID4gIA0KPiA+ICB2b2lkIGRybV9ncHV2YV91bm1hcChzdHJ1Y3QgZHJtX2dwdXZh
X29wX3VubWFwICpvcCk7DQo+ID4gIA0KPiA+ICsvKioNCj4gPiArICogZHJtX2dwdXZhX29wX3Jl
bWFwX2dldF91bm1hcF9yYW5nZSgpIC0gSGVscGVyIHRvIGdldCB0aGUgc3RhcnQgYW5kIHJhbmdl
IG9mDQo+ID4gKyAqIHRoZSB1bm1hcCBzdGFnZSBvZiBhIHJlbWFwIG9wLg0KPiA+ICsgKiBAb3A6
IFJlbWFwIG9wLg0KPiA+ICsgKiBAc3RhcnRfYWRkcjogT3V0cHV0IHBvaW50ZXIgZm9yIHRoZSBz
dGFydCBvZiB0aGUgcmVxdWlyZWQgdW5tYXAuDQo+ID4gKyAqIEByYW5nZTogT3V0cHV0IHBvaW50
ZXIgZm9yIHRoZSBsZW5ndGggb2YgdGhlIHJlcXVpcmVkIHVubWFwLg0KPiA+ICsgKg0KPiA+ICsg
KiBUaGVzZSBwYXJhbWV0ZXJzIGNhbiB0aGVuIGJlIHVzZWQgYnkgdGhlIGNhbGxlciB0byB1bm1h
cCBtZW1vcnkgcGFnZXMgdGhhdA0KPiA+ICsgKiBhcmUgbm8gbG9uZ2VyIHJlcXVpcmVkLg0KPiA+
ICsgKi8NCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkDQo+IA0KPiBJTU8gX19hbHdh
eXNfaW5saW5lICphbHdheXMqIHJlcXVpcmVzIGEganVzdGlmaWNhdGlvbiBpbiB0aGUgY29tbWl0
DQo+IG1lc3NhZ2UuDQo+IA0KPiBCUiwNCj4gSmFuaS4NCg0KSGkgSmFuaSwNCkkgd2VudCB3aXRo
IF9fYWx3YXlzX2lubGluZSBiZWNhdXNlIEkgY2FuJ3Qgc2VlIHRoaXMgYmVpbmcgdXNlZCBtb3Jl
IHRoYW4gb25jZSBwZXIgZHJpdmVyLg0KSSBjYW4gYWRkIHRoYXQgdG8gdGhlIGNvbW1pdCBtZXNz
YWdlLCBidXQgaXMgdGhhdCBzdWl0YWJsZSBqdXN0aWZpY2F0aW9uPyBJIGNvdWxkIG1vdmUNCml0
IHRvIHRoZSBzb3VyY2UgZmlsZSBvciBtYWtlIGl0IGEgbWFjcm8gaWYgeW91IHByZWZlci4NClRo
YW5rcywNCkRvbmFsZA0KPiANCj4gDQo+ID4gK2RybV9ncHV2YV9vcF9yZW1hcF9nZXRfdW5tYXBf
cmFuZ2UoY29uc3Qgc3RydWN0IGRybV9ncHV2YV9vcF9yZW1hcCAqb3AsDQo+ID4gKwkJCQkgICB1
NjQgKnN0YXJ0X2FkZHIsIHU2NCAqcmFuZ2UpDQo+ID4gK3sNCj4gPiArCWNvbnN0IHU2NCB2YV9z
dGFydCA9IG9wLT5wcmV2ID8NCj4gPiArCQkJICAgICBvcC0+cHJldi0+dmEuYWRkciArIG9wLT5w
cmV2LT52YS5yYW5nZSA6DQo+ID4gKwkJCSAgICAgb3AtPnVubWFwLT52YS0+dmEuYWRkcjsNCj4g
PiArCWNvbnN0IHU2NCB2YV9lbmQgPSBvcC0+bmV4dCA/DQo+ID4gKwkJCSAgIG9wLT5uZXh0LT52
YS5hZGRyIDoNCj4gPiArCQkJICAgb3AtPnVubWFwLT52YS0+dmEuYWRkciArIG9wLT51bm1hcC0+
dmEtPnZhLnJhbmdlOw0KPiA+ICsNCj4gPiArCWlmIChzdGFydF9hZGRyKQ0KPiA+ICsJCSpzdGFy
dF9hZGRyID0gdmFfc3RhcnQ7DQo+ID4gKwlpZiAocmFuZ2UpDQo+ID4gKwkJKnJhbmdlID0gdmFf
ZW5kIC0gdmFfc3RhcnQ7DQo+ID4gK30NCj4gPiArDQo+ID4gICNlbmRpZiAvKiBfX0RSTV9HUFVW
QV9NR1JfSF9fICovDQo=
