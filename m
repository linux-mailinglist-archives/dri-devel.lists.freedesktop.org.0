Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867FC4B0CDA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEBE10E825;
	Thu, 10 Feb 2022 11:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B08610E823;
 Thu, 10 Feb 2022 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644494236; x=1645099036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=exKlbmYv/oyaqwWImyuDqeBArqspuLQJo/KP2mwUT2Q=;
 b=Y/HBUMT854a1U5wI4Dnr1ABWi9lJYjueu4QcvZXOuLdUBwhTs8GbDoFi
 faS5iq7sd9lJN8E9PehhmeKbjyAS5b+NiOHKHVpfs7PFN1aqEEoceGQQD
 kQYYiN2YszRgoDA/NewkU3deRJYhjJ9PrJg0L/comvRo1LahqI80dXt9K U=;
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 11:57:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5Qi5KiesyH9nSO8vYr6P68to/85gB1JGk+HhHKBXQlSlIOlWt4DHYEeiGb6WV4Bai1kt0KwlHXFUHRD3bBkjFbWQXIM6ljE/sMfePY4h3zleNaFULNgrD5HApkUJbkaLgK4WjAAfgG1YRs09EGBh9d1dG1rBsm/rcwjDil9Zm5CXZxWzj3Ph9cH63v5e8RbVDGdAgUh6v3Z18/YEvhEE+DdoofJiJv8EKpj5zb5r+3TaStoArfCu0k5lGUUFpjvQg5Om9N5PFtdXL4VDR+zK7Yr4tKc7ZOv+T9ifSIzGg2g86elyImoYOzlsYm6Ect4cgCPhtpbT5nNl4FUbrtMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exKlbmYv/oyaqwWImyuDqeBArqspuLQJo/KP2mwUT2Q=;
 b=IV7OBlYRCxQiOUhIwcbRzSuCh92SszGUnbTNT4BWEwxxRpGrdGRlsXUFJgekJ3QR2vw3JQRkg2USnSdAH2T/3Jc4LzqEIXxYEAhskXYDgi8PWdjWB54oA1Q8ZVB9n68Ox5Wek0sgD7liFtEKXCxyqfniwIeeCM24cEMCgP22KS/pFXyXI2w2wF7HLlyaCRe0/BHtpfMrBMXkfTMa5paMaQiRWao9KLkZA1+iNfophtaQukPp/du5F4lSZF78/PRvd6mNt2bmvz1nJDmSdQ6HdWiOxnJgVY3USI1RZVUmzCMsfHa6GGxWVjL506JlFGgHsc/XJyDghN+dYws9FRTfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN6PR02MB5277.namprd02.prod.outlook.com (2603:10b6:805:68::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 11:57:10 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::2d87:6bad:f96d:9006%3]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 11:57:10 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "agross@kernel.org" <agross@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "bjorn.andersson@linaro.org"
 <bjorn.andersson@linaro.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>
