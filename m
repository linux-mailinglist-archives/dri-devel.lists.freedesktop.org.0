Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84E552F1F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778510FFFA;
	Tue, 21 Jun 2022 09:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C01310FFFA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655804993; x=1687340993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
 b=ZJpEkcS3+OfNBaP7cAPuVacfpsCfXeGON4jmh/SgN76SGsSa6vRFFSsR
 QcOFOde0P+V18gA9HMkzFRQsc60hhrOSLPd+PTquDS12lkLta0lTR37VY
 JVd4yx+k3YY0fMWl+oFQDVOMsWKRx2cR8l+zu05N1axRy0Q4OVTakT2l+
 8HyOl3C4+I9O5Xha/FhKJyXggFIIQ1PXs2e9nKegVWekEszQy5sRkT3as
 VTeU/A0sBSQauNAMFEXjTTXGeabI9VSdfZChKieQj3aKgH0+KbA1nHZgL
 SxVJDE6Qfnu/edaQOZDrvlwFQ7jF6YDdQwrJXmFV7g9ry1AnalqWOVRWO g==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="169260295"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jun 2022 02:49:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 02:49:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Jun 2022 02:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+mhLOCMyH0q3eiXe7lt/vfSYhHn0a6tZdG9tQQi7BZY74snnpTm2TEFA9HW6KwmdSDcTO71O9CxNuQjv9PH9W/kK8OpZ0w3HUdV7P5fQ705vmT4z00ssKbsiIoJTZY8Z2ZeqCG6/KELwd0H0TQT25qJw5hV2gx/9dqpGzX+RmpdIZ+znudVaNQoFS+9ZaEX68uJ+XnIguxdl74+fyMjg3JlKPR0hI9iv0q1lSaSwnj5DgqjCZQWdK3jIb7c6XWEh0vw3GBLBS2oIoUl1wmJfhtto9RDkpREPphGDdIr1DISiWYBrUb3v1eZCa9iDfFrUncHxOYGma1KRixe8junCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
 b=UWODXtY5qjJ/Nt40NPikt/yNK8u7LOa5todzZ0WliLDz2wNuR3LGU7OKuADMoM5UZELknxL8otGvc2ziulvoVLnioYWxq63keHxioTEEDZUcI4mtZzVT2hnodO5KIFUCokd+fSRAj9CkiP/l5oJKrEqu5A0jdULAo+mmRePcRdeZM3BOcEP2gui0n051itQy2RB2MIzKpuDB/N7/x9JqpxeeBvZHNyop6pKna+aHc3JE2iriRWNDi2fNOT6xW3xOIR/ZcPQuhZS9tSZk+t20RW0iMJsPqfHagmg4wsrTPOY2038zogYuPn/3tc7WgKu2YT5JANNoOC9WwsMKhtguOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
 b=cM/yCs6g1ahmWjyqX1/rR9c0YMHqKYKxmVmR/8Jw1mBgGJI45eCIjriJNEq4aSzXDaRg64gzeCU5RIOxMDF6aq8BZsXQcRpIR4moDafW4AuoyJyJbM00pTkXZLouxPHMlEWX1MNAek/LUcW8XsbI972JeWt9Rz4YouwFm65fLKU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB0044.namprd11.prod.outlook.com (2603:10b6:4:64::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Tue, 21 Jun
 2022 09:49:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 09:49:40 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32A
Date: Tue, 21 Jun 2022 09:49:40 +0000
Message-ID: <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
In-Reply-To: <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b131e88f-9245-43ac-b541-08da536b5c87
x-ms-traffictypediagnostic: DM5PR11MB0044:EE_
x-microsoft-antispam-prvs: <DM5PR11MB00448ABD1E6B357ACC2EFFAC98B39@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mLg8IczmC7qZm9u6rZ3reECn6Xxb8PUB5xPFgmyiUL542ZreA708ESiHbBVYul08B4WxpYbFeJpKO3ZJJRVaWUT4H93YX/z8N7Yh6BkKSy1PzcSqItXUafcgVi9BHTfklk7BUiIx9bW46Hx6LiAOM9ybg8AZblhVnnyBqacVDTXLCPWpCpfJgE6ZfKd6zFG7QpwBsj1fTpsBOXfMSum6K+BeAveQg5H36Ozsl9y/M7c2nB9jTyDCLxJ48q0w4ZhEtcBikxWPBATDFIEUuRKZYLW3ryTDt8nVVRzUJsIK2NqmbqQHxv+oA0IJ8Y5ZBeJd2s7uZHtEXcaZ22U62+8/crbKHnm6FoE0IKWGw0AflDzIvKHNAyLM+65nRE2UnZMOiiv0erETmdeTd62WKqhuDjMn0meGT1Me2wcjjaU6hxNQdZY9sxGuS/5MBHY1BceLupsTjB2itxBtsRDjDbkH4PzqvmbCBPY63sS0Whv3ZMsvaJ8SyxbQVuxnnbT+WO9H3k2s+FbQtl0byZo5x7DCPdkYi+DGBGmoHkWv2m5qP0zvVTfWvDEV9ipwDBA7u7s1q/j7gTybF8ey9KjqUgyxDASy7unbYrCo1inYXdFNEFmbaqeCpcRvjM8eNf3/bQ03idX6smWyocev/Cc/spYhSNcHpIj6p7WO7XcwBBuqF+AAGDEhNvWfR9oK41tROAhbrewP7lHoRyRzlcSQnge5sinlRGYYLcKtVhRHd8iIrz0mYdmf/GTh7tog1GVxrr9Rk62zpuxIosgez6zH62f7TQGdyBAtNrMxN/0FJ9ohEfxXDq6im6hPJOlKNbp7DBi4O6mVP2iKT26AGNmsM7JECmLqS5scna+VN1HLJ9cmvOw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(396003)(39860400002)(376002)(38070700005)(2616005)(186003)(83380400001)(122000001)(7406005)(8936002)(2906002)(4326008)(5660300002)(31686004)(36756003)(7416002)(53546011)(6506007)(91956017)(110136005)(316002)(71200400001)(8676002)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6512007)(26005)(41300700001)(966005)(38100700002)(6486002)(31696002)(54906003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amJJeGNYUTFNOXZHY1EvTlpnY2M3VGpZb0lpZzVYRC96MUZUYytWaGxPV3Bs?=
 =?utf-8?B?V0w1alBFMTdDOFc5amdqRzRqM3dkK1kxdkRrQjdrdnJSVzZXUzQ3aWpPeEtN?=
 =?utf-8?B?bnZHVkF0enVLcVBHTTUzL3N4bGtLZFU0Z3ZmakNRTWp0VmhzazZWcnAvQVI2?=
 =?utf-8?B?blAyN2E0ZDFYa1VQR29kc2NtWkRwcDVVV0V0aldhVWMrRE9HcFpaKy9IWS9J?=
 =?utf-8?B?cGZSLys3VGF0QWJZaXI5amFUKzZKS3FuemNUMGhMdmNlQ0ZqRmsyRVo2MUwz?=
 =?utf-8?B?a1hQYk1zSUJiWHd3dHRKdGY0NFZ5TSs3UDdMN21ia1VFbGtkRjAxdGNYMDMy?=
 =?utf-8?B?WndwVElTbW85QlFIRmNJYTBmcDR5ZFUrN1puZUdzWE5ZR0ZjRDcxakVpZHBI?=
 =?utf-8?B?OUhzdVYzT2pUckVxWXZadmx4bjJ1UlczcGxoYWhzYTRHTUovckFON0k5Q3k1?=
 =?utf-8?B?dFF2WHhnd3FKMEdjb1M1TU91QVFDZnlhMDJtODNxWGo3MzY5Mkd6M1htUmha?=
 =?utf-8?B?WXRLSG9oYnoyNlNxaEQ1d3NzN0pLektyZHdhVVNXa0duQzFXanVGMzA5MWtK?=
 =?utf-8?B?bXdZV2MwMnFxL0JQR3NkVC9ORGIvT2lzNFM2UFJYRXFIeEo2d2NUR2Q0bi9E?=
 =?utf-8?B?Zzd6RFFkUUVzeFFKbUlnNWdwZDNQN0E4N3VuekIzem5heXNGeERTZkR0OUR1?=
 =?utf-8?B?NUtCbHo3NzJ0RldLQ1VpRE9EUXVaMFZHYzMzWWJNakRWaUFwUXZ1OFVpZUtH?=
 =?utf-8?B?MllPZ0FRZ0dzam1yRklPck02bm01MkM1YlRUK0J4YWxOWXRLY1VSb3NUenVo?=
 =?utf-8?B?Rlp3TU9WVXFHTVNGWjdRZjZHNHYzbUEzT3VrVTBNWUZJcEhZNjYyRkw1N3g5?=
 =?utf-8?B?QmgrQ2xHMnFZa3hjTVAxcW8wYU9EQlNIRGF3YW5keTRrN1E0eWVnUXphL1dM?=
 =?utf-8?B?UXdEcnB3Wnp5VEkzdlRXbG5JbngxSkZWcUJzTVJENGVqTWd2bUFrWXAxZTlF?=
 =?utf-8?B?RHlvR1EreDNsQ0ZZNitMKzNtQ3ZXNWVIWnExWFMrQWJBdkZ2THVIYmthSFBV?=
 =?utf-8?B?UjJRVGlUS1RtMEZOT21QS2pzZUU2Wi9PQ3V3VDlvbTlYbkFiRFRCVXAyWE9a?=
 =?utf-8?B?VWozcEZVcEhTSmtiTmpBZU5wc2lwSHhTSFBWbHNKLzlsN1JUT2JvQXd6cnJI?=
 =?utf-8?B?c3J5djNNN3pPbE1yZnUwRjRkTWlJV1dHajdDKyt2VzVkQ1BQbUNtM0g4aDZZ?=
 =?utf-8?B?NlltTnBaVUpvQ2M4Y0NKVlFzekJQYU1IUlNrQlJ3VDlqVkZmdVZXVTFYOFJz?=
 =?utf-8?B?QkYvL2dvdERSVnk2aldFVFNVSjVOTzFodWh2eitpcFV4YWZ0dEd3QkVORGxF?=
 =?utf-8?B?YWtXaFBpdVdScno2aG1lNExqT0lZSkJSTElYV3ZEQ2daRElVak43UzdZUjdv?=
 =?utf-8?B?TVlaTzA0WmpPOEI2bkg0NDUvQ0VRaUtYZTFLYjdUdllCS0hBWnM5UThIV2V4?=
 =?utf-8?B?bUxwWW9STlhBdUJCeHV3WkwzQnlQRnZuSXJQa0pvV0pLMUpDdEMxanNjWWUz?=
 =?utf-8?B?eUp6UFV5cVNRS3Z0eFlZNEh0VTBqdHRaU1JodFc4a243ZWNOWFNrMGY4Q3o1?=
 =?utf-8?B?elFLRHBsSFdJU2x4YVBhbUxPbW1NdWMrQ2lQRExYbXorUFZ0VXlEcG9BNytU?=
 =?utf-8?B?cGxxTjFjc3JWL0w4dFovZ1ovaENnVXB6dFoxelJXdG5ibm1BUmZxVTdHYVhC?=
 =?utf-8?B?cHI1THpTSnhseTQzZ0g0UlM1WU1FWGUvODhLcldYMFFQM2gwQmVRSUM3RTBQ?=
 =?utf-8?B?OW82ZUFLbkZrWmNvWEpTQzdneUZPTHhQc1hrcXNWQTU1QW5XZkpxZjNYbmQv?=
 =?utf-8?B?dWYyVXMzUmlCOUN4ZDcrNHdlaWtZRHdqOWoyQ0dNY1cvS0NoY1psTGJzWWZR?=
 =?utf-8?B?cUJlK2kxN0NKMHBlYldwc01BR3kwNnNKbjNqaURqQmtUWmVlbkJQUGluMVZ1?=
 =?utf-8?B?eWJaYURxeE12OU5va1pqU3RSdG9zYWE0bVBLbjkzSlcxZThBdnpwMmp3eThl?=
 =?utf-8?B?cUtaMXk2RHVHQnBwc0FHSmQ0SHpkNnBhNndyc3pRZnZGWE1KTUpWM0JicXR0?=
 =?utf-8?B?YkpSUFN5UjZzT3Y3Zk53MFJKZi96M0pxSHE4Yll6MFFYSWFYeVJlTWt4ZEZT?=
 =?utf-8?B?cnRHWTRwWW9uSHI4ZWRpdnlZcmwzQ3l1Qy9Ba2xSWk9NTWhVV0R4T2ZaV053?=
 =?utf-8?B?K3Nja2FBekJzbXlkaDlwWStSVEdYWXlFRnJRSkhlSjhpTzFSandsNGxkSTl2?=
 =?utf-8?B?VnpQb0V6ZWh3b2dkWjlwUGVnelU1cTZ0OUF2aFFqN3BpSG9QTXhndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <245476FDFB81AB4E966157C506C86088@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b131e88f-9245-43ac-b541-08da536b5c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 09:49:40.5037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t97DO1wte3DbGIM2nmkW4MtcJ45txWuca8s5dJJdWSSD36VaFY5bf2HJHkxI3RKuBhHiF+X7GJjIlxQXjnWwk8sXODVBD2DaK4rOmdhXlGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, jee.heng.sia@intel.com,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, joabreu@synopsys.com, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, mail@conchuod.ie, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, palmer@dabbelt.com,
 dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDYvMjAyMiAwMToyNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gNi8yMC8yMiAwODo1NCwgQ29ub3IuRG9v
bGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyMC8wNi8yMDIyIDAwOjM4LCBEYW1pZW4g
TGUgTW9hbCB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+
Pg0KPj4+IE9uIDYvMTgvMjIgMjE6MzAsIENvbm9yIERvb2xleSB3cm90ZToNCj4+Pj4gRnJvbTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pj4NCj4+Pj4gVGhl
IGsyMTAgbWVtb3J5IG5vZGUgaGFzIGEgY29tcGF0aWJsZSBzdHJpbmcgdGhhdCBkb2VzIG5vdCBt
YXRjaCB3aXRoDQo+Pj4+IGFueSBkcml2ZXIgb3IgZHQtYmluZGluZyAmIGhhcyBzZXZlcmFsIG5v
biBzdGFuZGFyZCBwcm9wZXJ0aWVzLg0KPj4+PiBSZXBsYWNlIHRoZSByZWcgbmFtZXMgd2l0aCBh
IGNvbW1lbnQgYW5kIGRlbGV0ZSB0aGUgcmVzdC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+
IC0tLQ0KPj4+PiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaSB8IDYgLS0t
LS0tDQo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kNCj4+Pj4gaW5kZXggNDRkMzM4NTE0NzYxLi4y
ODdlYTZlZWJlNDcgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFu
L2syMTAuZHRzaQ0KPj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0
c2kNCj4+Pj4gQEAgLTY5LDE1ICs2OSw5IEBAIGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xs
ZXIgew0KPj4+Pg0KPj4+PiAgICAgICAgc3JhbTogbWVtb3J5QDgwMDAwMDAwIHsNCj4+Pj4gICAg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4+Pj4gLSAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImNhbmFhbixrMjEwLXNyYW0iOw0KPj4+PiAgICAgICAgICAgICAgICByZWcg
PSA8MHg4MDAwMDAwMCAweDQwMDAwMD4sDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgIDwweDgw
NDAwMDAwIDB4MjAwMDAwPiwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgPDB4ODA2MDAwMDAg
MHgyMDAwMDA+Ow0KPj4+PiAtICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJzcmFtMCIsICJzcmFt
MSIsICJhaXNyYW0iOw0KPj4+PiAtICAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lzY2xrIEsyMTBf
Q0xLX1NSQU0wPiwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICA8JnN5c2NsayBLMjEwX0NM
S19TUkFNMT4sDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgPCZzeXNjbGsgSzIxMF9DTEtf
QUk+Ow0KPj4+PiAtICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInNyYW0wIiwgInNyYW0xIiwg
ImFpc3JhbSI7DQo+Pj4+ICAgICAgICB9Ow0KPj4+DQo+Pj4gVGhlc2UgYXJlIHVzZWQgYnkgdS1i
b290IHRvIHNldHVwIHRoZSBtZW1vcnkgY2xvY2tzIGFuZCBpbml0aWFsaXplIHRoZQ0KPj4+IGFp
c3JhbS4gU3VyZSB0aGUga2VybmVsIGFjdHVhbGx5IGRvZXMgbm90IHVzZSB0aGlzLCBidXQgdG8g
YmUgaW4gc3luYyB3aXRoDQo+Pj4gdS1ib290IERULCBJIHdvdWxkIHByZWZlciBrZWVwaW5nIHRo
aXMgYXMgaXMuIFJpZ2h0IG5vdywgdS1ib290ICphbmQqIHRoZQ0KPj4+IGtlcm5lbCB3b3JrIGZp
bmUgd2l0aCBib3RoIHUtYm9vdCBpbnRlcm5hbCBEVCBhbmQgdGhlIGtlcm5lbCBEVC4NCj4+DQo+
PiBSaWdodCwgYnV0IHVuZm9ydHVuYXRlbHkgdGhhdCBkZXNpcmUgYWxvbmUgZG9lc24ndCBkbyBh
bnl0aGluZyBhYm91dA0KPj4gdGhlIGR0YnNfY2hlY2sgY29tcGxhaW50cy4NCj4+DQo+PiBJIGd1
ZXNzIHRoZSBhbHRlcm5hdGl2ZSBhcHByb2FjaCBvZiBhY3R1YWxseSBkb2N1bWVudGluZyB0aGUg
Y29tcGF0aWJsZQ0KPj4gd291bGQgYmUgbW9yZSBwYWxhdGFibGU/DQo+IA0KPiBZZXMsIEkgdGhp
bmsgc28uIFRoYXQgd291bGQgYWxsb3cga2VlcGluZyB0aGUgZmllbGRzIHdpdGhvdXQgdGhlIERU
QiBidWlsZA0KPiB3YXJuaW5ncy4NCg0KSG1tIGxvb2tzIGxpa2UgdGhhdCBhcHByb2FjaCBjb250
cmFkaWN0cyB0aGUgZHQtc2NoZW1hOw0KaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3Jn
L2R0LXNjaGVtYS9ibG9iL21haW4vZHRzY2hlbWEvc2NoZW1hcy9tZW1vcnkueWFtbA0KDQpAUm9i
LEtyenlzenRvZiB3aGF0IGlzIG9uZSBtZWFudCB0byBkbyBoZXJlPw0KDQpUaGFua3MsDQpDb25v
ci4NCg0K
