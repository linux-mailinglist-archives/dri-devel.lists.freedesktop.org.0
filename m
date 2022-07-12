Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8A571FFC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8B412B808;
	Tue, 12 Jul 2022 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD56412B579
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657641268; x=1689177268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
 b=C8AmwjXDL8UO0b7ar41ZImbUzt+BM7HXczUpU3iICCXskGshHqGb1OWu
 bcJB3ttXwuaLBVF3JdSEe/C8UKz0eya+wcioDH6NmU0jUx0ZGWEfSYmdr
 BwXa+aZpWAaiWQ+fRhHrapAiG6D6quj1OuapHkJfMT2P83gmfYvXnC6fo
 XR4vVJzokFj1mnuBJJhJ4laFSrB+IPmmSkYOHrWAyqa2qQWtmNdpEPZDr
 IMyAWaicTmz4LMNQwZCHas1B33ZqKoGctvz2hwZyA1ebrAPFiesdXfQam
 jPklumS2f4sGn0vqAlbUha3FqrHa4NJAEFAz66wvXeeT4Pl6r4bdUZv1Z w==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="164386168"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2022 08:54:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 08:54:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 08:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6odVZyEGMrrlkDSP5jdahDqiULo/hs5ntrx4EkTKLxqaJRxfqrMMSqkU2+ss+k+bNt5Hy/ibSU5BFzKIeQytECImp9iUEf5HZlD9W3iuh7fiVZl0o+lyOpC92BlDWVihYuYmTqix7I2kdJKNoojkrZfeuhxRhBVSxXwhFtOut12uXo4clYAdBPYmZ9D1x7IbEuKE7DD2WA8eaDY0tvcq4lItjPiDGs15yzGxpS9oAt9Dbw/dCm6goIKgTSG4Jr9Hq0vg6RmjZCbuGMG+WHjYcMgiW6O2ku3v2/HfEe21QsPthitgMsmLZTgbmuaOYhuVZRgWGh3QtOkEwnv/x/LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
 b=dkTF1c0W6Dnh6VhSbgzSh9xeu0WwGEmhfgx04X62Z7kVMkpR47iLcYoXOA1LbHo6eykHdU3YU33j8/jJs9pz3M0WqcuidFzgbcLy7D3r27qg6y6p0xeMt1Ms1hjzwZD8raxKER7Me7StgxftBJpeO4fTVC60jQrQ3TLte7aRDXTM9ANSChjUjZbcEeUJ1TGwaJD2pIqdUWeShM7RSzKbwpOOPMG0dpz8xz4ukLZK0je8hINAVz2DSjaSEhu5iW8eC8S2mnv9HZwHLYQrc9ClWtHgZZSsNdgTFLivDKshGMcDaMV2tybup6dktSZnaZ34CpYAWbGAjOyXMp6EpBwMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
 b=YvLsbreR/Y9NB+2NyhHz8/JFICZ5bz92LxL4L/Wp/A+/mA0SFAmCmXc7GjcdN76CeRvx54os4Lde0upuwKWFhMvmxLMUuTWSqDxJzv2XD72F2CUDE4dHgZ2X3CIvVTKz7lad1xSLz5u24Lnk1j2fXo+D/pPoNubyCJ+uI7XKF/g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 15:54:18 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:54:18 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <Conor.Dooley@microchip.com>,
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+AgAA9+YCAAqfOAA==
Date: Tue, 12 Jul 2022 15:54:18 +0000
Message-ID: <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
In-Reply-To: <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a074618-6277-4f3f-706f-08da641ec7a2
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?bkRFd1pPK2JuSXBkQ3NuWERPT2VYS0pWQWZDZ09xSDFzdm45djlnUmtSdWJh?=
 =?utf-8?B?NkJ0dndjZ3Nxb2EyUkpXYjQwNXYxcWV6bXNWOGFaZ216RlJsYXUvNElTTkpa?=
 =?utf-8?B?dmxhdWFvcGN6M3I3aHN2MC93cFUzTjFPaHViY0dWb3RkZ3U2WkY5WElOdktJ?=
 =?utf-8?B?cm9lREJocmFBd09Ra2s0QVZ4dHhIQjl2Ym94WkRMTllTcEtWUk16b051R3Bj?=
 =?utf-8?B?T0Zla0ZSUklGckhtSzMzRFovNnA2NnpkSkxGUU8yeGFBZVJYWEZnSlp6NjN6?=
 =?utf-8?B?blBXclFtbDF3bG9pRkk3TUlBMnFCTURVV2szWTZFbnFPS1FrZjY0TmlscFht?=
 =?utf-8?B?ZXhXUUlPdm5JMUs2Ynlqczl3VFVmVjFjMVJSb2pOQUVCNW5Ha09ZUFRUQnNi?=
 =?utf-8?B?dzlKOGFTL3V6eWJab2lKdjcraEtsUVRTK0tPWVpUZTZJNzZNUG42dWRQVkFa?=
 =?utf-8?B?MXZDaGIveXFuU214cWwrUFVOVk1PQXJ5U05QRnUvVytweEViMkhVT29nbXNE?=
 =?utf-8?B?MWZncElLT05DOERvR0tFcC9yNkZmSVFxVU5iWGFmaU02NGQvZnA0alBsd3hu?=
 =?utf-8?B?RU9zMmkvMFhKRTFHaGRpMEUzdHoxTXN6T1FmVjFHNHNCdDlSQWh6R0FYWlJt?=
 =?utf-8?B?Nlh0UjBJWnJEUlJ6Vkh3cGEzdFBXVnNIMmJyTktWVzBDWmpXa3lQZ3d5bUFh?=
 =?utf-8?B?YmJ6djNtU3N3MXpoSnZOY2FpK3V1c2l2VFFMd3krS0dNOW5WRU5qUVpFSlYy?=
 =?utf-8?B?Vm9HZ0l4TXZSblc1SlFSS2JYbTludVZSWFVKcmZ3anFTRmZkNitZK0dvRm9m?=
 =?utf-8?B?SC92OUIvLysrWU0rZDhIQUdPaTJ5T05uaENMcnMxZGx3U1k0N3Q2c244WEYx?=
 =?utf-8?B?K3lsREI5dHFDUzEvVUpJd2p4NVBpWHd6V1Q0TytNYVNTQVNVb3hhaWtDWmtw?=
 =?utf-8?B?QWYrWTdyVjc4Zm9objNCRGNWZEl6SUlmalZKdTgrLzhNRStKdDMwNHQzaGdx?=
 =?utf-8?B?TzRSN0FtbEVEbEFweTRQWWVpYUN4MnByNS9sVlA1K05KQUd1R2pSdENYOTV1?=
 =?utf-8?B?cExPWlpFZE9NSitGc0o3Z3Eya2tPQ3BWWlFjS3BGM1ptRTQ3V0NkOHBXZWlZ?=
 =?utf-8?B?Ui9IL0g4d1FkTkJybDB5b0xDWXAyU3BLRmcvUWtBQ1VaNkxoV1ZkNkY4U1Iv?=
 =?utf-8?B?K1BVN1FZMzFFWHhGOHlxMnZiSUc0c2tkQzVMaVIyOGFQREZMRU5mSHc3NHp0?=
 =?utf-8?B?OCszbDlVTkZxNHZSckM2MFBkcHZRcGE5Um10NDBuV3F5M0gvUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(136003)(376002)(346002)(38100700002)(8936002)(83380400001)(2616005)(66446008)(122000001)(31686004)(7416002)(5660300002)(38070700005)(186003)(478600001)(64756008)(66556008)(41300700001)(6512007)(66476007)(110136005)(6506007)(966005)(26005)(54906003)(53546011)(91956017)(86362001)(66946007)(316002)(6486002)(31696002)(8676002)(2906002)(71200400001)(76116006)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFl2K1QwbDF4a3kxSi9laDgvbmJhdmVNU0J2QW1vOGFvaFFnUjd0eXlDcDZM?=
 =?utf-8?B?M0ZVbEdoZzc5K3BYTWZpbmZpMjBZbnhBUk5aV1VPZ2VVaGZZa3lsM291dUZV?=
 =?utf-8?B?blF5T3hST3dtQzlVYitoU3E2UE1ZaTdoNVpxTCs0bTJ6VTJTOHZFNWNnbWFG?=
 =?utf-8?B?RW53U3dCa05jWnZhSVpYbnA2N0FOU1pxN1ZCaEZtS1RpcFhyV1IrWkM0TEVh?=
 =?utf-8?B?VnNHa0FsM2hJWHcvaFR0V2VWZm9mOTB5RGFnak56andGMGdNTExEVkJhcDhC?=
 =?utf-8?B?NUllamNJSDNkV0drM3RHZU9DaHhtUmZTd2RZTGcxL0FvT0ZFUmIyZ1FwaCt6?=
 =?utf-8?B?QUdDdFg5UzlLQnNmd1FLSEkwUDJ1R0k2THdwNkQyMkR4SUJwQS9ETWFvbzdv?=
 =?utf-8?B?V2tyZFBndEtsWGVpK0JTTnNFUEtQTGN0MnYzVXRoRnE1ZTR2YTFSMVN3NGlp?=
 =?utf-8?B?YndTMkFnbmZmYVR3dmxjb3pJakpHbHZSK3VhYlNQWHVOVVdkZ2FnM0YyVWpw?=
 =?utf-8?B?enVOaDdqS0d2ZEVpYzVMM1E0RGx1TS92Z085WmxWQmYyaVVJN1hjVS9rdFh4?=
 =?utf-8?B?Y21pZUZtcXBBaXphYWkrSUk1dFdtMm02RktsSkRJTVVydzNxdFZ3U1Y3clFt?=
 =?utf-8?B?T2pvcGNHeDdPS2poOG9RZGphK29UQ3dVY3dXVHZMKy96SnRjTDN0RlpLbk5m?=
 =?utf-8?B?ckdnZEhNdVFVcEtQdG5EQ2xvcGNDR2xQbDlacWpseTNvNnhqZXdnanZpY2s2?=
 =?utf-8?B?Q0pIVndRYVg2eGdZWWhGNjNtMVkwWTllNW9VNFkyNmVrcFhEQzFuajZxS2Nw?=
 =?utf-8?B?cGM4UlkxZXBHT2RLaHVBcWVQYnVrbVdycmtiYTgrSUtNRUQ4eTBVaGVBNHBI?=
 =?utf-8?B?dlRKbkJQUXBkT2xNdVN6aVFBTDJ0S29qVUhLRzVJcFFVZWZKZCtXVUxYTFFZ?=
 =?utf-8?B?UEhQc1lKeTBPWU92dHRRWXBkbWlhNzFNZmQwYkxpWmU2eXNQRmFsaE1BRFRZ?=
 =?utf-8?B?NGxBODNuNVZuTmwxSEJIS1BEd01ZbmMrSEoxOFozd3FnNmtWdVNsNlQ0YUtZ?=
 =?utf-8?B?NHVuTXlPbldENy83cHI3cE1IcmUvUnVCWkZnWmk1bVVZMm55UTVEdHVDNTNJ?=
 =?utf-8?B?V0xaQmRDYjcxd0xnMFAvM0I5SEgrS2ZsR1Q3MkFCZmVjRTRRZjVDVXZjVEVE?=
 =?utf-8?B?cUttYVpYb3dPcmV3ekpPLzE0Slc1TkJmVUZMT21UU2NlU0poWk93Y1RKaWNh?=
 =?utf-8?B?c3RNYkUxSEkrZjRnYmFCSUw1QTFFcU9RcWhUTUo3UkNncmx2WE1qNkNWNm5h?=
 =?utf-8?B?bmtGR1RlSSs1T3ZPNVovaC9GdXBLZS8wSDlwQ3hnTjFiR2hIeXMxZzRzdDVR?=
 =?utf-8?B?MVJ3UDViTnEvN3Noc0g1SktQWCtyUzRwclJXUjh4WDlPd2xtZkcvckdwMmJY?=
 =?utf-8?B?RGJERzJ2bzkwVVJYR044TzNVRDZwMVpHL0tia2ZZYTF2QUZsaGdsaTVvcWxn?=
 =?utf-8?B?Rkt0Y3ZaNkt2K2JYeHFpU0U0QWtGVCtHaENGUHVMZXg0ZVFPZTVsdUMvV3Z3?=
 =?utf-8?B?NWRsM1dUdEczKzl2dlVweVdlZDRhbk1hWEJlTkl4Ym1MUE1GMGt0ZXB6MTVK?=
 =?utf-8?B?a0Voc0o1NzcvZ0VtdzNiMzZlaW83SGxENHBZTWRGL1VJbmxaZDlCQlhWZG1J?=
 =?utf-8?B?WDhMczdUMnNrWE9LZVBTNkYyYk9VYmlBVnI4TzBaT1l3N1pFZWFBMHZWMDAw?=
 =?utf-8?B?S3hqM2t5VGtlN1dWOERGWEtaQldRVHUyNDQ4TU5MQzBhN1V5KytBc2VDaHd0?=
 =?utf-8?B?WnRUYzJMVzFhT0Y4TEF0bWJ3UHJDRzZWR0hXazhua2pYczA5S0hucVM4Qk1i?=
 =?utf-8?B?QzljUGtGdXRFMUpDRERPN0FDZkhzYkNrZWc5S1l0S2o1dnhRZXFva0JNV01E?=
 =?utf-8?B?WlJncitVR1JtdlRnUGhrN0hqSjY4WDJzWHRpeU5vV0txaEtBNzQvYUZQQW9D?=
 =?utf-8?B?SlJxQlZBQU9NMTVTTjRKWlZ5YXNPaUxzbnRtZ1dSOUhUVllOZEtEeDlnaE82?=
 =?utf-8?B?eFlLSnluYkppdC9PZ05OZTBYeTJpQXE4Q1A4S244dTlPMk9NMHczd2NOaWkx?=
 =?utf-8?B?T3o3ek9abWpEdlErdDVuZmpBc3JaSjNQVmtYaEkwVHUrUVRIMU1Wa0VvUWwx?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0182169B8398CC4F92E8405D8B660742@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a074618-6277-4f3f-706f-08da641ec7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 15:54:18.7298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErUC4Y6SVxdPR+vdGK/OLujyQCvqJsr0nynDl4AOQfmylnJxJupF4e9eH/jXKK5uto9gWqOOfXhTt/B4bUpwpbJdxyKLUKiLdQbHJUyXDIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, palmer@rivosinc.com,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org, sam@ravnborg.org,
 masahiroy@kernel.org, daniel.lezcano@linaro.org, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMDcvMjAyMiAwMDoyMSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IE9uIDcvMTEvMjIg