Subject: RE: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Thread-Topic: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Thread-Index: AQHYHZLpazYQE5h65kS31b2Hu7lVo6yL/JSAgACy7aA=
Date: Thu, 10 Feb 2022 11:57:10 +0000
Message-ID: <MW4PR02MB71860D663CCAAE4BB37FA119E12F9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50FK4FSr6Xau9-UBYk9-0kVrETkCPr8TaDrPGS7BN6pMQ@mail.gmail.com>
In-Reply-To: <CAE-0n50FK4FSr6Xau9-UBYk9-0kVrETkCPr8TaDrPGS7BN6pMQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5387c78-fe0b-4a1e-1b1e-08d9ec8c77f7
x-ms-traffictypediagnostic: SN6PR02MB5277:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB52779AE744849EAB0D536A3B9D2F9@SN6PR02MB5277.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5j7zYR1K4bWrGv1CY50OHDiESUUDSQtPs4DfFmina8nBRwau/H73RI7CMrB5VlW6cZeea9yq/h38FeVlfkVIdRPKnnXDWwHYyuCDBFbVoRVIGiene+wXMk1fhwSAhpygyR4+f2PAQn/Uq9S94P2CvjPorQCQEU5ASTo47DwNXnVO47dKDkNMsg8Sj31LLF+Wqpxz9N0Mh1+Ab+K8ew1dpYEFIK2Lj8nxraV0g/wNpgL5ATa5X7rw0hDloBdv8dSWFWSoQjtjK9Fau1xsdiuJK/tWhOrpAO66pq4LAMk2VG61kzIQ5z0A0pvcOow9RyGlO68imq3WGQ6FtiGYyDX8r/3jEn0bWl2LKwFCSUfHqFELl837UVXDfE98dEqbaj9Yl89kau8HWNoWFEIeo3sJlLc90a23OVpB0BYfOdMc3u+LDhUstQdkI0F/aTsDrkGXEXRDcObCjqINZCJraxyS7Zc8W5j10vCNfSphNM9cii2JmjQKuDwC12cNFXQ2ZolPLEWRJ1iFCLPhPw89e4dLuqwWgQ447zCUPDGr9usuLQl74L4HqU/dYRyJGXBbW1MUM3WtvTD3ZC7sDnSHiy55uj9JPTkl6I5t51Cvxd8bvYWkfgAoO4mGp645uuiXx+nqFM8rjaCuu1/R9T9e9QfVIuh+Iu4qcIjsc/vLKLP5hKx5mOxFFS06IZ0VDcsCjOwU+3M8HxFQoXZ7m56v3Flii7ItovvrFzgBSFA2DKyG+Iw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(71200400001)(8676002)(107886003)(6506007)(110136005)(86362001)(38070700005)(54906003)(53546011)(4326008)(508600001)(8936002)(7696005)(316002)(55016003)(33656002)(66476007)(66556008)(66946007)(66446008)(76116006)(122000001)(2906002)(83380400001)(38100700002)(9686003)(5660300002)(7416002)(52536014)(921005)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2owU1VNSWhFUGRobCswZythY1dJdG5IQlI1S2JFd2VOc0U3dEN4b2lHdDRO?=
 =?utf-8?B?eDZlTytaWFl3ZndXRnFSeU40cFNROXI1d0tzQ3A4NmNrRnUzLytBSTNVT0pH?=
 =?utf-8?B?WkVZKzFzdjZFSHczRks3em80ZWdrL1VzR1dNcXk4czJyejkzSVlLa3ZkTWFz?=
 =?utf-8?B?WlltdnNLNks1OU1SS3ZjMndLZlIvb3YyZFBoUTNqM1NRd1k3K1pQZnpQdlNu?=
 =?utf-8?B?ZXdKVUY0ZFV5cmxtcjJrQ1M5TTROOTBZbGRPeHp0OFBwZlM2dXVaM21rYStF?=
 =?utf-8?B?N3RsejhpSlpqZmJyb2pmV0JYZDVIeTRGRkJ4K0NtOW02L2VOa1JXazNQQmF4?=
 =?utf-8?B?cmFMVEtaRVpQMGhwM3NYY0Fob3hOZXB1YUhqWkVpWEN5c0RwZEIxK0pEekdB?=
 =?utf-8?B?MVZFS0dibTVzM05RU24wWGJsKzQybXJtU2doaVprcEhBa1lGV2dCQUdTeG9E?=
 =?utf-8?B?YWU0cE1jRFNrN3pzTlM1Z1AwVXl2TGhtRFhKbzNDNlR1SW90aHhoZk1PaXFL?=
 =?utf-8?B?UGlXenJqVkpKbGplWC9xV2pDNnIxWExPM1hsdlVqME1XWG1sMDdIWVZ3Q1p5?=
 =?utf-8?B?S3RNZHZzV2tqWUZlTHpMdmtwVFF0eHRpajJyVXh3WDZFL2VLbFhFSHB1WHhx?=
 =?utf-8?B?NUhJbTJzNE14ZkdKZGNNc1dDTEg2NTdXelpwb0xyUm9WSzZTQTlNNzJPeUhs?=
 =?utf-8?B?UGNMR0wydUhTQnc5OS91LzFJdzlQanBRUC9VeGhZaUFzUTk0THNsa3hIQ2lL?=
 =?utf-8?B?UU1ZU3dqbmZNcWtsVHoyZG4wdEJQRmJjNndVWXRrV3A5cmV2anFVQ3E3KzZq?=
 =?utf-8?B?a2w1WXNUdHdRNjhoQXpIQWRiaUptYWZ3Y0dwbVNjLzhtM3REc1djMk4wWjhv?=
 =?utf-8?B?aEdaN09xNkozSTdpcFFlYUhocjJDYkFZWG1iaVRUSnkzWitnYndrUGxHN1kv?=
 =?utf-8?B?b3RFU04ydjd5Y2pOVG1keDBVaUF4VlVFRlR6Q3g1Rks1MnMrakxIZVBGQVEw?=
 =?utf-8?B?dE53dGVnb2xsbmJmZktMTi9ocTExTVJGVWZnWko4ZHAyeUpBZGZRY01xd1E0?=
 =?utf-8?B?T20wbWkzbVg5aWMvZCtJRjdXZWpnSjRyVllSczU5VGNCdzFvMk1FNCtHWXIz?=
 =?utf-8?B?Uitwd1dPT1FTM1l0SnlpNkhtOWh4MFFaUi9BYXN4bFkyNXFKV0x1cndsVXpO?=
 =?utf-8?B?allwd0R4RHZEMDd2ZHdQbStZN3AxNm5WNjRMd3B4bHdwbmpzOXd5S1FNWnV5?=
 =?utf-8?B?bHhLZzFQM0NpNnBHVy9JaWd5MnVrZGNUNHY1RnBGTjIyUythbDZQTU1NZFh3?=
 =?utf-8?B?RXcvbHdCTUtvTnV3ZkJhTks0bXc5WWEyaktEOGlGamM0MFkrdlZKOG00eDdx?=
 =?utf-8?B?TFZ6RWl5ekF1cDNXRjZIdDFMMlJyR3Z4Wi8wR0t6czdBdEdKQ3BaZnlMbkpt?=
 =?utf-8?B?MmFXbmlyNm1TVzh3MkZmMnh4d2wyQVZ4MFh0WEZjclY4UFNyU1M3NVRSRURo?=
 =?utf-8?B?TE9kSGMrU1c2MjRaTUlmSS94MVUyZEU0ZjVmS1FaM0FiNHhGbGRwcWpmMU5M?=
 =?utf-8?B?dUwvWkpRaUwyVnBrT1hMcG9KWHVmM2cvbXlEMEYwK1QvdERXcnVMTC9kZTNR?=
 =?utf-8?B?d1pvNDRyKzZuUGFyNjdkTXVSNmpEVi9ad0hxdlBTaTlpbitxeFp5YkM5Y3VU?=
 =?utf-8?B?Q2FoZUJCYXQxMUdINm5mY0F0dzZhTjB6aDI4UW5wOEZrb2tCQ1N3VTNOdUlN?=
 =?utf-8?B?b2V1eGhHa3ZqRHpiZnZwYUpSRHpIZ0Z4ZGdsNVhLdWFrMVZ6UTl3WVVVZjln?=
 =?utf-8?B?STR3T2p0S0FxdGNQWHN2ODJlaVpvYnFiS2Y5aDZ5cjRQdzB6Ym1DMGNPcDJU?=
 =?utf-8?B?TG5NZXRqb0lKZ2pyTzNEdmdQR2gzcHZZcmtJN055UXRPMjBzRnJlRTZiUWpq?=
 =?utf-8?B?MDhzOFlMTUlUVEtjdmVZcDdSeUFpODl3UlVZYUgwTVd1OGNtYlFyeU5Qcy80?=
 =?utf-8?B?ZWN6Tm12MHFBOFlIMXpCeVJ1OENtUTJwcDJicFVQVlBlejZhcFcrZzZtYWpS?=
 =?utf-8?B?QTIwUXQrTkZnL1d4YXYxTDJsTHQ4ZzZDSkdERVkyK0oycUZvMlFvNElyUWdX?=
 =?utf-8?B?cXFmNjdKOFJXMk9MaG50RHhyWE8wL3VteGx4WTFUcUM1V202TFArY05mSHBF?=
 =?utf-8?Q?UR1lDZv5jdOnTX8ke7HkW6m0vBVVz0S+WAeYK38sL5WC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5387c78-fe0b-4a1e-1b1e-08d9ec8c77f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 11:57:10.0645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7u777bToE6bMudafyqDkW5R1JkC62cQ0hcnfmvEJCnHDrxb6XpNBKSxsiSZyqqWqGFq6d9I9bjW46une6XEz831qDiDrKtFvXzmxwcLV/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5277
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

