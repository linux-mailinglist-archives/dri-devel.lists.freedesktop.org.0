Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4E7FB8B4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE3C10E4D6;
	Tue, 28 Nov 2023 10:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320E10E4D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:58:05 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS7goXb010395; Tue, 28 Nov 2023 10:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=t8lxu/iSfqzvT7JJ3t1/jCux0RlG+j/KZj5GV2S3O/8=; b=
 HxuWF3JWmJvn1Grk0Bkf+B+Rf9N8P9y3Eo/g15Zz8lgFnW6bWVecR3SP8Slzl6yF
 AJCMB4oSI6VSA0D9CEEWS0vBEpFhkLGv/87sLEngHZWkrZrk54uSdYpprAuI8Nw/
 DUAXbeTyjtusPPoF8LFU9fOkpMdDERSFkRZbn5zPLdit2N/gOSeW5bQR8RCmNdXU
 RNff6wzL6x2rYmQM+da0+PjHHeoOcAOHj183GRFS40rc0sqelqGPvblXWzZcxXlU
 UpgH/7HWHltoFOAEmPGMxgVCckh73TolpgU42Jk3SfErwG7mJ40e+/YRKh964p3D
 3X+yZuLedhn6Xstt9erJiw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uk9vwj8tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 10:57:35 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:57:34 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 10:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxQstY09td54UdxxvOG0vHO+TVO4HfSHxaGkSKFyfUy7+pOiH8I6euVWvfOGyIrXDjoIPUrUB1UOh+oN/3lWHd/RhYKnX6kXKNtx1IAB8O/a709cKBCMHaJILR6so+STEM+cEyyX8gPabDSTwk32mp9IUoiiOUj0tYsZHJ4q+WyqaI+2eWkr3cL8Q7h/tfyoNz8ONcX07oJLhZzTDNBirXoIcqzJejsfrZmn/JbfZdz+G6Ip9ss3J2qEOs8pIL/Oft/VyAiKLbzI5ajWAhhqJaFRR/J2oOFYaiNALXpBlsGHNMsqqAYSrhfui1YZA/FxqPJsEmlQpi3gnTsU6q/hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8lxu/iSfqzvT7JJ3t1/jCux0RlG+j/KZj5GV2S3O/8=;
 b=H5Sm3nqs4TEVH8IqtBDuKVFOXh09ti/pDngVCMzXTqDIXpn0eJKh8MUFAmrpP5esRsjjGOeGUwg7W4zUax3fY5keGw6G3msQsAOEVct4zwUoZ4sZ/4u2DVcMd3QRQSp6o5IMSl++D0B6DTJqiIfYqgwx3uGsjfqMIfvPyTPIzg7cfM8qrMNvzqBQS7IxFWX06huY4mvl/NksLWcfsGMRgqUo/9uZAm3w4cOVLW/SH854xFp4jNwftM81i06rt4E+aAj2cfYqigVOhsDqB1MkjEmw4mg2yMsAjIjxGQwt5AsCfaGbdvbQdLrdi/rU/sA9rU2d7QzbhBY22QPfhTkBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8lxu/iSfqzvT7JJ3t1/jCux0RlG+j/KZj5GV2S3O/8=;
 b=QhYzJeSYNU9HmqstFOdc3Jrl15dX9eejKAL+td6LkqPdf478Lfc7F58PzZ/5LRwU1VucrcbAWYI1c6XCvbZSLtZ8j0bMpmQYceL8i6CZ1V2q6zD0FlW5hxATunFaT/3+xYczqTVyfwyCom7hNkEL6pJrNAc0m2S8ZdiyIEhkgUU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWXP265MB4961.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 10:57:30 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:57:30 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, "hns@goldelico.com"
 <hns@goldelico.com>, Matt Coster <Matt.Coster@imgtec.com>
Subject: Re: [EXTERNAL] Re: [PATCH v9 00/20] Imagination Technologies PowerVR
 DRM driver
Thread-Topic: [EXTERNAL] Re: [PATCH v9 00/20] Imagination Technologies PowerVR
 DRM driver