MDQ6MzksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gRGFtaWVuLCBLcnp5
c3p0b2YsDQo+Pg0KPj4gSSBrbm93IHRoaXMgcGFydGljdWxhciB2ZXJzaW9uIGhhcyBub3QgYmVl
biBwb3N0ZWQgZm9yIGFsbCB0aGF0DQo+PiBsb25nLCBidXQgdGhpcyBiaW5kaW5nIGlzIChmdW5j
dGlvbmFsbHkpIHVuY2hhbmdlZCBmb3IgYSBmZXcNCj4+IHZlcnNpb25zIG5vdy4gQXJlIHlvdSBo
YXBweSB3aXRoIHRoaXMgYXBwcm9hY2ggRGFtaWVuPw0KPj4gVS1Cb290IG9ubHkgY2FyZXMgYWJv
dXQgdGhlIGNvbXBhdGlibGUgJiB0aGUgY2xvY2tzIHByb3BlcnR5LA0KPj4gbm90IHRoZSByZWdz
IGV0Yy4NCj4+DQo+PiBJIChsYXppbHkpIHRlc3RlZCBpdCBpbiBVLUJvb3Qgd2l0aCB0aGUgZm9s
bG93aW5nIGRpZmY6DQo+IA0KPiBJZiBib3RoIHRoZSBrZXJuZWwgYW5kIHUtYm9vdCBzdGlsbCB3
b3JrIGFzIGV4cGVjdGVkIHdpdGggdGhpcyBjaGFuZ2UsIEkNCj4gYW0gT0sgd2l0aCBpdC4NCg0K
SXQncyBhbGwgeW91cnMgc28gS3J6eXN6dG9mIDopDQoNClRoYW5rcywNCkNvbm9yLg0KDQo+IA0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2R0cy9rMjEwLmR0c2kgYi9hcmNoL3Jpc2N2
L2R0cy9rMjEwLmR0c2kNCj4+IGluZGV4IDNjYzgzNzkxMzMuLjMxNGRiODgzNDAgMTAwNjQ0DQo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2R0cy9rMjEwLmR0c2kNCj4+ICsrKyBiL2FyY2gvcmlzY3YvZHRz
L2syMTAuZHRzaQ0KPj4gQEAgLTgyLDExICs4MiwxNCBAQA0KPj4gIA0KPj4gICAgICAgICBzcmFt
OiBtZW1vcnlAODAwMDAwMDAgew0KPj4gICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1l
bW9yeSI7DQo+PiArICAgICAgICAgICAgICAgcmVnID0gPDB4ODAwMDAwMDAgMHg0MDAwMDA+LCAv
KiBzcmFtMCA0IE1pQiAqLw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIDwweDgwNDAwMDAwIDB4
MjAwMDAwPiwgLyogc3JhbTEgMiBNaUIgKi8NCj4+ICsgICAgICAgICAgICAgICAgICAgICA8MHg4
MDYwMDAwMCAweDIwMDAwMD47IC8qIGFpc3JhbSAyIE1pQiAqLw0KPj4gKyAgICAgICAgICAgICAg
IHUtYm9vdCxkbS1wcmUtcmVsb2M7DQo+PiArICAgICAgIH07DQo+PiArDQo+PiArICAgICAgIHNy
YW1fY29udHJvbGxlcjogbWVtb3J5LWNvbnRyb2xsZXIgew0KPj4gICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiY2FuYWFuLGsyMTAtc3JhbSI7DQo+PiAtICAgICAgICAgICAgICAgcmVnID0g
PDB4ODAwMDAwMDAgMHg0MDAwMDA+LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgIDwweDgwNDAw
MDAwIDB4MjAwMDAwPiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICA8MHg4MDYwMDAwMCAweDIw
MDAwMD47DQo+PiAtICAgICAgICAgICAgICAgcmVnLW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwg
ImFpc3JhbSI7DQo+PiAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzeXNjbGsgSzIxMF9DTEtf
U1JBTTA+LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIDwmc3lzY2xrIEsyMTBfQ0xLX1NS
QU0xPiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICA8JnN5c2NsayBLMjEwX0NMS19BST47
DQo+Pg0KPj4gSWYgc28sIGNvdWxkIHlvdSBxdWV1ZSB0aGlzIGZvciA1LjIwIHBsZWFzZSBLcnp5
c3p0b2YsIHVubGVzcw0KPj4geW91J3ZlIGdvdCBjb25jZXJucyBhYm91dCBpdD8NCj4+DQo+PiBU
aGFua3MsDQo+PiBDb25vci4NCj4+DQo+PiBPbiAwNS8wNy8yMDIyIDIyOjUyLCBDb25vciBEb29s
ZXkgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+
PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4+DQo+
Pj4gVGhlIGsyMTAgVS1Cb290IHBvcnQgaGFzIGJlZW4gdXNpbmcgdGhlIGNsb2NrcyBkZWZpbmVk
IGluIHRoZQ0KPj4+IGRldmljZXRyZWUgdG8gYnJpbmcgdXAgdGhlIGJvYXJkJ3MgU1JBTSwgYnV0
IHRoaXMgdmlvbGF0ZXMgdGhlDQo+Pj4gZHQtc2NoZW1hLiBBcyBzdWNoLCBtb3ZlIHRoZSBjbG9j
a3MgdG8gYSBkZWRpY2F0ZWQgbm9kZSB3aXRoDQo+Pj4gdGhlIHNhbWUgY29tcGF0aWJsZSBzdHJp
bmcgJiBkb2N1bWVudCBpdC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pj4gLS0tDQo+Pj4gIC4uLi9tZW1vcnktY29u
dHJvbGxlcnMvY2FuYWFuLGsyMTAtc3JhbS55YW1sICB8IDUyICsrKysrKysrKysrKysrKysrKysN
Cj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4+PiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMvY2FuYWFuLGsyMTAtc3JhbS55YW1sDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9jYW5hYW4sazIxMC1z
cmFtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mODFmYjg2NmUzMTkNCj4+PiAtLS0gL2Rldi9udWxsDQo+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9jYW5hYW4sazIxMC1zcmFtLnlhbWwNCj4+PiBAQCAtMCwwICsxLDUyIEBADQo+Pj4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0K
Pj4+ICslWUFNTCAxLjINCj4+PiArLS0tDQo+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbWVtb3J5LWNvbnRyb2xsZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbCMNCj4+PiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+
Pj4gKw0KPj4+ICt0aXRsZTogQ2FuYWFuIEsyMTAgU1JBTSBtZW1vcnkgY29udHJvbGxlcg0KPj4+
ICsNCj4+PiArZGVzY3JpcHRpb246DQo+Pj4gKyAgVGhlIENhbmFhbiBLMjEwIFNSQU0gbWVtb3J5
IGNvbnRyb2xsZXIgaXMgcmVzcG9uc2libGUgZm9yIHRoZSBzeXN0ZW0ncyA4IE1pQg0KPj4+ICsg
IG9mIFNSQU0uIFRoZSBjb250cm9sbGVyIGlzIGluaXRpYWxpc2VkIGJ5IHRoZSBib290bG9hZGVy
LCB3aGljaCBjb25maWd1cmVzDQo+Pj4gKyAgaXRzIGNsb2NrcywgYmVmb3JlIE9TIGJyaW5ndXAu
DQo+Pj4gKw0KPj4+ICttYWludGFpbmVyczoNCj4+PiArICAtIENvbm9yIERvb2xleSA8Y29ub3JA
a2VybmVsLm9yZz4NCj4+PiArDQo+Pj4gK3Byb3BlcnRpZXM6DQo+Pj4gKyAgY29tcGF0aWJsZToN
Cj4+PiArICAgIGVudW06DQo+Pj4gKyAgICAgIC0gY2FuYWFuLGsyMTAtc3JhbQ0KPj4+ICsNCj4+
PiArICBjbG9ja3M6DQo+Pj4gKyAgICBtaW5JdGVtczogMQ0KPj4+ICsgICAgaXRlbXM6DQo+Pj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IHNyYW0wIGNsb2NrDQo+Pj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IHNyYW0xIGNsb2NrDQo+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFpc3JhbSBjbG9jaw0K
Pj4+ICsNCj4+PiArICBjbG9jay1uYW1lczoNCj4+PiArICAgIG1pbkl0ZW1zOiAxDQo+Pj4gKyAg
ICBpdGVtczoNCj4+PiArICAgICAgLSBjb25zdDogc3JhbTANCj4+PiArICAgICAgLSBjb25zdDog
c3JhbTENCj4+PiArICAgICAgLSBjb25zdDogYWlzcmFtDQo+Pj4gKw0KPj4+ICtyZXF1aXJlZDoN
Cj4+PiArICAtIGNvbXBhdGlibGUNCj4+PiArICAtIGNsb2Nrcw0KPj4+ICsgIC0gY2xvY2stbmFt
ZXMNCj4+PiArDQo+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4+ICsNCj4+PiAr
ZXhhbXBsZXM6DQo+Pj4gKyAgLSB8DQo+Pj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svazIxMC1jbGsuaD4NCj4+PiArICAgIG1lbW9yeS1jb250cm9sbGVyIHsNCj4+PiArICAgICAg
ICBjb21wYXRpYmxlID0gImNhbmFhbixrMjEwLXNyYW0iOw0KPj4+ICsgICAgICAgIGNsb2NrcyA9
IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4+PiArICAgICAgICAgICAgICAgICA8JnN5c2Ns
ayBLMjEwX0NMS19TUkFNMT4sDQo+Pj4gKyAgICAgICAgICAgICAgICAgPCZzeXNjbGsgSzIxMF9D
TEtfQUk+Ow0KPj4+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwgImFp
c3JhbSI7DQo+Pj4gKyAgICB9Ow0KPj4+IC0tDQo+Pj4gMi4zNy4wDQo+Pj4NCj4+DQo+IA0KPiAN
Cg==
