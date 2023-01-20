Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE4675CA3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532810EAD7;
	Fri, 20 Jan 2023 18:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C5210EA5D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b96YOfpysKTMTNFo+KfOkoknM7TgUy3M9sFNVi4/WslQBvdRlO+YrluPhWVocC8/gntC7YmeuniCJA9U/DgIvHX+nOQ3YH34SjS51CdYATaYkFl0atV3YfnXQis/U5L+03M/RTK6m4qBhBCPT2VwlfQAwJ8c5uSZiCLVnRzEkw00gh1Bz928M5Ilk8XoP0BTfPQnDrNnVMe0zHd/lCfjTNeLHqLey4txJRF7hsHGNh4CXavq75c7m4Vgg1uRT7hxaKRXyNGx4CMB5hD5kCEf6WyLEmFJTd1h1ih6UBAOxIfWAb8113FeHvd1Q6aGaVn/2gLreeJCWyoDoZozJK9YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcK11AKXsqErjdmC+YwmiePXR4fh9+DTzr8C0pftmw8=;
 b=I0gUFUJXlOTIEqc+gy6yMkM2OGsp3tBfRdayrls1aLhZWpDhP7OrX+Rb3YU9uOGu/lzc/taeAI1RAIUUt1dLFf73407rJYd/7pAHO9O7AoUU0WtTEQ9vTiVf9KrLwRE2n3SpDd+5VSXtfo7LQgXTOmoTT1UXL0s4pIi9q0dkX9pXHL8FaEZZzqhVgiawWz9SJlL7T01BSbkrn0YKwY616+qAVYaY0WFD2NfzEkVsxjfuUtbd3Tesy0L9RETtNQekngoFxe7iVvOytOSsn1kyqe7SWHb2jk4eldLV4ylXlf6afy7e91zJlZovQED7SI8bslTQQeWqsIB7dAdtTL7eYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcK11AKXsqErjdmC+YwmiePXR4fh9+DTzr8C0pftmw8=;
 b=INB1XVHseNfzcbfZqPFtMlTKHzz5UB7rmSSacXJhYhlLG0eYS+PzgPRGJNiqZ+DsgIA9jIGjooY0FV16xRx23aefwz4hmcw10Bmh0NIcPSnQBMnIHMUP84BcodIGjXvogKus8hTWGNW5BoXR7YysMZy44EqoS9z1NIWaD7TuhBMO9eJt063i8AK/4ApPKTQ+FolqW+Q7zlU19VodHnv48GVn7o1YKYbRwKxrrOf1qRsukyF0JK+/9BczICSlv+ITszRCJcPPqUhLQ/ouDBk4hyDjnO50DXUJpTsoyevGXnx+HuhV1Hg+w1BLC6DoTKMb0k8pLGisWJYaEHZn52FKvQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB6319.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 09:31:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6180:97c1:d0ad:56a9]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6180:97c1:d0ad:56a9%2]) with mapi id 15.20.6002.013; Fri, 20 Jan 2023
 09:31:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "a1ba.omarov@gmail.com"
 <a1ba.omarov@gmail.com>
Subject: Re: [PATCH 1/3] drm/rockchip: lvds: add rk3568 support
Thread-Topic: [PATCH 1/3] drm/rockchip: lvds: add rk3568 support
Thread-Index: AQHZLDbB/y438Czwi0i+hTK3lY70M66nB2KAgAAEMgA=
Date: Fri, 20 Jan 2023 09:31:43 +0000
Message-ID: <9fe2678da0ae10e6996889971a3137799a68c4b9.camel@siemens.com>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
 <20230119184807.171132-2-a1ba.omarov@gmail.com>
 <20230120091641.GL24755@pengutronix.de>