SGkgU3RlcGhlbiwNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHNoYXJlIHRoZSBu
ZXcgcGF0Y2guDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGVwaGVuIEJv
eWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+IA0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEwLCAy
MDIyIDY6NDcgQU0NClRvOiBTYW5rZWVydGggQmlsbGFrYW50aSAoUVVJQykgPHF1aWNfc2JpbGxh
a2FAcXVpY2luYy5jb20+OyBhZ3Jvc3NAa2VybmVsLm9yZzsgYWlybGllZEBsaW51eC5pZTsgYmpv
cm4uYW5kZXJzc29uQGxpbmFyby5vcmc7IGRhbmllbEBmZndsbC5jaDsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGRpYW5kZXJzQGNocm9taXVtLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga3J6eXN6dG9mLmtv
emxvd3NraUBjYW5vbmljYWwuY29tOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9iZGNsYXJrQGdtYWlsLmNvbTsgcm9iaCtkdEBr
ZXJuZWwub3JnOyBzYW1AcmF2bmJvcmcub3JnOyBzZWFucGF1bEBjaHJvbWl1bS5vcmc7IHRoaWVy
cnkucmVkaW5nQGdtYWlsLmNvbQ0KQ2M6IHF1aWNfa2FseWFudCA8cXVpY19rYWx5YW50QHF1aWNp
bmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+
OyBLdW9nZWUgSHNpZWggKFFVSUMpIDxxdWljX2toc2llaEBxdWljaW5jLmNvbT47IHF1aWNfbWty
aXNobiA8cXVpY19ta3Jpc2huQHF1aWNpbmMuY29tPjsgcXVpY192cHJvZGR1dCA8cXVpY192cHJv
ZGR1dEBxdWljaW5jLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy80XSBkcm0vcGFuZWwt
ZWRwOiBBZGQgZURQIHNoYXJwIHBhbmVsIHN1cHBvcnQNCg0KUXVvdGluZyBTYW5rZWVydGggQmls
bGFrYW50aSAoMjAyMi0wMi0wOSAwMDo1NTozMSkNCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSAxNCIg
c2hhcnAsbHExNDBtMWp3NDYgZURQIHBhbmVsLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYW5rZWVy
dGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gLS0tDQoNCkNhbiB5
b3Ugc2hhcmUgdGhlIGVkaWQtZGVjb2RlIGZvciB0aGlzIHBhbmVsIGhlcmUgdW5kZXIgdGhlIGN1
dCAiLS0tIj8NCkl0IHdvdWxkIGhlbHAgdG8gc2VlIHRoZSB0aW1pbmdzIGFuZCBtYWtlIHN1cmUg
ZXZlcnl0aGluZyBtYXRjaGVzLg0K