Thread-Index: AQHaHWHPgqCC7SpTTkW9rSlY8wNx/7CGuwmAgADiZACAB/ssAA==
Date: Tue, 28 Nov 2023 10:57:30 +0000
Message-ID: <40b6add83651af36ce1bec2c93a375a0e9e22718.camel@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
 <jl4igixnszibpq5hindyjvrh6eten7mjr6hj32fst4irjbg2t6@gdks4ydvhshw>
 <F774B5D6-BC66-414A-B3E2-DED68FB59644@goldelico.com>
In-Reply-To: <F774B5D6-BC66-414A-B3E2-DED68FB59644@goldelico.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWXP265MB4961:EE_
x-ms-office365-filtering-correlation-id: 1500004a-84b9-4244-942a-08dbf000d153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H0nXSYcj/pYT7MYPZ2qjtMbb+RqEe8uTR4eFF0RfOZhQgKO1rvOUL4/VPrG3GshfeEW5dwta3X9ogZmQFgkhSC/oqJJlJJJiRxA+BhGBhBsz/jjrgXSYWxuiATxsd+Mahr6vidyQUuMdFTxlWCmnErbfWZeh8U22ax23vNrggceakoXn6lj9iBC/jFQHxikMnfx0cIjaPUIM1Y8BHrEXFtRT7D3JG+Pll37zrb0HiAsLzHiF8F2feoWDYcdXZIuAhq3eSoG3jsBrd1Duc/IQG2pvSeffnmKOYuqjAEw28yzl6yFdboXxvdTW32SdrI8S0U0f3H4Yy9wbIe77ps/vWrK1E1hMhIpUZCCAIto4xdrXVezryPFZhYCOHM/m/qdtH1cLUs/kQbPiwvaGaZUY6dDzb7nIzoc6XciGy0mzZ7d7aex799a+R5JNl+3+/Ov+p7kPf+9C/+Pe5gEr0ZZ/LHe2CycQmWFl+6xG9nGeu/eDPpd53X0zcBlpaChCCIMEDLcd5QYJsuDaPFPrLytuOuf4u5ATku8wYMSv27Kd1QCRHHI+ZdqDm1NWFYUVzvIDOR+38LiP9TNflalQ+jYMlzq2EguDoZNFRaCDHyynJyEA5K83XTzPB15IdgSfrG28AQuPK5ZVsxu1+gK43MlIbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39850400004)(376002)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(122000001)(8936002)(6512007)(8676002)(6506007)(71200400001)(76116006)(110136005)(91956017)(6636002)(966005)(316002)(66476007)(66446008)(54906003)(66556008)(66946007)(64756008)(86362001)(4326008)(7416002)(478600001)(6486002)(5660300002)(4001150100001)(2906002)(41300700001)(36756003)(38070700009)(26005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkNqbW51Zms0UWhobXZGcG42dGtIQlRzamZ1TzQrd2IrUnlzL2JERUp0TCtp?=
 =?utf-8?B?bFV1WExGSTdHM1kxKzY5VzRKUTIyNG4wYTZJM3JIa0liM1FPNml2aGVRWDNk?=
 =?utf-8?B?a05YSGdQTHFrNzhGOW5JeDRUbWdHWVVSckx6ZVFtTk9ua2ZQYnZEelJDV1Jq?=
 =?utf-8?B?d01rcU1ESzIzb1pBV2NVbUxoRndKdGVKYk1xYnhiS002NmNKZ2k5KzFmTTRH?=
 =?utf-8?B?L1J3L1BBMGg5NU5JNXVYSFVzRlJCd3FHQjd0ZzNsVDBPT1J1aHlBVmg2YWYw?=
 =?utf-8?B?c1l3eVp5Mjl1clk1V3JiMnlZbzFxaGZxeXFPQjBtTW95aStRMWQwaVRwWWdG?=
 =?utf-8?B?U015NzY5ZUlNeE04b0ROV0dMUEJjTHlTeUZESUZOSWxKa0oxczJ3bkNCdFhC?=
 =?utf-8?B?YkpSMGR2MU53c2JmRUdNaTlhck13SXZWeGhZdzE2SWFkYVo4WEl2eWl6aTJn?=
 =?utf-8?B?UCttbGc5bmxNTEhhVkZyTEJtdmxjaTJ6aGpPL1JlTHZmNjBGVUlNUGpGQW9T?=
 =?utf-8?B?UDM4ZDR1K1FobGVuaDdFQWdIS3FGNVVSSjQzdWFiMnJyWGlubU5UeHNLOWZN?=
 =?utf-8?B?eGFKcHR5SGdhNUp3VFlabEo5UndnaE0rMFBHNXNnbGF2T1gvSElZeU9sZnkr?=
 =?utf-8?B?QmFaTjlpWGd1V0lQbUVGRUp5eGFXdVBDdEVTZnhXeGxtMHRtVm1BQmFSYThs?=
 =?utf-8?B?am1GNjN0WW90c0Q0MHhHWVpoZk5pQ2hSVDk0RVBrd1o5RTBZSWMzd3R1V0FR?=
 =?utf-8?B?bWZlcUc3WmR5b29hZEl1ck9wbVQ0SzVBMVZ3cU12dXFETUtHaUxMcEVFWW9n?=
 =?utf-8?B?UllsczdiVzlEZExacDc4bUg0ZVBYVjNSZTRQbUhlNHV4UzNyQ2J6Q3RBQThv?=
 =?utf-8?B?anpvZDlFZWlMSTBwRktXbUlvOUx4MDBWT3FwWnVWVlI1RldyQzdsR1ZSaU5w?=
 =?utf-8?B?MlJuZE1TZVFCVEFxTHJNOGRobjFZcm41ZVBWcUNQeURQcWxEYWgzam91RExq?=
 =?utf-8?B?YUp4VGRNbG13S1VtckRFeFlEQXpxN0RNQlRZVDZsVVVKSTA0QkNyaGRzRnpU?=
 =?utf-8?B?ZVZ0S01ybUJPYWNJZzBYQkEyZHd1ZFZrQi8zYlFmQlhTMVh2RGNsZktVazhN?=
 =?utf-8?B?TDJXYStlOFBxTGRjWkVVS0h6TWNGdDd6TExWYnBWYVhRa2FTaDIxWE1hZWR4?=
 =?utf-8?B?K2cvL3hYd2wvRlNhQ2VUcms2RzQwK2Q3MExSMWc0bEs2bDRLZS8xbG45TlpZ?=
 =?utf-8?B?YkRhOSt2VzN6VXFrZ2E5eWNSQnROSEFIeVl0OG1rMklnektzNnhTYXhOREw1?=
 =?utf-8?B?Z1ZaeXpjOW56MUpNS3h1SzRqRGRwZVJMVmtZYS9Ncy9Ea3dPOGVzRkpmRG9w?=
 =?utf-8?B?b3BlbEZONi9HTkFjcUk3MjJDOTRLbXg1azd2YlI1eCtjU3pwRjZxVFhEb3Jr?=
 =?utf-8?B?OGdHbGdVZ2Zkd1R6cHZCZ2EzRGIxMU5haFJLd0c2M1FOSGNNKzZKWVNkSmVQ?=
 =?utf-8?B?c3M2VHpxSThsZ2Z1VkhuenByU0VIb3hkR0tnNHZlV3NsZlpaQ2NkcmFxaTJV?=
 =?utf-8?B?R0prTTI5NjRTM0JHT2swdVdMd3BmbmpNRmZkTVNlRllsaGZZc2NDNDVUdFcr?=
 =?utf-8?B?Z21FVmxXVDdSTlBzY2FvYlN4VDdPellUbjA5dHlVSER0WnNWSzJ6MXVGU1BQ?=
 =?utf-8?B?bGdGbTNXenMwUkhXam9jdXFDRnNzVVI2V0JjTFZvaUhZeERKTTcrMUExc09L?=
 =?utf-8?B?Q3RnUTlucW1aeHRIQzE5V1NIc3p6STBRbGh3Y2pJWFBCREp5WnNMUmprMm5Q?=
 =?utf-8?B?REtiaXcrUC9PUzJRSS84RkhTd2QrVjZXN0NISzU4NTNtVmFBZ0tHNUhuVllq?=
 =?utf-8?B?a2k5Q1oweXNZUEQxYVdFUnU5WTU1WEpsU0RiQmhxMzhHL2xLWCtyUnhNK3M1?=
 =?utf-8?B?L3k1MEtyMWtDN1BnUW5CMTR0a21RQjhuSnAxb0ZQeWp0WGdSeFhBY3dlY3l5?=
 =?utf-8?B?WFVMVlI1U3lPQTM1UVNCRmZBLzhzOGQxUXNQUU9TTjlhWGdZcGVSU1o5SlE3?=
 =?utf-8?B?aVhxakVIbHNxVnlVU3hTWkpIdk5TRnJMelQ5cm1Caml0U2pFdFJRRlYrUWh6?=
 =?utf-8?B?clR1aWtRVHB5V29NdUJMODNrNWxqZ3hRdGJvSWRnVkRaNlF2RTBBamdraFRi?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01C04107875CBB46B1C0013DFE58CDBB@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1500004a-84b9-4244-942a-08dbf000d153
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:57:30.5076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoQBM92KMH0xEaZ2i9CpShYTZ7bMT9CKP+4EOjufivfnG5bCiITcCsyK14QQY2qjyL6SjW9lFsS/7CUkUbyQ/MBGwDPyxbqe30MeCZ2iXpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB4961
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Bohaz7a4gTcq5BrMVjhnM_SFrxVn8rv-
X-Proofpoint-ORIG-GUID: Bohaz7a4gTcq5BrMVjhnM_SFrxVn8rv-
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 "openpvrsgx-devgroup@letux.org" <openpvrsgx-devgroup@letux.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "afd@ti.com" <afd@ti.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "kernel@pyra-handheld.com" <kernel@pyra-handheld.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMsDQoNCkkgY2FuJ3Qgc2F5IGl0IHdvbid0IGhhcHBlbiwgYnV0IGZvciBjb21t
ZXJjaWFsIHJlYXNvbnMgd2UgbmVlZCB0byBjb25jZW50cmF0ZQ0Kb3VyIGVmZm9ydHMgb24gY3Vy
cmVudCBhbmQgbmV4dCBnZW5lcmF0aW9uIHByb2R1Y3QgbGluZXMuIFdlIGp1c3QgZG9uJ3QgaGF2
ZSB0aGUNCnJlc291cmNlcyB0byBsb29rIGJhY2sgYXQgdGhlIG1vbWVudC4NCg0KVGhhbmtzLA0K
RG9uYWxkDQoNCk9uIFRodSwgMjAyMy0xMS0yMyBhdCAxMDowNCArMDEwMCwgSC4gTmlrb2xhdXMg
U2NoYWxsZXIgd3JvdGU6DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJv
bSBhIHNvdXJjZSBub3Qga25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBi
ZWZvcmUgeW91IGNsaWNrIGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiAN
Cj4gDQo+ID4gQW0gMjIuMTEuMjAyMyB1bSAyMDozNCBzY2hyaWViIE1heGltZSBSaXBhcmQgPG1y
aXBhcmRAa2VybmVsLm9yZz46DQo+ID4gDQo+ID4gSGksDQo+ID4gDQo+ID4gT24gV2VkLCBOb3Yg
MjIsIDIwMjMgYXQgMDQ6MzQ6MjFQTSArMDAwMCwgRG9uYWxkIFJvYnNvbiB3cm90ZToNCj4gPiA+
IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGluaXRpYWwgRFJNIGRyaXZlciBmb3IgSW1hZ2lu
YXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlINCj4gPiA+IEdQVXMsIHN0YXJ0aW5nIHdpdGggdGhv
c2UgYmFzZWQgb24gb3VyIFJvZ3VlIGFyY2hpdGVjdHVyZS4gSXQncyB3b3J0aCBwb2ludGluZw0K
PiA+ID4gb3V0IHRoYXQgdGhpcyBpcyBhIG5ldyBkcml2ZXIsIHdyaXR0ZW4gZnJvbSB0aGUgZ3Jv
dW5kIHVwLCByYXRoZXIgdGhhbiBhDQo+ID4gPiByZWZhY3RvcmVkIHZlcnNpb24gb2Ygb3VyIGV4
aXN0aW5nIGRvd25zdHJlYW0gZHJpdmVyIChwdnJzcnZrbSkuDQo+ID4gPiANCj4gPiA+IFRoaXMg
bmV3IERSTSBkcml2ZXIgc3VwcG9ydHM6DQo+ID4gPiAtIEdFTSBzaG1lbSBhbGxvY2F0aW9ucw0K
PiA+ID4gLSBkbWEtYnVmIC8gUFJJTUUNCj4gPiA+IC0gUGVyLWNvbnRleHQgdXNlcnNwYWNlIG1h
bmFnZWQgdmlydHVhbCBhZGRyZXNzIHNwYWNlDQo+ID4gPiAtIERSTSBzeW5jIG9iamVjdHMgKGJp
bmFyeSBhbmQgdGltZWxpbmUpDQo+ID4gPiAtIFBvd2VyIG1hbmFnZW1lbnQgc3VzcGVuZCAvIHJl
c3VtZQ0KPiA+ID4gLSBHUFUgam9iIHN1Ym1pc3Npb24gKGdlb21ldHJ5LCBmcmFnbWVudCwgY29t
cHV0ZSwgdHJhbnNmZXIpDQo+ID4gPiAtIE1FVEEgZmlybXdhcmUgcHJvY2Vzc29yDQo+ID4gPiAt
IE1JUFMgZmlybXdhcmUgcHJvY2Vzc29yDQo+ID4gPiAtIEdQVSBoYW5nIGRldGVjdGlvbiBhbmQg
cmVjb3ZlcnkNCj4gPiA+IA0KPiA+ID4gQ3VycmVudGx5IG91ciBtYWluIGZvY3VzIGlzIG9uIHRo
ZSBBWEUtMS0xNk0gR1BVLiBUZXN0aW5nIHNvIGZhciBoYXMgYmVlbiBkb25lDQo+ID4gPiB1c2lu
ZyBhIFRJIFNLLUFNNjIgYm9hcmQgKEFYRS0xLTE2TSBHUFUpLiBUaGUgZHJpdmVyIGhhcyBhbHNv
IGJlZW4gY29uZmlybWVkIHRvDQo+ID4gPiB3b3JrIG9uIHRoZSBCZWFnbGVQbGF5IGJvYXJkLiBG
aXJtd2FyZSBmb3IgdGhlIEFYRS0xLTE2TSBjYW4gYmUgZm91bmQgaGVyZToNCj4gPiA+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZnJh
bmtiaW5ucy9saW51eC1maXJtd2FyZS8tL3RyZWUvcG93ZXJ2cl9fOyEhS0N3amNESSF5WlpFX04w
WHF1UmJHM1ZheHJKckpKMTlkZFAwbW9acEQtRFBKUFZPSmZNTGl6Y3g2OG1TaUNEbDJ5bk43UUF3
WVNLa0duaFJ1V210WVFYMiQgDQo+ID4gPiANCj4gPiA+IEEgVnVsa2FuIGRyaXZlciB0aGF0IHdv
cmtzIHdpdGggb3VyIGRvd25zdHJlYW0ga2VybmVsIGRyaXZlciBoYXMgYWxyZWFkeSBiZWVuDQo+
ID4gPiBtZXJnZWQgaW50byBNZXNhIFsxXVsyXS4gU3VwcG9ydCBmb3IgdGhpcyBuZXcgRFJNIGRy
aXZlciBpcyBiZWluZyBtYWludGFpbmVkIGluDQo+ID4gPiBhIG1lcmdlIHJlcXVlc3QgWzNdLCB3
aXRoIHRoZSBicmFuY2ggbG9jYXRlZCBoZXJlOg0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mcmFua2Jpbm5zL21lc2EvLS90
cmVlL3Bvd2VydnItd2luc3lzX187ISFLQ3dqY0RJIXlaWkVfTjBYcXVSYkczVmF4ckpySkoxOWRk
UDBtb1pwRC1EUEpQVk9KZk1MaXpjeDY4bVNpQ0RsMnluTjdRQXdZU0trR25oUnViV2pBOTQzJCAN
Cj4gPiA+IA0KPiA+ID4gVnVsa2FuIGRyaXZlciBsaW5rcyByZWZlcnJlZCB0byBhYm92ZToNCj4g
PiA+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzE1MjQzX187ISFLQ3dqY0RJIXla
WkVfTjBYcXVSYkczVmF4ckpySkoxOWRkUDBtb1pwRC1EUEpQVk9KZk1MaXpjeDY4bVNpQ0RsMnlu
TjdRQXdZU0trR25oUnVaNVZUY001JCANCj4gPiA+IFsyXSBodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL3RyZWUvbWFp
bi9zcmMvaW1hZ2luYXRpb24vdnVsa2FuX187ISFLQ3dqY0RJIXlaWkVfTjBYcXVSYkczVmF4ckpy
SkoxOWRkUDBtb1pwRC1EUEpQVk9KZk1MaXpjeDY4bVNpQ0RsMnluTjdRQXdZU0trR25oUnVlU3Bm
b1QtJCANCj4gPiA+IFszXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzE1NTA3X187ISFL
Q3dqY0RJIXlaWkVfTjBYcXVSYkczVmF4ckpySkoxOWRkUDBtb1pwRC1EUEpQVk9KZk1MaXpjeDY4
bVNpQ0RsMnluTjdRQXdZU0trR25oUnVUbVoxd3JXJCANCj4gPiA+IA0KPiA+ID4gSm9iIHN0cmVh
bSBmb3JtYXRzIGFyZSBkb2N1bWVudGVkIGF0Og0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9ibG9iL2Y4
ZDJiNDJhZTY1YzJmMTZmMzZhNDNlMGFlMzlkMjg4NDMxZTQyNjMvc3JjL2ltYWdpbmF0aW9uL2Nz
Ymdlbi9yb2d1ZV9rbWRfc3RyZWFtLnhtbF9fOyEhS0N3amNESSF5WlpFX04wWHF1UmJHM1ZheHJK
ckpKMTlkZFAwbW9acEQtRFBKUFZPSmZNTGl6Y3g2OG1TaUNEbDJ5bk43UUF3WVNLa0duaFJ1YWNf
Y3FiUiQgDQo+ID4gPiANCj4gPiA+IFRoZSBWdWxrYW4gZHJpdmVyIGlzIHByb2dyZXNzaW5nIHRv
d2FyZHMgVnVsa2FuIDEuMC4gVGhlIGN1cnJlbnQgY29tYmluYXRpb24gb2YgdGhpcw0KPiA+ID4g
a2VybmVsIGRyaXZlciB3aXRoIHRoZSBNZXNhIFZ1bGthbiBkcml2ZXIgKHBvd2VydnItbWVzYS1u
ZXh0IGJyYW5jaCkgc3VjY2Vzc2Z1bGx5DQo+ID4gPiBjb21wbGV0ZXMgVnVsa2FuIENUUyAxLjMu
NC4xIGluIG91ciBsb2NhbCBydW5zLiBUaGUgZHJpdmVyIGlzIGV4cGVjdGVkIHRvIHBhc3MgdGhl
DQo+ID4gPiBLaHJvbm9zIENvbmZvcm1hbmNlIFByb2Nlc3Mgb25jZSB0aGUgc3VibWlzc2lvbiBp
cyBtYWRlLg0KPiA+ID4gDQo+ID4gPiBUaGUgY29kZSBpbiB0aGlzIHBhdGNoIHNlcmllcywgYWxv
bmcgd2l0aCB0aGUgbmVlZGVkIGR0cyBjaGFuZ2VzIGNhbiBiZSBmb3VuZCBoZXJlOg0KPiA+ID4g
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9mcmFua2Jpbm5zL3Bvd2VydnIvLS90cmVlL2Rldi92OV9kdHNfXzshIUtDd2pjREkheVpaRV9O
MFhxdVJiRzNWYXhySnJKSjE5ZGRQMG1vWnBELURQSlBWT0pmTUxpemN4NjhtU2lDRGwyeW5ON1FB
d1lTS2tHbmhSdVNWdjJaZmskIA0KPiA+ID4gVGhlIGZ1bGwgZGV2ZWxvcG1lbnQgaGlzdG9yeSBj
YW4gYmUgZm91bmQgaGVyZToNCj4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZnJhbmtiaW5ucy9wb3dlcnZyLy0vdHJlZS9wb3dl
cnZyLW5leHRfXzshIUtDd2pjREkheVpaRV9OMFhxdVJiRzNWYXhySnJKSjE5ZGRQMG1vWnBELURQ
SlBWT0pmTUxpemN4NjhtU2lDRGwyeW5ON1FBd1lTS2tHbmhSdVFhQ25qZ0UkIA0KPiA+IA0KPiA+
IEkganVzdCBtZXJnZWQgYWxsIHRoZSBwYXRjaGVzIHRvIGRybS1taXNjLW5leHQuDQo+ID4gDQo+
ID4gQ29uZ3JhdHMgOikNCj4gDQo+IEEgYmlnIGFwcGxhdXNlIHRvIHRoZSB0ZWFtIHRoYXQgYWNj
b21wbGlzaGVkIHRoaXMhDQo+IA0KPiBMZXQgbWUgdGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGFz
ayBpZiB0aGVyZSBjb3VsZCBiZSBhIHNpbWlsYXIgZWZmb3J0IHN1cHBvcnRlZCBieSBpbWd0ZWMN
Cj4gZm9yIHRoZSBTR1ggZHJpdmVycz8gVGhlcmUgYXJlIHN0aWxsIGEgbG90IG9mIGRldmljZXMg
dXNpbmcgdGhpcyB2ZXJzaW9uIG9mIFBWUiBpbiB0aGUgd2lsZCwNCj4gbGlrZSBPcGVuUGFuZG9y
YSBvciBQeXJhIEhhbmRoZWxkLCB0aGF0IGFyZSBzdHVjayB3aXRoIG9sZGVyIExpbnV4IGtlcm5l
bHMgKHdoaWNoIGFyZSBub3cNCj4gdW5tYWludGFpbmVkKSBiZWNhdXNlIHRoZXJlIGFyZSBubyBj
b21wYXRpYmxlIFNHWCBkcml2ZXJzIGZvciBtb2Rlcm4ga2VybmVscy4NCj4gDQo+IEFuZCB3ZSBo
YXZlIHRoZSBvcGVucHZyc2d4IGNvbW11bml0eSB0aGF0IGNhbiBkZWZpbml0ZWx5IGhlbHAgd2l0
aCBkZWJ1Z2dpbmcgKHdlIGFsbCBvd24NCj4gdmFyaW91cyBPTUFQIGFuZCBqejQ3ODAgZGV2aWNl
cyksIGJ1dCB3ZSBsYWNrIHRoZSBkb2N1bWVudGF0aW9uIHRvIGFjdHVhbGx5IGRldmVsb3AgYW5k
DQo+IHVwc3RyZWFtIHN1Y2ggYSBkcml2ZXIgKGFuZCB1c2VyLXNwYWNlIGNvZGUpIG91cnNlbHZl
cy4NCj4gDQo+IE5pa29sYXVzDQo+IA0K