In-Reply-To: <20230120091641.GL24755@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB6319:EE_
x-ms-office365-filtering-correlation-id: 2d9a2179-c9bf-437a-05b9-08dafac9247b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2N4S2JMfa2Ev/SdtuqWPwmbom80QQYQxys2K5T5ITor3i0C3FRa85t/4CiKeAzj6Au8rQOXEaQUl1GnkD6DuowASclooGONWXvU/per/txbIVrtSCE9WnyoZJcMw0MKbg6IfJL5jXNk9RnF4P4Gf0tGjgjxsAmRWFoThZENbd+nBkste3bNPa0HQzLqr4qZXKPiSZ3fWL/bdeVWT5/ducushixKGzVYtNU3UNMOODI/5U6Xye3mTs+UVC4dhlQ7Z+bkm/6E0yHO7obPA9Gi+2Us3C0S07eVzH0TMjqf2UPUHeeUmbm0x9AxEqP8Kh1tQS/xJbsdeAhmSYRfB8X4QwN/sdPxEIe7JRvLoNE6KAhfclDEgGrLk1kNk+PUVZmLr9DHYAsIOP/yrZn+icEl+7G/dJkp8SgrVlcRvtBbQJbatNtKsgBDnKNdsGmfhYeIZUYOhEvcl5+q2ozMH2RHw5aVrGM6NDTcYhP6/SVBfORL4RHsxFKAUngdNDQFdecVUEkLJL+wOCXzrKMJAgZHk5diYj3mon+qoBIRtxwLN77R1lkCJyE1rNsgmxgr+KTr9ZAT4A1TWc/LfulMkqg8l7Uqkvb0tPuMfdoIFX50eIh7ffjiGqWj7z+K0D/J8qAOBuH8jYFzWBLTV2bx0MeOs81TeQRkugMMHDx5cVivR+JQaBk6T6jZl1WYXXu5e9YH7X8MzlyeKk9YGM4v35vPN08iq0bNsG4bYBJGY+TQNR1NvztkWhL8TBJb1resDHhLc8uuKnPPpXnhrxaMM1PlLIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(55236004)(6486002)(7416002)(316002)(478600001)(82960400001)(41300700001)(6512007)(38100700002)(54906003)(83380400001)(36756003)(4744005)(110136005)(86362001)(15974865002)(8936002)(5660300002)(71200400001)(186003)(122000001)(76116006)(91956017)(26005)(38070700005)(2616005)(2906002)(6506007)(64756008)(66446008)(66476007)(66556008)(4326008)(8676002)(66946007)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGJ1UE9ySW5jc3NpZjNxbDZRRzVoUC9qWEJ3dlp1bDB5NFNXNlFHS2pKOW9E?=
 =?utf-8?B?b0pGM0ZHb09COHVKd0tBYUl5MFpSNDlMY0NkUnZtME9Yc1RiRCtJcGJrNHR1?=
 =?utf-8?B?UGRLS1JpN0tPc3JSNEQzU01UOXdidVZmRTVqQWZZZjc5dWpmYUhoR1YvK3hn?=
 =?utf-8?B?T3hIbkcyOXVsMFplc0hwL0RvcVhkNVhHeUVXc1lyYUVQeStNK0xZc29xNjVP?=
 =?utf-8?B?QXZ2YnZoQzlHNDYwaEVwZWsxWVJaUDdvZjJXODMrMWhKRGRlMzBrcGF0T2Fz?=
 =?utf-8?B?dlBacWFXRkhsZ0JlT2VPNmRaWFBZNGIycEJvUlR4NzhLRXR6M3VQcndLUVFz?=
 =?utf-8?B?bXN1L1pQZ1Q0OTdsWjBnQ0RJN2RYWEpFQVgrVnRnZCtkeG9DMFJmRUplRVN2?=
 =?utf-8?B?bmZvNEhMbzdyYW9BcnZRTGMyUlY1eUFRSUI5Zk5YRkYxYzNDbFk0eVFEYVNy?=
 =?utf-8?B?ZFFrUjR2U2wyajBQODl6bUJEcmxtMUIrZm54QzdxV0RzakdkRHVWL05TRmti?=
 =?utf-8?B?MDN6Nk1zNXVBOU4xRHZySDBTWC9qZERPOU00WU9sc3FBQ08yc2FvUE1acGxG?=
 =?utf-8?B?TkwwamxvV3FMeExPSGRubUhDNDEwcWY4SCtEWndIcjVXTFRGZk9YaUthcXdR?=
 =?utf-8?B?c1FsSUxNL005SytNbTVPOUJFTkdRTWdhc2V0dmsxbjdERGpDajhtVEliR1VU?=
 =?utf-8?B?ZmhIRFZXRXFKMEwxeGxSVkRLZElXeVpTV2pEQlRPUFBpRU05Ykt0aVlMcTFD?=
 =?utf-8?B?QndDTjVhVkxvWUlhL0w4QU1Nc2FLVVNYZmw3b1B0THRnTlNJcFgzeXhZZVF3?=
 =?utf-8?B?ZGlveU1sMDhHc2hnWEtTL3RIQk52eHFGRVhIeGdLelRWNjhnYzdGNEt4bEZI?=
 =?utf-8?B?aFZENG84TjJieHNjTUFDS1pRVWlDbS90SE5LdHY0cWhnMlFxdTArNnd5a2Zu?=
 =?utf-8?B?L3Z0ZWw0YkJSRjM2amFIK0JKdFp2WFpHbitLS0xoMmpib2dpemNTTUpKc0pa?=
 =?utf-8?B?WFdTYTRXVThHMHV4K2tJaXYzZktpaXJuN29JUjUwdy85eWt4bmlxc3NWQ2dT?=
 =?utf-8?B?ZkFCSi9LcDlCbURKSHAxYy84NVJlRGozdFZ3OXcwdmRXUnA4WHdTRzhuUVVJ?=
 =?utf-8?B?Yjg2TGtlWDZCZ2UzME9qZnhxd3FJQ042UnZyUHNIa2RoMkpiUHlUeWZIV3hi?=
 =?utf-8?B?L1FGRnorZndUTmRxQ202Vk5KZTRINXhnMlFoTnk2YnNFeGRoNGx5dUR2amhX?=
 =?utf-8?B?Q3hvaXZQdFU0NEdFM2xHVWRUdnJHdzN0UlkwRUNSYlFwM0V3a1ZYNFV4OWdr?=
 =?utf-8?B?czk2STRGVXV0OTl5WjhITy9oRWtXZ1dNWkNPaXc4d1NlZER5VTRodkxTcFFW?=
 =?utf-8?B?WHRpNFJLTGNjcDV4OW44ZjZMcTVWMmRETVZIaWlueDVOTHgvSVNDSHQybjB4?=
 =?utf-8?B?YVNqdVRNTERjTWpjUDNTUms2dkFRUWNYUGV6bnBpMnZGa0FRMnRtaFZTYk1v?=
 =?utf-8?B?V05YNm1wQk1HY0hmRHNxVzN5dzZOTFRIZ3Bja0lQZmM0bHFicnVuVVdZWExK?=
 =?utf-8?B?ZXR6RERjbXBzNUVocGhUVGorWnRySEhHSXhtdlhOUmsrUyt3ZDdOa21jcXZU?=
 =?utf-8?B?QzZyZW9oNEwyTktUem9hdXFXOHRBVWF3VmROaWs2aW1pdTlxNlkxWVRLQnhv?=
 =?utf-8?B?WFJubXBmQVVoUFAzUWlDcUpzejR2UktvMDJSOHVpZ0NlSnlCaktXQndNZkk1?=
 =?utf-8?B?Yk96eHRiVUlSS29vTFBJV1Y3S0hwb3RKQnRKdjhXMU14dXc2WG5Ha2dLVFVo?=
 =?utf-8?B?RWpLWWJ2anQyTnllVXBabGtwTGdNSlN1RVZ4TlR6QVY3emlqT00xM0tmQm5v?=
 =?utf-8?B?RXBMN1JiRUROeENpSkVCdVdacXJIZFZaZUw1eFFHSGQ5UEt2bmc1MTB5UTgy?=
 =?utf-8?B?TkhVL0hYdkpydVYvSEF1Vlpjbk5GOFI1eCswNk9ZdU94RndzM2ZEd3lOemgx?=
 =?utf-8?B?ZjJJU2JhMnlBN0VHNnNpY0lacVkybGpMbmZnbzFuaVQ2dk1aVk5iS2p5bTFP?=
 =?utf-8?B?OVcrL1psMENUd2tiRXd1SURtZDdocy9QWHpPK0V1dFlpVzJDdFZZb0pNZzhT?=
 =?utf-8?B?MXRTVGZlNHNjdFdpVFZEODQycEtZVHBZNWNvRU9ESCtpM25QMUkrdzdMdEta?=
 =?utf-8?Q?mW+emCSWU0SkbCj+/z0JBQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEFF76426E969D4B8AABDF5678415CE2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a2179-c9bf-437a-05b9-08dafac9247b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 09:31:43.3602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfR87G3CkPXiB8AQdhdYHKH61t98uNbJQWlTUWOfI2l3mxmgpOrLmP1gzy8XUeKPtp41bCWoOpqf8YNT+2msROaWMvSrM8KuIZtfxP8+wWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6319
