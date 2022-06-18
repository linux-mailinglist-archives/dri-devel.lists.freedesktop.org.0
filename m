Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E75504BE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F2810E730;
	Sat, 18 Jun 2022 12:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BB310E71A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655555742; x=1687091742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
 b=Gx/enxInUYwEJEt7RCdNJyrOyRnxSMiB6r8G60+v7dqGxdmiR2ZMbqiy
 kgaKLFFJK/Tuh9Hch3AsYREFwVhgKDLcf3lyL2u6LiTNh1LNIkHl7/bl4
 BucI08u59RdrCoSmMFjO1/7UYZ3U9922XnuXrcYUtWm6axoMxT7Q1SKdT
 jANS+W2J8nJF63Xwfwuj9bykVw6IJcpFOM2YzDd+OJes8q6QT9AAyr7d1
 3qLRhwHEnWuWrDfS7jRF5krbU5yIF6UXfXOYQB3fdmIjOsqhInl3SPSZ+
 I+T9tsqBhP9BCaWIY1zCFGBtIBJrjpj7oWHruH4DvZVO4tWCb2t0cz5x8 Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="100644470"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2022 05:35:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 18 Jun 2022 05:35:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 18 Jun 2022 05:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWCc9+pUO0GLaYNBv/Xu96TxsGYmqA6MMc9k7KXRDFXGWmr9Iqh7rMr7yMIFcrMLCQ6ZbAn9O8pvKCQ2BeNbFpcJdZnWc/KnCY6NS1w4bb3de9rpoBUf4RmzlOdjUCnkv1FLkLNgwX/XsdbAKSmmcC3VezQP981b1QXk5VfX+T/1JlYvuuurLps6WIbPEH8GPCeKMEd3UTUF+XDvVLzoV/o8S3ZI0F+G8pwXqlG3+Y18NA7eQ9zdfVAyWPS3w+YqPIv5dtXjyvcYGIEx0aH+Qde5kMSiuN9E6Kj0vMGFqEe1cYt9JorXhrGZsvLfTeDNf7P7jO+Yayi+xUnfcnpmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
 b=J+CwOvJJsJ2D+OyYBXz3o067Ji0BeZNYR5M/V2pBIxqScKoqlwboSCgkQvbNpm+szKs+04HXbC/XX4LJ32RfvqokER+stWb+nE33a/3qPf/chhDDj4f2IzzVjnMlJmkjCAhJcIbuLQ11DwrCl2R6pAMPq4Lnr4QdAVgu5YBvMcZdWWrMNW5XAwextjLr19E+grgwydojSOBD3RHCU/VFYjtaWe6RQTBewc+BFfG8S6l0XPRpvg5K4zIhYSIPKDp9gE4x+nwcSj0mAp+JW0G9ggPdx804H9fvvsJh1mtolYiFxYcOeBDknipmv/z2Sk4J++jgxt3tn9CnTpUnSV/TAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDT49E8UQeNTe1111UJ6CK9tUQvQ+aw3BhSkeHrYIqE=;
 b=EK4MJ1Qq34mHcCc6UQF1YKZiwnHNnGZHesB6Y8YENDP7G/0GvlthFxztz+UwHUOL3JAAKunshrE8MPDp9axdzGO9isq0ywoTkwc/p2m06X/Rm982w4pux+EmK9/MA6Yyqg4G/nkGB9mZUgcqFumEMVzpPRmZs5e2iP2d8lRwjQs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1350.namprd11.prod.outlook.com (2603:10b6:903:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Sat, 18 Jun
 2022 12:35:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.018; Sat, 18 Jun 2022
 12:35:33 +0000
From: <Conor.Dooley@microchip.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
 <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1VGa+A
Date: Sat, 18 Jun 2022 12:35:33 +0000
Message-ID: <a71a2bea-b906-625a-573b-a59adb4cbdfb@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
In-Reply-To: <20220618123035.563070-8-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12d4d30f-d130-4428-80ef-08da512709ce
x-ms-traffictypediagnostic: CY4PR11MB1350:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1350E785140E265BF80A01BD98AE9@CY4PR11MB1350.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2CLEC5IVGgcv5x8Crsrsj66OKNDSG7EwlgFKEDFYW7d+E3YSAQYq+nQiTRXpg+ch6spyA3FCZKVf/MOChaL+ZuFcjbQkeoUYZAtp0FPWXJpPiljlYgcpWA3h+zUmf1Su4jpHaT+iecKWj2aYOcwUPwefaM0udM8fgCCiGvQjiXm3S30mlBz4dPyysd+GMeD+DHOctMvZ+E7x7J8WPhF+8ZQhJxQudkdGxRuhN6WGxiBpImzwJ+3LR7wi2k9bhPFMnzSjkD88mN6MwYCMXAkFIxHxZbVkIbcmi+BInCqhqR8txK6baj77RHSlshXjacGtQmrPlKHvTzlV87IBYDUOBXV3M3j86TPiROBUr2DFKpaDBOCKqDZ7zlrhyfb103k+CsYDmXC6NwWlhL5N2p+2yo/Yb+l8cL2D3fOzbhGj5epeSydzLMfqntMByFSU+Xk7ZijEzUXhMfhWJjBYHj2fZYgJVLtb+pMYVqBheFjY06jv1yc8/evVrXcqdg3BOifVqoWgXbWU1zuWi+m8MeclW80mVFc7JXFjj8emVMeS2F9WnTSLzMU5O/jT33ug2XL7u4gK9cLKXPnejHusR63PaKZdLkACWQD+jTYL/q0tkKchbYESBXgWf66WTcjLj9qSiwSr6mg5N1hhrdKlHrMpYnYkBsN6L4JQ7d5/uDvnVqBO68Cf3NAFjM46WznncWcWCM2tYfxktKB5z8J33ze78c+dgXScvAzXpw+1Fn+yiKzQCufnbGX940K38LWQJL/Ij6wUFG/GvHnvips/xVukiqeL92jqjUQvanhAKBYkAkc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(110136005)(2906002)(31686004)(71200400001)(54906003)(36756003)(2616005)(6512007)(5660300002)(7416002)(6486002)(7406005)(186003)(66556008)(66946007)(86362001)(64756008)(4326008)(76116006)(8936002)(66476007)(316002)(38100700002)(53546011)(122000001)(6506007)(498600001)(66446008)(83380400001)(38070700005)(8676002)(26005)(31696002)(91956017)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTd3NVVZelJGU3NlVGZqYUVyU0VIUlZYNUhUb3ZnajdiR1VpYVB1eXhyZm5h?=
 =?utf-8?B?czFtemw4aWhVL1RTdnQ3TmZIa3VYbzZ1NGlzSnN1V2ROQzBGYWk0YjBEUTV6?=
 =?utf-8?B?Y2V5L090VXFPNTM0YnZxTURkQm0yR2pWcFIvM1BNOEZiaDk1Q1VTZU9JY2Er?=
 =?utf-8?B?dEU4Tnk2WkdqdTdsK3ZEYlpvY1B3RHFiSzFDbDhoOWtpeDU0VXoxRE9TQzY5?=
 =?utf-8?B?a2FSWGpCSUhNNWVnK0VLeHgzNXVEU1FzMnhUK3dSaXpYU2htQVY4ZmphWXR0?=
 =?utf-8?B?UDFkc1lVZDFoNW1FVGtGT2NvWktLeThpaXFFd3J5T1dObGxZd010RVFScVRq?=
 =?utf-8?B?SVJOWDBhNnZrdjJJYzA5RGtMZ3Jwc0ZacjVKRkpyMVZuRG5pNUdsY2Z3MlA3?=
 =?utf-8?B?Mk92TDF4am5qTkZtVndBQlc4RDFXZDZyZDFRa0RTSmNaNGJCQ0RQUTBGcFh5?=
 =?utf-8?B?aElFcUFJc0xrMXpxTlFucHFBK3VoYWNSUXF6dWNQa1Bnd24vc2E5YjR5VzFO?=
 =?utf-8?B?MCszWVVETUtibGI3QzNURUpNbTk2WHV1RUhyRXd2SmRUd0t4MGR4eVdhcEl4?=
 =?utf-8?B?bFpGNDZ2MjZuL2swY2xjSElsNFVZaUtFZlZVTUJPYy9qOFUrc1NIYXdMaVQ0?=
 =?utf-8?B?TTJnNU8xS3Mrc2o5WklZYlJndkhxS2VXdC9yQ0duN3lkSUUvUGJwZFZ4VHlt?=
 =?utf-8?B?UElGQ01UeWVVMU9SQ1FobENueFozbG4rc3llME14MkxPS3ZrY3BlSUpBQ3I1?=
 =?utf-8?B?YmtCb3FRcVFJc0Vmc3FCL0Y5am5QdThBKzdGdjM5cjVpK21lUHVqaStPRU9S?=
 =?utf-8?B?R2pRU3NQYkxsTExKZUhGMmVqRkNmclp5TVdCWjBDb3cwdEM1YldkL2RnSUN5?=
 =?utf-8?B?cnpJOTlGU0J4RUNpRXFpRjF0eEtVVXVwejdUMDJwUXJOT3c0N01OUjd6UnNq?=
 =?utf-8?B?TTladE9zM0JpOVRJdDFNOUZvenBaZFdjYll5NUhPQ1dYRWtDRGNMczhHMGxk?=
 =?utf-8?B?SU13eitSaFNIbHYyTVRXTDI3TGhrUzJjSFVaa0IzVi91OUlTQnRVS0FjbmxK?=
 =?utf-8?B?djd4SHdINVdjeWo5alJ6d0lPdUhoZUUyN0J1S0RjY1oyTTJvWlAzWnFpaWVj?=
 =?utf-8?B?cU9kRkt0ZTJZd1U1dXRxK2YrajRXdmlXanVaNjdsazJiekZZTm81RVhoQm50?=
 =?utf-8?B?cVQvYUtRTERqVVQ3blNOMThVWWgzRjlYc3NEdFpBZ25ISitrcFJrWlR1cmJ2?=
 =?utf-8?B?TzdyUEwwSjJzZnVuVytaaEpFM2RTN201cmJPdXoyYmVwQW9sWERkaWJOYXV3?=
 =?utf-8?B?aVZxbTdqa1JKSFBEVFhhTVV2TlFSendOMU5ER3U0My9FU01HUmVsZmlTT3Bj?=
 =?utf-8?B?cjY2a1A3QndMd1NhUHV1cXJxdXhRdEMxaWU2Y2RGZ3VMbHNodnBTTEI5R3BL?=
 =?utf-8?B?bVl1YitqajNPdERnVHN0dEEyT3JjQXdHOVdlTFRNT3ZWT1pIWVk5cUR2UzNv?=
 =?utf-8?B?U1AwOSt1cThPeDZxTzZaSFFIVnA0Sm90U0xjYXJqOThocGtLT1NJQTY1MEwv?=
 =?utf-8?B?bHk2WEwwVGs5NnJUSlBaUzBobUN0ZitEWkZLYWJYQTFWYnU5WmJ6c1lUYm04?=
 =?utf-8?B?dkxsTXZ6M2Z2NnAxWGVraXI5aThvL0NEQ3Fhb0VCYWRlTFVqME15RUlQSkdJ?=
 =?utf-8?B?SGZabFVUSDdBNEhMb3FjS3N1Ri9KVitjdWVzTlRSeWNScUZ0R0xicGlWSXRh?=
 =?utf-8?B?ZnMxUVN0VERpQnRIdjh6UXZsYU53UUNjZnZZSUhTczFUNHdRTkwyaUwwVkpM?=
 =?utf-8?B?ZzlWWGpzaWpjRkdSRFIrTVdKcnRWZEhTSWkxanI2QVo5SWJrRCs0TVFpcVda?=
 =?utf-8?B?eTVQQ0szZ3RvZFBKTXJCNzMvaU9wN2VFazZ5ZFdSNW9PYmp5YTVIOEh6TnhG?=
 =?utf-8?B?UytCWXFoQjFYclo0MFptTGhUNG1CeDlsbXovN1o3dXlrZkw2N0pScWtnRGE2?=
 =?utf-8?B?aktwbHZVWGxsWVlNam5pQ3Rzd3FaTFoza1FzNmcwcjdHV2tBd3VnT0RDanpi?=
 =?utf-8?B?aGFRd1FvaVM3VE1YN0lBM2lJYTRrbXY4VUc3RlFXWXBjeHp4UXdsNitwNjVi?=
 =?utf-8?B?Y01rQ3ZsUUk2OU5LKzJNTDNNbkFKVVZ0RWdtUFp0MU5CTDVoL29XUlI4OTJ6?=
 =?utf-8?B?NlY4UldwRzFta0MxSHNmOGJDaEZHZlVtMXRNRkt1Tk5nbndINjQyVjJPYXlF?=
 =?utf-8?B?emdwVUhMTFZTSkgyYWhFeUhSWllTdG1BS2t2am45citsWVluaStlS29QN0Vx?=
 =?utf-8?B?TXh1bDc2Z2xIcjNhMHpOK01iTXZjb2wzWnpuSk9uOTJ2TlBleE5EaEttL2JX?=
 =?utf-8?Q?7ShmlrBD71jBuK8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82BCB53E30790B43AA198ED5D0364B29@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d4d30f-d130-4428-80ef-08da512709ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2022 12:35:33.5511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYhSvMXk1cErPlefVeB9NDUWdyNrtb01iEeDM31Hbp7JY0hL7u87DTjSTOjP5aqO94CzjA6PtMqpV6hFg4kMCnEE5wITLvmEa17SCBPap50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1350
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
Cc: linux-riscv@lists.infradead.org, niklas.cassel@wdc.com,
 alsa-devel@alsa-project.org, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, linux-kernel@vger.kernel.org,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, Conor.Dooley@microchip.com,
 joabreu@synopsys.com, geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org, tglx@linutronix.de,
 dillon.minfei@gmail.com, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxOC8wNi8yMDIyIDEzOjMwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+IEZyb206IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IA0KPiBUaGUgazIxMCBtZW1v
cnkgbm9kZSBoYXMgYSBjb21wYXRpYmxlIHN0cmluZyB0aGF0IGRvZXMgbm90IG1hdGNoIHdpdGgN
Cj4gYW55IGRyaXZlciBvciBkdC1iaW5kaW5nICYgaGFzIHNldmVyYWwgbm9uIHN0YW5kYXJkIHBy
b3BlcnRpZXMuDQo+IFJlcGxhY2UgdGhlIHJlZyBuYW1lcyB3aXRoIGEgY29tbWVudCBhbmQgZGVs
ZXRlIHRoZSByZXN0Lg0KDQpHYWgsIHNob3VsZCd2ZSBmaXhlZCB0aGF0IGR1cmluZyByZWJhc2Uu
DQpJJ20gc3VyZSB0aGVyZSdsbCBuZWVkIHRvIGJlIChhdCBsZWFzdCkgYSB2MiAmIEknbGwgd2Fp
dCByYXRoZXINCnRoYW4gcmVzZW5kLg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IC0tLQ0K
PiAtLS0NCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaSB8IDYgLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2NhbmFhbi9rMjEwLmR0c2kNCj4gaW5kZXggNDRkMzM4NTE0NzYxLi4yODdlYTZlZWJlNDcgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaQ0KPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kNCj4gQEAgLTY5LDE1ICs2OSw5
IEBAIGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgew0KPiAgDQo+ICAJc3JhbTogbWVt
b3J5QDgwMDAwMDAwIHsNCj4gIAkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4gLQkJY29tcGF0
aWJsZSA9ICJjYW5hYW4sazIxMC1zcmFtIjsNCj4gIAkJcmVnID0gPDB4ODAwMDAwMDAgMHg0MDAw
MDA+LA0KPiAgCQkgICAgICA8MHg4MDQwMDAwMCAweDIwMDAwMD4sDQo+ICAJCSAgICAgIDwweDgw
NjAwMDAwIDB4MjAwMDAwPjsNCj4gLQkJcmVnLW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwgImFp
c3JhbSI7DQo+IC0JCWNsb2NrcyA9IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4gLQkJCSA8
JnN5c2NsayBLMjEwX0NMS19TUkFNMT4sDQo+IC0JCQkgPCZzeXNjbGsgSzIxMF9DTEtfQUk+Ow0K
PiAtCQljbG9jay1uYW1lcyA9ICJzcmFtMCIsICJzcmFtMSIsICJhaXNyYW0iOw0KPiAgCX07DQo+
ICANCj4gIAljbG9ja3Mgew0K
