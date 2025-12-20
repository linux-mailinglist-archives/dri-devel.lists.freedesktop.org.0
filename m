Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23514CD376D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 22:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9E510E00D;
	Sat, 20 Dec 2025 21:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gPrYIhDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012049.outbound.protection.outlook.com
 [40.93.195.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB48010E00D;
 Sat, 20 Dec 2025 21:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuRkQwjkUd3C5IGLwOOBGK0tgGi8fL8EHP1/sO0zRYkYxgVq8ApPPWf9K/OQtCEeJ26JNLHQqiujF53rNL99G2uoh7B0D7xno0+cJYsBp+jxln/6v8L9kax4mY7MEp+1RhgT5sj839q0VS+9t7pOZ5wI9znPCs4rh4IiTdWpwhjXCZ8xyvAxCTyPlyZnqXg9cl6S5PBFkTqUqvP7L45CyyecwWWoevY3jVhjAjt/aNLmD1IyDixMSKFVqRXRM5CukjyCC2peSKiNtUpF82b/S5GgINO8ImSrZkLRxanzFAX/Eb0c6Fb5pQ3+mmu76rbneOeHUhiRNHfsVrwsFPpPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ycnvm4TPi3XEDbng4kK3lqtB8KZYnecJ+ld4SGVxP14=;
 b=bIO+WJigwuzzUris4n7qrb++Tq9IKO914QSySPCS8kGqnDumZc2cCRNego1Wbm5mb5lWOpoC+ESAGaW5Zl160CjgZzIp+uE8KmWvYnV8W8FD2vuwQDfWQz5hqx67qq7ngRkBVRtVqFjM5jESEqgEz5KRvjUdZtYehQQnV06uSk86BKZ/LUEyXJoMsE2RZBDnzTnBTJkJ+gywruuARgi6Z67QxuqHC9DEgntnMv71O1tf+tTBxuWcht2RvmdIYVLRr3eSqivNK280Q5eAVl8/DIlE6UC6R9VwdmwQeSh8DjN9nimFUM0wqj7rbZZMtSJeqLGoarbvqCJriq0Wd2pg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycnvm4TPi3XEDbng4kK3lqtB8KZYnecJ+ld4SGVxP14=;
 b=gPrYIhDwoI5OyG7cndEORU+XCPl2RnIpJaR6eo5TkBnJZzW2rnrO4DsvFSUa11mKWAc7PHnF0mJfSC/UujwulB9yu94r3+xwtArmk9pZrZ2xwxivgq4x2enRW5BNK+FOo6cvpnKQp5cckAHnr8ZRil0FZ11ViBdaW867Huid+mcJ/tcI3peicq0jBPnuck8j1LoSI26o/XxLa9PkvdKIECPw+jpmd42FxsYWu8kGfZs3QOw/UWkok5ePAQGt8JQDZmnuc13zbSAuIcEtxSJ6cIZ4EVbl9xh1Zil+Rn3NYy0DOvjzJWrfwBgj8BWMyjJKogpzkDcGvAECiWrgJmPZ9Q==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Sat, 20 Dec
 2025 21:30:50 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 21:30:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "kwilczynski@kernel.org"
 <kwilczynski@kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHgnYQZUlgYEmrrqFJzoQGx7UkZ8AAgAL/6ICAAJiHAIAAVXmAgAK9kgA=
Date: Sat, 20 Dec 2025 21:30:48 +0000
Message-ID: <64be6d1f5fd70c8f0e3988d4220212b9f3d1d418.camel@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
 <DF1VQ45KF0JL.3E3GIL93DGBWL@nvidia.com>
In-Reply-To: <DF1VQ45KF0JL.3E3GIL93DGBWL@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DM4PR12MB5771:EE_
x-ms-office365-filtering-correlation-id: e2723dd4-d9a4-437c-8950-08de400f0b28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?S1o5cVJUWmljTlVkekd3Yi9keFhXcmdOWWRNWk9NRzhHTURsVjFtWnM2Uk1W?=
 =?utf-8?B?dEFwQ0Y0SGowbGZSK3lvc0JMUHlVcmp5cUY4Nzhic2xvZ3VPaXV6ZXdYTFVN?=
 =?utf-8?B?SEROZVdnc2Vyc08rZ3hraWVkb0hqcGo4RjVwL2F0bXFWNHNCSEJCZkpkNFg0?=
 =?utf-8?B?RG1CL2pEa0VVYitwWHBYWW9lNVY3OGZiNTRyUDlWNjBHQWRUdDNXVnQzNk5B?=
 =?utf-8?B?Qk1PVnhuY3pENzhPZ0VZaStiNlU4VTl0aUJjUytoWXNCN056cFpLV0dXa29Z?=
 =?utf-8?B?SUtnSXhZZHF2YUJ6MnM2UXZZSXlZamRLbkc4Sm8rWWlWZytjNFVNcUFqaUJO?=
 =?utf-8?B?SW1pSW5WbVFMRzJEU0ZKTjdKUXJEckxqMW92c2dobytCbzZRQ2c3ZjdxWUky?=
 =?utf-8?B?THJiZDY1WWFYKyt1bHlGblNjb2p4aVRNYzZTTlNXVW1NeWY1d3NXWGVhMWtp?=
 =?utf-8?B?Z1o0MlNXMkRUa0Q1VW4wSHZ3SjA5c3VvNmJEVnRFc2pUMkVHaEtVeFBXczha?=
 =?utf-8?B?QjRPRVhHQW1iYnZqOXdsMDUwN3M5VTlOMy9UUUZSa0srS1VzYStwWjNzVUY0?=
 =?utf-8?B?S2hoWGY2VkFVaWlneFgrcjRlREVRWnpDTnpZc1MzOFBFdU9STW42Ylc0UWYv?=
 =?utf-8?B?UitCam1VL0hRNFBLWitRckNoTmtuSC9WSXF2SWZzaHcvaDZpK1hCV0g2NFRq?=
 =?utf-8?B?NmxmdEtGZnVJV3BjcE9Qc1kwMkVGakRyWWwyUi81Zk0xSWxSdGJHSWs5YWlw?=
 =?utf-8?B?VDNvMlNoVVVjS0FkRDJ5ZnNsdmVlSGY5aDRDUzdENWJFM1hCbGE0Q0d6amF2?=
 =?utf-8?B?bExZQW5nQ2xtdHdvMVhNcXBkM3k5dVdVL2xGWVZJYVRUSkZvUjNFU3hReHZ4?=
 =?utf-8?B?dFFkMXlNYXpUei9wbCtVaXJjQ2pnZ1lYWUdjN2hOOWxZeGVyVnFCVktrSU15?=
 =?utf-8?B?dGY0UTRqZTlwWGpVSGdIeFVYTWFUU3ZVaWV5a1JWeTl5dEJ2UzFQMEZpMlIw?=
 =?utf-8?B?dmtoZ0IwVXpmSUkvMFpZenMrY3d4d2prZlBJaUtsTEVJNFluMEpieDhyRTZF?=
 =?utf-8?B?QWhSODZuamxxam5ldTNOZ1B5YzI4ZTRkRUo1R1RHcGJoZHVVWWZXTWNoSjlw?=
 =?utf-8?B?b2YyUXNtR0QxNkhwRVJjMjhzOHY1dVljMTFwdldFV0dQNXhhSmhkTEU1STNl?=
 =?utf-8?B?WnpZRjRPT0ZtdWJyTHF1RFBDTVViTGhSRTA5MFJyT1orS1B5Y3BuZ2JzLzMw?=
 =?utf-8?B?dThHTXMyYnVLV0JMRHVPOVFmRS9XblcvMVlEWUY1RlpyWGpOM2VYbFZiWEVn?=
 =?utf-8?B?dVIrVCtyT2xESkw2RHN0cVhrWXNNVXpKaXpJQ05JN2xRcENjSFFNdlBnSGNG?=
 =?utf-8?B?TVl6dGNEVXpVbEZ3WVRrbXd0eitKclhyTG5Nblc5ZTdCWXlHUHlkV2IzOUE2?=
 =?utf-8?B?ak9GT3BxNjRsVjV4U1FWMU92c3FYY0t5WHROeXNmMEovQTEyaXhHakJqb0cv?=
 =?utf-8?B?OEpjaUZ3clZqNzJCbjVHOGJodVR4Ym14eDA0SWVjZE1oOG5lNWhFY1RNd3p6?=
 =?utf-8?B?RlU2MGFpSTBmcHJCdUl6aG9kY2tMNk5nSk9pRzZFOGZyNkhvSTRCOFZPRUdI?=
 =?utf-8?B?KzN6Mjc1Z1JvdUtXSmtHTzZVMllvOHZhVWJBSmVSVkhDNjJnckhlaENCaE8v?=
 =?utf-8?B?cmZONG5HaUZVbUJiaVByOUZaVGw3TjdlZjhieVBPd1NyM00rR1dpR0VYaWVu?=
 =?utf-8?B?SU5OdklVS0M2dU1RblVUTFBVeTNxT3M3S1hPc2Z5bW83emxibEptSk9yTWFR?=
 =?utf-8?B?bWFLWGdoZzdQWmc4SDVWeDhYa0VxSGhMbklHK1d6eWduZGpEVDk1Z2ZJVEE5?=
 =?utf-8?B?N3JZcjM1TURlbVErMVFubWdRV2ZZNzdmNTMxa0JWR2ZIQmVqQTZXZWlPd2sy?=
 =?utf-8?B?ampETExnc2llOVJ0VTBOU2U2T0FKWlljcVRYYnlSdEtrNGlvd0RVTmJYdlNp?=
 =?utf-8?B?RnowMjBIZnRaYmVNVDhDeVVuU2E1OUx4cTJuSVRTWHBVRmR0d2FEVUkvRFg5?=
 =?utf-8?Q?rhP/sc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUdwWVR3Q2YzUjJtV1ZFNU5ob1Z4dkxYcndqbkVPMms2eW5rNm9aMUhndVp1?=
 =?utf-8?B?SHE4eDJIUUo5eE9vOTA1T00vem1OcWYvK1ZGTkJ4ZTNXUlFEVldQUUIzVXY5?=
 =?utf-8?B?Mm13cHhLWjFUL2ZFNnhZbjZmR04vN3BmbGlvMHNKSDQ5eDkvVWZUVEkrQjdY?=
 =?utf-8?B?TkF5ZnBSY1I1eWZITGgwNXRubWJhSmRzVFZta0NzOEhGRldscGtMbEtxNFVS?=
 =?utf-8?B?T1lVdTJuR0o5RnRvMlBkR3lralZhVS90NWNoUXZYYnMydFlRb1JjemtBcUQ1?=
 =?utf-8?B?MHdLNWNsVGhzT251UUZIaEJ2U3lWVVJBRk9NdU03YWg2NDNHV2YxWWlmRXY5?=
 =?utf-8?B?U25lY281MnJkK2Nob05SWGo0c3B6STI4QlJWblB4T3pLMnUzclU4NkNRVXo0?=
 =?utf-8?B?LzV4ZWx6b3Q5clVjNFlDRVJuUm1GUEs4aE5mbGRnclVxdWdCRkU2dWFlOFhS?=
 =?utf-8?B?azgrYlNIYndza1owdEVMdUkwckdLVHgzYUZEQ2k0TUhhSGhZN0FodU9hV2ZP?=
 =?utf-8?B?YkdhZkRFcnlYb3JFVEI4SDcrbW5DRStZa1pOdnB4TSt3N3UyL1FIZHNrYzc4?=
 =?utf-8?B?dGNkTWpKQ0pINGxVYTRnS2laVUkyWGVWbTNRUmYyZjJYTURFdGlsVnJxUUw0?=
 =?utf-8?B?ZDBCbGpSZWRrem4rd1BYNjhobTNCbkYvM09ORjU4Y21GY2FPcDVGa2dxT3Y4?=
 =?utf-8?B?QmlscHpKUHB2VmFiTG9XaFY0dXVLZTdTK2gvVGhEZGlxb3FCOGVFWWxrL0Y2?=
 =?utf-8?B?ZG5yYk9GOUFtN1ZFOHBKM3IvZDFlTTBMT2pkaXhMaHpjYm9yMVR1Q3hsaE9q?=
 =?utf-8?B?N3FvbG5scnRiYmFOTTRkSzNuUTlhVW52UzNvckNyM2xlZGJMdlA1RXB6djJt?=
 =?utf-8?B?SXBERTdZMEFIdkdwNWRWc2FPU2UvV0g2T1NtbXVBaXN1NVBBNXQ5RUZMMlJP?=
 =?utf-8?B?czBWK01lalgxMTlCQVRxNlkwenBZbTZ5ZnZncjh0QU9xV3F3RG5rZEtDbVJr?=
 =?utf-8?B?REpJdjI1QWI4aWJDdDFYdWFsN3RKRTc3alZnaWE3V1hYaHJWZTZZUTU0ZU1I?=
 =?utf-8?B?Zm8rSWlYbjYwZkpYTUdlNEFrUzJZVEl3dFlhVms3VGg3TTBsdWx5NUcvRVNn?=
 =?utf-8?B?NnROYmZKNUdlSjFXVE01Y0hIUWR2SFRKSXQ4QitKNXU4TXRoREJGUU9FaUpQ?=
 =?utf-8?B?Y3JaTSs0elNNd2luRlh3eWwrRm9VMzhHKzlZUkh3OHpUWk5vaHdNWThUN202?=
 =?utf-8?B?b29iUC9jaWdMakNQcUVwUEZKOHVCRVcvSGRkYXRMemhITlRKRmZhbVF3TmpB?=
 =?utf-8?B?eTJ0V1lsSXlBeHhEV2h0bjVaSnJMSEU0ejVWbzVJbVY0VEFvSTFpZVN3YU85?=
 =?utf-8?B?Z1gzWWdmajV4emRzNFAyclFRV0lUWmtzVDYvZDNPK1BidnRRZ01LaVkrREZr?=
 =?utf-8?B?VWdsVm8wZTk2LzV3NXVrZ3crTE5IdzhIckFFSDdHUUoyczJCQXlzTVBwTjZT?=
 =?utf-8?B?MlhBN2lvM2NqWUJVMnJ3ckRhcG1XcWIvYm9NZnZkbjJ0ZnlQeE56VXpBUVJG?=
 =?utf-8?B?RFhHanpJWVZWaUpQcEl5YWdFRWJ1Mjc3YTNBQmFlNGhLeUxvdGd0c243NTc5?=
 =?utf-8?B?NXZDcTI2Y0hTSGhWNUFaNTRYVi9vWitqRWs0NmRIQVpSdmtJdm1MM3dJYnEr?=
 =?utf-8?B?S3VJZmsyYStpYjMvQkFSZjZKZVhmMUpiTW4yMFpPS0RvY1RGOHM4dzdLcEx2?=
 =?utf-8?B?OWJDbjc5ZGQ1aTZESXV2WVUyYi94eUxjYjdrRFhTa2xubnJzK2VHdjVKUy84?=
 =?utf-8?B?SkJrNy9IbzBtUTJVRDVCSEhwUUozd3lDUVMrUGZHQnQ3MWFSdElLRWtmdE83?=
 =?utf-8?B?bndkbEl0dEo4eWMzZXYrcU03aFVyYW8zdlE0c05TbTl5eEppM0ZoZG1kQTFr?=
 =?utf-8?B?RVFKQkxaMXNiS04zZ0o0QWpUMWc4SG5yNGRENFVqM1ovRzQwdW1oUmN3ajRD?=
 =?utf-8?B?OFdwL2ttaDN2TzlxT2ptY0dFT01mbndTM2ZnclBFdDZLa2tXVmRQbXovU2Fi?=
 =?utf-8?B?bG9VMXZFS1Nubm1STzVyWk0yZ2s2Yi9Lb0l2eEg1VXlFM2U0ZGVPOUFZZ3dR?=
 =?utf-8?B?Ymg4RysxdytkcGJBK3FmREhxTWczL1RBM1IyY24vKzd5QmMyWUZNeG10SUxj?=
 =?utf-8?B?MFROek9tWnl2WTlCSFFzRzkvbUZKSWh0RS94VHljMTNZeUxCWFJDUDh1NkUx?=
 =?utf-8?B?TVhaekNYNUwveHVvRkpkcm1rUHBtSjhLVEhReHdiTlAwVTRnMVBsczRJZmxw?=
 =?utf-8?B?NC8xeHBhZUFqbjllVnJYdWVkektNSWN0OFplS2Q4SCtPZlR4c3Y0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <394F15AF11BA1143B04BA2DE5E97325A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2723dd4-d9a4-437c-8950-08de400f0b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 21:30:48.8652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uWYWlWT6Q1D9/ojgg5fwtE+9XNcT0RxQhX6Tnd8h+uz4V2lXb12Q4sAbap1Sybq1FFm6b0mU550FyR7hrEiGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771
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

T24gRnJpLCAyMDI1LTEyLTE5IGF0IDEyOjM5ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCg0KDQoNCj4gRG9lcyBOb3V2ZWF1IHJlYWxseSBoYW5kbGUgYWxsIG1lc3NhZ2VzIGFzeW5j
aHJvbm91c2x5PyBKdXN0IHRha2luZyBhDQo+IGxvb2sgYXQgYHI1MzVfZ3NwX3JwY19zZW5kYCBJ
IHNlZToNCj4gDQo+ICogQSBwb3RlbnRpYWwgYnVzeS1sb29wIHdpdGggYHI1MzVfZ3NwX3JwY19o
YW5kbGVfcmVwbHlgLCBBbiBhcmd1bWVudCB0bw0KPiAqIGRlZmluZSB3aGV0aGVyIHdlIHNob3Vs
ZCB3YWl0IGZvciBhIHJlcGx5IChgcG9saWN5YCkuDQo+IA0KPiBTbyBpdCBzZWVtcyBsaWtlIGVh
Y2ggR1NQIGNvbW1hbmQgZXhwZWN0aW5nIGEgcmVwbHkgaXMgZWZmZWN0aXZlbHkNCj4gbG9vcGlu
ZyB1bnRpbCBpdCBhcnJpdmVzLCB3aXRoIHNvbWUgbWVzc2FnZXMgKExJQk9TX1BSSU5ULCBTRVFV
RU5DRVIsDQo+IGV0Yy4pIGJlaW5nIG1hbmFnZWQgYnkgYSBub3RpZmllciByZWdpc3RlcmVkIHdp
dGggdGhlIGNvbW1hbmQgcXVldWUuIEJ1dA0KPiBtZXNzYWdlcyBzZW50IGV4cGxpY2l0bHkgYnkg
dGhlIGRyaXZlciBkb24ndCBzZWVtIHRvIG1ha2UgdXNlIG9mIGl0IGFuZA0KPiBpbnN0ZWFkIHBy
b2Nlc3MgbWVzc2FnZXMgdW50aWwgdGhleSBmaW5kIHRoZWlyIHJlcGx5Lg0KDQpZZXMsIHlvdSdy
ZSByaWdodC4gIEJ1dCB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0IGluIE5vdXZlYXUsIGFsbCBtZXNz
YWdlIHByb2Nlc3NpbmcgaXMgaGFuZGxlZCBieQ0KcjUzNV9nc3BfbXNnX3JlY3YoKSwgd2hpY2gg
YWx3YXlzIGFsc28gaGFuZGxlcyBhbGwgb2YgdGhlIGFzeW5jaHJvbm91cyAib3RoZXIiIG1lc3Nh
Z2VzLg0KDQpUaGUgYWJvdmUgYGxvb3BgIGV4cHJlc3Npb24gaW4gTm92YSBkb2Vzbid0IGRvIHRo
YXQuICBJdCdzIG1pc3NpbmcgdGhlIGFzeW5jaHJvbm91cyBoYW5kbGVyLiANClRoaXMgaXMgdGhl
IGNydXggb2YgbXkgY29uY2Vybi4NCg0KPiBUaGlzIHNlZW1zIHRvIHdvcmsgYmVjYXVzZSBJSVVD
IHRoZSBHU1Agc2VuZHMgcmVwbGllcyBpbiB0aGUgc2FtZSBvcmRlcg0KPiBhcyBpdCByZWNlaXZl
ZCB0aGUgbWVzc2FnZXMgKHNvIG9uZSBjYWxsZXIgY2Fubm90IGNvbnN1bWUgdGhlIHJlcGx5DQo+
IGludGVuZGVkIHRvIGFub3RoZXIpIGFuZCBHU1AgbWVzc2FnZXMgYXJlIGEgcmVwbGFjZW1lbnQg
Zm9yIHRoZSBDUFUNCj4gbWVzc2luZyB3aXRoIHRoZSBoYXJkd2FyZSBpdHNlbGYgYW55d2F5LiBT
byBpbiB0aGF0IGNvbnRleHQgdGhhdCBkZXNpZ24NCj4gaXMgbm90IHBhcnRpY3VsYXJseSBhd2Z1
bCwgYnV0IG1heWJlIHdlIHdpbGwgd2FudCB0byBzd2l0Y2ggdG8gc29tZXRoaW5nDQo+IGludGVy
cnVwdC1iYXNlZCBpbiBOb3ZhIGxvbmctdGVybSBhbnl3YXkuDQoNClN1cmUsIGJ1dCB3ZSBzdGls
bCBuZWVkIHRvIGRvIGl0IHRoZSB3YXkgTm91dmVhdSBoYW5kbGVzIGl0LiAgV2UgbmVlZCBvdXIg
b3duIHZlcnNpb24gb2YNCnI1MzVfZ3NwX3JwY19oYW5kbGVfcmVwbHkoKSB3aGljaCB1bmlmaWVz
IGhhbmRsaW5nIG9mIGFsbCBpbmNvbWluZyBtZXNzYWdlcywgZWl0aGVyIHBvbGxpbmcgb3INCmlu
dGVycnVwdC1iYXNlZC4NCg0KRm9yIG5vdywgd2UgY2FuIGFsd2F5cyBwYXNzIE5WS01fR1NQX1JQ
Q19SRVBMWV9QT0xMIG9yIE5WS01fR1NQX1JQQ19SRVBMWV9SRUNWLCB3aGljaCBhcmUNCnBvbGxp
bmctYmFzZWQuICBOVktNX0dTUF9SUENfUkVQTFlfTk9XQUlUIGlzIGFwcGFyZW50bHkgaW50ZXJy
dXB0LWJhc2VkLCB3aGljaCBJIGJlbGlldmUgaXMNCnRyaWdnZXJlZCB2aWEgcjUzNV9nc3BfbXNn
cV93b3JrKCkuDQo=