X-Mailman-Approved-At: Fri, 20 Jan 2023 18:19:29 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "macromorgan@hotmail.com" <macromorgan@hotmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frattaroli.nicolas@gmail.com" <frattaroli.nicolas@gmail.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "michael.riesch@wolfvision.net" <michael.riesch@wolfvision.net>,
 "pgwipeout@gmail.com" <pgwipeout@gmail.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2FzY2hhLAoKT24gRnJpLCAyMDIzLTAxLTIwIGF0IDEwOjE2ICswMTAwLCBTYXNjaGEg
SGF1ZXIgd3JvdGU6Cj4gPiArwqDCoMKgwqDCoMKgwqAvKiBFbmFibGUgTFZEUyBtb2RlICovCj4g
PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGx2ZHMtPmdyZiwgUksz
NTY4X0dSRl9WT19DT04yLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkszNTY4X0xWRFMwX01PREVfRU4oMSksCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBSSzM1NjhfTFZEUzBfTU9ERV9FTigxKSk7Cj4gCj4gSXNuJ3QgdGhpcyB0aGUg
c2FtZSBhczoKPiAKPiDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGx2ZHMtPmdyZiwgUksz
NTY4X0dSRl9WT19DT04yLAo+IFJLMzU2OF9MVkRTMF9NT0RFX0VOKDEpKTsKPiAKPiBVbmxlc3Mg
SSBhbSBtaXNzaW5nIHNvbWV0aGluZyBJIGZpbmQgYSBwbGFpbiByZWdtYXBfd3JpdGUoKSBlYXNp
ZXIgdG8KPiByZWFkLgoKdGhlIGZvcm1lciBpcyBzZXR0aW5nIGEgYml0IGluIGEgUk1XIG9wZXJh
dGlvbiwgdGhlIGxhdHRlciBpcyBhIHBsYWluCndyaXRlLCBpc24ndCBpdD8KCi0tIApBbGV4YW5k
ZXIgU3ZlcmRsaW4KU2llbWVucyBBRwp3d3cuc2llbWVucy5jb20K
