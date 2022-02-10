Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498B4B1F8F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883AE10E9F7;
	Fri, 11 Feb 2022 07:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 10 Feb 2022 17:31:10 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D410E45D;
 Thu, 10 Feb 2022 17:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1644514270; x=1645119070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+3qaSAZs7JSnCaI28/AS26CG9fTNUoll7PmTU8RnjDM=;
 b=PkmmG5xQeh1co1bDisBY6mtCyhJ04LTaCXXZUVCs/itzQYk2P0ehdtCk
 pX1S+YsX1f8Yj6OFlOOe1B3o7/d+sJ1I5OsQD6JVbkoyBN3ncmydMPgFa
 W5AE+KYG9qZAhilSDkPk8yMazCjglGyAtNBmc1+nupEYKVz/gRGdmAbLc s=;
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 17:24:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8i86HJfyQFG/K6YWzULknKSVnMMS6lh7MOZ6yGnF6/zMZJQgL0v2998518V/A6nwSCmq+/SQu/xlJWZHy/DobHxqjDBKk17TmC/z90zzDRBSu7BrOEHYV621JDWaw0tCAxjUWlxV7gYbv0So0mSBVjNEh9iKOCTtIWw7gprr4B/uDAjg3KIEMmzxqRxHIj3HBHoNTGy1wtkIRxm/HchaNrT9heOUzMptfuNcjReuMQNk2d4HFG499+6E15tjxzc8oCOXNKmU1lyT7c6F2Y0gX+3I/a/2qdS20xZwNnt7/ip/R3ObSszciehKaOPfEwx44p/cibzymoTj46a4Dk+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3qaSAZs7JSnCaI28/AS26CG9fTNUoll7PmTU8RnjDM=;
 b=ekoqTeldC0zmkEkQBGSFr0IIONEwCywPUrxb1uzyMbAQ04cO/AUHeQHBIKykwhTcd7/rqmYxNCSOJ8ISQkHO5F2Pro/LxS9lOD1/g1fVw0hSx+cJ93o+h5EUq7eg8JRxFpCd910JcZy9r5BRQOqy8Nk36UEBDYAkIyDC4de4jw8808ajhacwfL4XjQgXktWWQcbVCC3lqU4sUE0yPjV5WhQwNKDa1LQjpQA5GGJsZmVnhX+vmcz6jPTJvzb9XyM+DMvuu0i6s1GXU9vGNUHl/vjiXThUpYxfcAAleB1p5NNiJ0RwB8KtJGH3JUfSfKylOF/Va52rm/taKClkXFDUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BN6PR02MB3218.namprd02.prod.outlook.com (2603:10b6:405:69::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Thu, 10 Feb
 2022 17:23:57 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 17:23:56 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "agross@kernel.org" <agross@kernel.org>, "bjorn.andersson@linaro.org"
 <bjorn.andersson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "swboyd@chromium.org" <swboyd@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: RE: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Thread-Topic: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Thread-Index: AQHYHZLpazYQE5h65kS31b2Hu7lVo6yMt2oAgABRz+A=
Date: Thu, 10 Feb 2022 17:23:56 +0000
Message-ID: <MW4PR02MB71863A6E5EBF0884EFA18671E12F9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
 <00e9ade6-1830-f19c-4dd8-0673809166b2@linaro.org>
In-Reply-To: <00e9ade6-1830-f19c-4dd8-0673809166b2@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531952bb-ce91-471c-78c4-08d9ecba1e86
x-ms-traffictypediagnostic: BN6PR02MB3218:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR02MB3218D825EBD995A5E94C5ECEE12F9@BN6PR02MB3218.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFZc1uw+V/wA22F0zAsBcLVNzKXBvqq3D7ZADsrAwImcGUo86oFQq9xMXsXCXzB8hq5bIZFkryxNFjpx0d0h7D5cN12V1T641ox94yWN0vUf5vG6KSaLROyARQ0Gqn2TvO7ONSNw0lRXrAI8D2h2uIckqL3ofyjMHwC0pW3vbwfrbsJ2aazo5EAd0Ra1mBHTL2u+5kze6gUD37L5KCuMIUt6jUqdJ0YssNWWyovy2UMOBGo4MLW318boemXd47dB3YWduwmwiwjHj1POZLTXjCF/M/3rFwxesMyPf263429gaZsgebkx2asDjt4BONR7m3x9WjNJWy7Ok/QSTOawmmIbotHqC9qhBn4Ds2kW203J2yPEOP98gFAL9TrmX/Hp2lQGTSYCnHZLhH5sBxOVzt+hk7Ft0wfnqpQdmPiwJpflmASVLcZ4x9jov4180mrghEhC9W2A+mXVoEmu1yFEcHFzxo8Q/FGwy8p+NpZBekFXr9sAl/DfdgUiCOL539w/ZFcdaN+n84BkuxtyVw/DWghcs+q1vBICmpBJV1tJCjyahDFfofRRhX2KhrhvvXTnr/b7A3S/ReE2zvhpDd7IOgpDrcHNmhoyepPU8b6sqFCoETuPG9r9Ux1rnAM9m4y/kiTAGLyh1vWdt4BpJdunYm60ijw86/QAZ8O8zphC9II23haywYSPwOfn7BKipS3D4reh50HIQyR/OBn8dcl/oSt2GC8WZxWK8fNh53Lp9iI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(54906003)(8936002)(8676002)(4326008)(83380400001)(110136005)(508600001)(316002)(122000001)(66946007)(64756008)(107886003)(66556008)(66476007)(66446008)(76116006)(38100700002)(9686003)(6506007)(7696005)(71200400001)(53546011)(33656002)(38070700005)(86362001)(7416002)(55016003)(2906002)(921005)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3BucE43djhUYWJwbnozSUNvNkFTQW5Lb3RWZ25ScHpFYjNpTnVzM25PQ2pn?=
 =?utf-8?B?bFNHY0VzT0NpM1N5bmxvb09aSHlsUkQ5a0tSRDl6QVhQbTFGamd6UUlWWnhl?=
 =?utf-8?B?dFhBM1BHMi9lZ09GRjNWRmI4enVZSHNWYUFueHdhcTM5WlFuYTlMZ3Y5Q2t1?=
 =?utf-8?B?UnBlTitPSVpGTzd5WitzVnh2RjY4UFl5VUNyZ0F6NVhJYjFiZkV5eUptellk?=
 =?utf-8?B?MlBsZTVIdEFVRlp1Si9KM3ljOG5IZmFUYy9lMVJXQ09yUHpxQmJmTC84Mk1t?=
 =?utf-8?B?SDB1ampUU1JKTVV2UGpYZktGUWJ1d1owMnJ0OGFzZ2wyd2ZKRTZROXNScmpZ?=
 =?utf-8?B?QXhwdnAyWFFZQnpqK3JvWTJxcWNjcHh2MTNvY0FvQVBuV2V5cHhlelkyVEpk?=
 =?utf-8?B?Z1MvY1ZLYVFLbnJwTitqRDEzcWErbks4c2VBQkxyL1B1SVh6VXV1YnozSlov?=
 =?utf-8?B?d2VBb05Fd1oyZlJ6cHJJb2VpbVRTcENwVjMzTCtrUVQySU5vQnQ1ZENCS0tZ?=
 =?utf-8?B?QnVyNVBxaTRLaTQ4ZmpMTTh3NUd1R0p4Ym5TUVAwdEF2QU5xMm43dUZaVE9k?=
 =?utf-8?B?SVl2djZYWGt1LzJpdEN1WlA0V1lpa0ZSaTRzVjBvektWdTF1OEZUbXhyUmNU?=
 =?utf-8?B?Q1VmcUdQaEcrRkh5b1k3VDhkQm9aYnIxMEY4cVBIT2ttRDEyaE5lNTFpTGZx?=
 =?utf-8?B?eVpQcVJCSTcwS1N6K2lyR1V1QURYOTVKZ1NQTFJINnJlUHFjUXkycVROVUtD?=
 =?utf-8?B?SjQ5NldOUVhmcmczNEsvTXZtbC8vdVl0dytPVmFjNHd5NFlIOWF1SDZwZStu?=
 =?utf-8?B?U09nd0FDejZuK3ZTTzViNWFXMkdMS2xWaVIxbTV4QWMrazlDRENKNmJtVFFK?=
 =?utf-8?B?dlpIZXk4dy92QkdOT2lNS1pmM0w1dlIwQ3hobjZ2ckpwa2F0ZXliOWdaR0gx?=
 =?utf-8?B?M0pWdEwwbjBNT0syeFEybjN3bW1kSGJNQ0NGQ2RHUlBEZFoxTXhHUkdJYTR1?=
 =?utf-8?B?cE9KajhuR1MyTklaT0x0Sk5NV2tQRndCcnY4R0VkTUNxTUNYa2RMTE1nRWda?=
 =?utf-8?B?cEhWT2oyK3pYS3haRU5kemVQNGFsRGFjTHlub1JGM1dTOE15VnIyazBmby9z?=
 =?utf-8?B?T3dtUU55MDBBeDUwck5TV1JQdUJJVzRkdFlZY1Nza0l6UktaWXZVUlpSN21O?=
 =?utf-8?B?M1ZBUzJ3dHE3RG9Ua3pjYWk5RGc4dTA3RHFHME5KbTlPNFNGdVNxSEQ3MUxR?=
 =?utf-8?B?OG10ZFFTdXFOVmxjVUE5RThqUWVtMkVsdWNuNnh3bWdyR2VpbnprZnRLdGRs?=
 =?utf-8?B?YzczVFZUVGNXOE0zSDFZcjFUWGYxREdqUk9TN2t0cDlSb0p6U2kxcmNvUTEy?=
 =?utf-8?B?RnpkUkgvLy9NQXJoMDRFUFErcUN2K3o1NmRqSnc2aVhSMTRkRG04Vm15SUNI?=
 =?utf-8?B?dGpVUkwvUmxaS1N5NlFXVmRUL1pYVExOa09NQXdPeTlqYzlNMksraHBkL29i?=
 =?utf-8?B?cHFpZTlMVXhBNWFpRXNTazRBZU04c21CWDdsMEp3WWl1UUswY3hrR01xL1VV?=
 =?utf-8?B?K0xiQTlKYzg3MUpQdHpSMGVJWmZjb3FvZ0Y1ZkxvcTlxbFdpRDEvRXExMkxK?=
 =?utf-8?B?cERNUVUrcjFMY2RpYmxSMDN6RUtocWgrM3E5T3d0Mkh2VzhMckJJSDF3djI2?=
 =?utf-8?B?eWpJVlZ2dDMrVmJ1aWxUbE1oQTcxSyt3OGhCYkpTeG1nZ2hHZWV1eCtDT09h?=
 =?utf-8?B?blRqeTFKVU95QVVYdVlNYldGdGhaaEpES055cjluZHNVRFYzQnlSSGNZa1Jq?=
 =?utf-8?B?WUFCRVJ0eTBrRXZNNFJRcEFTc0VaYUN4czRSeXl3RjVoNDNpYWdWQ3BMUk9O?=
 =?utf-8?B?dVU0bC9XQXV1VFl4ZFRkZWVwR2xZRFJ2eWVRelFMV2RIRTlrYlZRdk5POXha?=
 =?utf-8?B?ZnBEUk5kWDJIcTEwUk5FV2JNaUVnR21NOVhWQ2RVb2VDbGt2c2x6eUdpQUN5?=
 =?utf-8?B?dUh1c25JY1JsSWJHYjVqVmJta3h1amVFcUhXZXlWYlB5akNPbmJTNWh3NFds?=
 =?utf-8?B?a25qL2I4TExyNmZDUGZyNkRQNWZmbFNDM29QSURDZ0x6VlhPbmpvS0RJVzdO?=
 =?utf-8?B?eUg3c2lWbmNUcXUzenlzekQ3WnpyOU9mbkg4bGVCc1dLcjBVNmtIMUR6ajVx?=
 =?utf-8?B?aW90NHBhc25DQ0ZFcUV6STFKRUdLb2wwMm5TMTNQRSsvSlc5OHNBM2pFNGhB?=
 =?utf-8?B?RitjT0VEWGp2amRobWgwUEEySGpRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531952bb-ce91-471c-78c4-08d9ecba1e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 17:23:56.5462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wW9HzfMrVHXGtouLGyQxAEf9JElwa1h8jbm4kPBY8BMIPtiJFukScf0a3B+wO2SoVzDbO9BjX3tWQjkchKq/11QfL9Bw6iYGemyPFnICkss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3218
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQpBcyBkaXNjdXNzZWQgb3ZlciBhIHNlcGFyYXRlIGVtYWlsLCB3ZSB3aWxs
IGJlIGV4cGxvcmluZyB1c2luZyB0aGUgZ2VuZXJpYyBwYW5lbCBlZHAgYW5kIGF1eCBidXMgYWZ0
ZXIgaW1wbGVtZW50aW5nIHRoZSBiYXNpYyBQU1IgZmVhdHVyZS4gV2UgYXJlIHVzaW5nIGEgbm9u
LWdlbmVyaWMgY29tcGF0aWJsZSBzdHJpbmcgbm93IGJlY2F1c2Ugd2UgZW5hYmxlZCBQU1Igd2l0
aCB0aGlzLiBUaGUgY2hhbmdlcyBmcm9tIGF1eC1idXMgYW5kIGdlbmVyaWMtZWRwIG1heSBiZSBp
bnRydXNpdmUgZm9yIHRoZSBkcCBkcml2ZXIgYW5kIGhlbmNlIHdlIHdhbnQgdG8gZXhwbG9yZSBp
dCBhcyBhIHNlcGFyYXRlIHRhc2svZmVhdHVyZSBhZnRlciB0aGUgYmFzaWMgUFNSIGZlYXR1cmUu
DQoNClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiANClNl
bnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxMCwgMjAyMiA1OjU1IFBNDQpUbzogU2Fua2VlcnRoIEJp
bGxha2FudGkgKFFVSUMpIDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPjsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBhZ3Jvc3NAa2VybmVsLm9yZzsgYmpvcm4uYW5k
ZXJzc29uQGxpbmFyby5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsgcm9iZGNsYXJrQGdtYWlsLmNv
bTsgc2VhbnBhdWxAY2hyb21pdW0ub3JnOyBzd2JveWRAY2hyb21pdW0ub3JnOyBkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc7IGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbTsgdGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tOyBzYW1AcmF2bmJvcmcub3JnOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5p
ZWxAZmZ3bGwuY2gNCkNjOiBxdWljX2thbHlhbnQgPHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT47
IEFiaGluYXYgS3VtYXIgKFFVSUMpIDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsgS3VvZ2Vl
IEhzaWVoIChRVUlDKSA8cXVpY19raHNpZWhAcXVpY2luYy5jb20+OyBxdWljX21rcmlzaG4gPHF1
aWNfbWtyaXNobkBxdWljaW5jLmNvbT47IHF1aWNfdnByb2RkdXQgPHF1aWNfdnByb2RkdXRAcXVp
Y2luYy5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNF0gZHJtL3BhbmVsLWVkcDogQWRk
IGVEUCBzaGFycCBwYW5lbCBzdXBwb3J0DQoNCldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mIGFueSBsaW5rcyBv
ciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KDQpPbiAwOS8wMi8yMDIy
IDExOjU1LCBTYW5rZWVydGggQmlsbGFrYW50aSB3cm90ZToNCj4gQWRkIHN1cHBvcnQgZm9yIHRo
ZSAxNCIgc2hhcnAsbHExNDBtMWp3NDYgZURQIHBhbmVsLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBT
YW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCg0KUGxlYXNl
IGV4Y3VzZSBteSBpZ25vcmFuY2UsIGlzIHRoZXJlIGFueSByZWFzb24sIHdoeSB3ZSBjYW4ndCB1
c2UgZ2VuZXJpYyBwYW5lbC1lZHAgaGVyZT8NCg0KPiAtLS0NCj4NCj4gQ2hhbmdlcyBpbiB2MzoN
Cj4gICAgTm9uZQ0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYyB8IDMx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWVkcC5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1lZHAuYw0KPiBpbmRl
eCBhMzk0YTE1Li41ZDEzY2NjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtZWRwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWVkcC5jDQo+
IEBAIC0xNjA1LDYgKzE2MDUsMzQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHNo
YXJwX2xxMTIzcDFqeDMxID0gew0KPiAgICAgICB9LA0KPiAgIH07DQo+DQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgc2hhcnBfbHExNDBtMWp3NDZfbW9kZSA9IHsNCj4g
KyAgICAgLmNsb2NrID0gMTQ0MzcwLA0KPiArICAgICAuaGRpc3BsYXkgPSAxOTIwLA0KPiArICAg
ICAuaHN5bmNfc3RhcnQgPSAxOTIwICsgNDgsDQo+ICsgICAgIC5oc3luY19lbmQgPSAxOTIwICsg
NDggKyAzMiwNCj4gKyAgICAgLmh0b3RhbCA9IDE5MjAgKyA0OCArIDMyICsgODAsDQo+ICsgICAg
IC52ZGlzcGxheSA9IDEwODAsDQo+ICsgICAgIC52c3luY19zdGFydCA9IDEwODAgKyAzLA0KPiAr
ICAgICAudnN5bmNfZW5kID0gMTA4MCArIDMgKyA1LA0KPiArICAgICAudnRvdGFsID0gMTA4MCAr
IDMgKyA1ICsgNjksDQo+ICsgICAgIC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTlZTWU5DIHwgRFJN
X01PREVfRkxBR19OSFNZTkMsIH07DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxf
ZGVzYyBzaGFycF9scTE0MG0xanc0NiA9IHsNCj4gKyAgICAgLm1vZGVzID0gJnNoYXJwX2xxMTQw
bTFqdzQ2X21vZGUsDQo+ICsgICAgIC5udW1fbW9kZXMgPSAxLA0KPiArICAgICAuYnBjID0gOCwN
Cj4gKyAgICAgLnNpemUgPSB7DQo+ICsgICAgICAgICAgICAgLndpZHRoID0gMzA5LA0KPiArICAg
ICAgICAgICAgIC5oZWlnaHQgPSAxNzQsDQo+ICsgICAgIH0sDQo+ICsgICAgIC5kZWxheSA9IHsN
Cj4gKyAgICAgICAgICAgICAuaHBkX2Fic2VudCA9IDgwLA0KPiArICAgICAgICAgICAgIC5lbmFi
bGUgPSA1MCwNCj4gKyAgICAgICAgICAgICAudW5wcmVwYXJlID0gNTAwLA0KPiArICAgICB9LA0K
PiArfTsNCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzdGFy
cnlfa3IxMjJlYTBzcmFfbW9kZSA9IHsNCj4gICAgICAgLmNsb2NrID0gMTQ3MDAwLA0KPiAgICAg
ICAuaGRpc3BsYXkgPSAxOTIwLA0KPiBAQCAtMTcxOSw2ICsxNzQ3LDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsNCj4gICAgICAgICAg
ICAgICAuY29tcGF0aWJsZSA9ICJzaGFycCxscTEyM3AxangzMSIsDQo+ICAgICAgICAgICAgICAg
LmRhdGEgPSAmc2hhcnBfbHExMjNwMWp4MzEsDQo+ICAgICAgIH0sIHsNCj4gKyAgICAgICAgICAg
ICAuY29tcGF0aWJsZSA9ICJzaGFycCxscTE0MG0xanc0NiIsDQo+ICsgICAgICAgICAgICAgLmRh
dGEgPSAmc2hhcnBfbHExNDBtMWp3NDYsDQo+ICsgICAgIH0sIHsNCj4gICAgICAgICAgICAgICAu
Y29tcGF0aWJsZSA9ICJzdGFycnksa3IxMjJlYTBzcmEiLA0KPiAgICAgICAgICAgICAgIC5kYXRh
ID0gJnN0YXJyeV9rcjEyMmVhMHNyYSwNCj4gICAgICAgfSwgew0KDQoNCi0tDQpXaXRoIGJlc3Qg
d2lzaGVzDQpEbWl0cnkNCg==
