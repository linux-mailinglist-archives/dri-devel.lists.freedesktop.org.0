Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF448CCDA2E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 22:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A98D10E123;
	Thu, 18 Dec 2025 21:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MJf76E1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BD910E123;
 Thu, 18 Dec 2025 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOCQaY7tCwUylBRw+W0S7l2IiFq/VDnB1ADIatbq+UEUQT54gSyeL4rkacaiWk8rR9iI60GTaZRPuya1jTP6/Dy39KMCRIQCBbgvSh+jeiLqmfqovrldrhwLJmndLJw9I0BAMiEcDChs5FYA0R2swbDOtrgOrGQ5FL5Qbxanawi9bxWJaO+GUWkVigSI0d75N9nEqfoTLEsui1IjsL00GRygEfYUCk3mLNGlX5c+C8nwa6POft0gJHjpNb7SyEdf3AHVZFMKKOKs8aoXFYBOQgR+LBT9PJupcyAaFZXKp8HDr3EE1gBT0POCj9pYuZVmPIP07eTemtFoHwG4KRRCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTh5i1IJ2qDrt+sGMq4UF8XfMhMI87QBwf30al9GVtk=;
 b=FS8oBowk7lVfmP7Y33PiMp/P+wW0WuanRej2fCu9tihsBjhwbFQGVnoynsItsyGaKqGm6Vm7fqBAScQx1q3KjCBjRkDQe77fRsiS9OKBSz2ILvXZl7Gl0jF3vMU2GPluzXdihHkABJZRhq0duFCTyvBJoYMBk/7sjnvpfY+hAfyB5LDSwV0N5iGVBmAJNzVVgpz1wI92U8Fw1LSVc5vZJUAzzgRxFMmniXCU2sAgwFu0EZgKvartMrgr+b6VE49D4sMkN4/8OskcSPbetiYylEd/aswM7lLQVzGaOjMXjGmLRNTKKKPXZNG/ULfPwtptKo+CxEwtQQbuFzKbON5geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTh5i1IJ2qDrt+sGMq4UF8XfMhMI87QBwf30al9GVtk=;
 b=MJf76E1yfStECXgA74+K5XWtxQKLIMai4Aef8U/idAASzlnsavMFjvjnTEv+Owu3jVI2pWMKa3+MwN/NpQ8TheHvM3maqjFLkcBb6TBIx775tied1YqjaST5dNDjDxjn2i0ujsWG1je13Y6Qr711UOnXw9E38IvcvDvnbo4UuiENFskY65mi10coupfnGWTceHCWzVcD9xW/3vhQvHwL3EL3yn0gbiV+RS8laeLF5oWpZ3vHADBRAhaut4YMoG8GAR4f0nPbZigZSuGnoqU6suJ/4Y6Sx5J4qAE6ALjjvswx2KYOvYn+J7eg1sS7lRVDJmF0QMPvfXkJrxxZSJbMKw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 21:06:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:06:22 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 0/4] nova-core Improve pin initializer code
Thread-Topic: [PATCH 0/4] nova-core Improve pin initializer code
Thread-Index: AQHccDZhlW4k8+ECqkCLHJUGz15BOrUn4+ah
Date: Thu, 18 Dec 2025 21:06:22 +0000
Message-ID: <FB4E7596-3C84-4D65-81F2-57036F725C0C@nvidia.com>
References: <20251218155239.25243-1-dakr@kernel.org>
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|CY5PR12MB6574:EE_
x-ms-office365-filtering-correlation-id: ce6b8ab4-d652-45a3-b39a-08de3e794c35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TXlVWTF6RVJtUHhteXRWclhNVWltdHVuSmF3OVd5NkdRZ0JjL3ZWR3VreHJU?=
 =?utf-8?B?a2xId3U0aDdhOUZmY3hnL1ZvbUpVNm1Pd1NDL0JvQnNMcXNCRncrbHNLNDVt?=
 =?utf-8?B?ZkJIWk1oeS95WUMxdFBLZUViTDcrTjRJMzVKbXdSRk5IMjAraUFNNlpWcjRI?=
 =?utf-8?B?NzNrOEZnYWZLTFZPdG8vQjdSbGNObXF5Q0J4eGJBWG1zWWlWODlZaFZYNGcz?=
 =?utf-8?B?TlFXOE5SOHB3U3ZHVGhxRTV6NWVjRjdzWUVzSGJKUlBydiszOW1qWnR5eEdh?=
 =?utf-8?B?S0txbGNPOEUvbVBOZ2xCUk92UkxqZ041SHpzaFpjQjhXYXV5dmtiMHcvbDI2?=
 =?utf-8?B?NzAwUjkrN3JFTVA2aWcwQnFDNmYrOFZ2a3pFdWZ4M3lJV2NMd09TakRpQmlw?=
 =?utf-8?B?OHA1SENrZkJrZStZZlBBdDlpN1UxVkhBZzhibW5RTWRmdTVSVjJ5SDNja1lv?=
 =?utf-8?B?WHhNRVVPUVFiUjExcHJhOWs5OUhpZW1NNjJaZjFxQ3V0cGdyV3ZMK1dMZ3Fv?=
 =?utf-8?B?Ry9YVDZzc1ZpZCs3clh1MndiVVJHaTNzd0RpQnZ0R1ZLYTFzOEJWSkFVcU1Y?=
 =?utf-8?B?aHU4YmRYTWEzd2JTVWxDMXUwOVBEYnN1cUFESC9ZVkxkR2Qxak5iVTJaeEIx?=
 =?utf-8?B?V1MrZncvd2lST09FbWp1ejRId2xXelcyR1dJNGNnN2hvQk9nMnFKVkd2MGN3?=
 =?utf-8?B?V0FXWHJETjFVRHMxOHhOSG84aGJ4MzNyTDZ6WGlDMHRtdWJmRXZHRjMwa2pk?=
 =?utf-8?B?UzBIbWw2cmx5WEZOcndoRjJTSDFEZE1Mc2wzTzFldGZNcG1mNmZYbTJNNUt5?=
 =?utf-8?B?R0tiM3k2OVUvR1hqWncrUjNaVUl0RE5CYi9QUytaN0tvTjBYMUROMUhEN0NR?=
 =?utf-8?B?eWdsUEFuY1Btc0ZCT29lUXlPUXJQZFZUU1NjejJxd3Y5NWllQVFMSjg1MThM?=
 =?utf-8?B?TXBDL0Q1U0g3aUN5bnNUZ0RnYml0d3NVREhSWFlsbjZiNGdXa0RsbGl0Vm1W?=
 =?utf-8?B?MlNNMW54aVU0UWg3eGkrOTJIb3JwcmJCUGVBcUUvNCtDY2Zpc3k4U0UyVWpC?=
 =?utf-8?B?OHRwdWVoK3gvR2trSzFaZHBkMzUyZU9acU03VWJvYldmcWhWTmZHdVBPc1Vl?=
 =?utf-8?B?UjV5akl1UnZmYUg3UlFpNC9WWDUwMVhsUUo2VDhpUkYxWmwveklQTkFWZXBP?=
 =?utf-8?B?OUFIUDIwQ0xhZlVLeG8rSk9ZVDMyT3hscFpBTjFHMWl2eXArRjRNTHFwQjFi?=
 =?utf-8?B?N2djUWY5bTlaTHM2WkhySXY2OWtWTWlkSzJJMm9senhJMHppdkk0Q0ZuVU93?=
 =?utf-8?B?SUZCbUt6QUpVZEplK09qalp6TDNSMmtRUnJIR3RUWFVlbzZqT1l0VE8yVDFh?=
 =?utf-8?B?MGxPRlhqWmdQcDZaU2lpMXU3WW5lMDJWZmx5dGpiMi9JWnhRdmV3V3NtMGl0?=
 =?utf-8?B?TjBKaHZsR0cvU3RBSlJMV2dmZ3NuaktzUVJjWXZUS0lZUFBkdlJEZVV6cm13?=
 =?utf-8?B?aENwZy8zem1rYXFNZ05jcG1lalIwWmYvMENVVFAvUzhXeGtuK0RnREVsOVZo?=
 =?utf-8?B?VUI4T1A1Qm1ndXpQcFl6cTl1RWN4dXV3UGdBU3RpandjVGc1ZFVjVEw3VlNp?=
 =?utf-8?B?WmZ0THViRkJ5Z0tNb1crd1ZBMVJDcE1DRng4QmJXbzdlcVVlZUdId2U0bWpW?=
 =?utf-8?B?SVE5ejFGc2NZQnJlWk1EWlVTRWhEcDM2UHZaaFZWd2Exa3ZIeFJuQVRacjFo?=
 =?utf-8?B?emxLVm45a0J4RUNVd2E2cFYzdlV2QnJpQ2RXUGVHNjZ0aE0xb2lhR1N5NUhk?=
 =?utf-8?B?WFVIdWF3Nk45dHhRWUFYSXFsL2ZBWTlXZytDTFI5M25jQWVqTzFPcFEzUGs5?=
 =?utf-8?B?NlRrTXVVUVBJQ3dmYzhSNlNmRWd3K1c3ZDlwRHNaMEh3RTkxeWlaajdUcFlG?=
 =?utf-8?B?RnhyUXdnNlg5WDBKd0ZKTlZJbFpVNWZDMUN1a1NIWG9Od2VyVFl4eTVQck1H?=
 =?utf-8?B?TExXUlREQ1VXMDdDQ2J3ZG04eG1YR3NrajhsWU9uUDJyeVZ3WTMrQ1lVaDZI?=
 =?utf-8?Q?c24SlZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3crckRiV01BSkhpSCtPdXNSWU1Wa09IT3ZrRkZmQkV5ZHFZQkdqaDlZaENT?=
 =?utf-8?B?UVBNTGRyTkZ2V2kwQ2F2UjllSjRDZWxpT21FVzhWOUc5NUg4RTRqVzV2NXhU?=
 =?utf-8?B?MWg5U2pHQ0ZhVlorNXFQMTUrem00QWJPK01mT0tzSVE1Qklmb2VjRlFjeXRT?=
 =?utf-8?B?ZGhwQS9Kdjk5YkhkdnFjODlhZ1dyNmptZjNBd2tyelNjUTczdzdpMFJJN1py?=
 =?utf-8?B?Q0xTblphR2JWWUxQSzRXSERRRkd4dWc4UUROdXdkazhxeGhIRHVOay9DUlF0?=
 =?utf-8?B?QnR1UjBBRzRPWmtOSTVvQmxnMVZrUzhLNXJIaENwRDA1K3A0MmZOOVFPM2tI?=
 =?utf-8?B?Yllsa2czaUtuZTcxQkhEaEJ2YVd0bVdFcDhhdUVtUXJOd1Ftd2NUT1dTVVh1?=
 =?utf-8?B?c2toM1VUMEtZa1FWYTFKdHFlS21BSEZ3aUs2TzVBRnY0RHA4ZEtaa25XUVBr?=
 =?utf-8?B?bDlGUytEMTVwK2pCdGxWcGltRGJTL2JmMlpBVi9TMW9UZkIyNkh6eVhsOWNv?=
 =?utf-8?B?ZWpWem4rS1lHMUdUc1dRQ2diZ09qcHMwQU9vbW1BMGNGN2tvTHpOa0NEUFQz?=
 =?utf-8?B?MFBncGx1UFg0R3M5bmdhaE5nVjhCUHFQd1ByOW81Ymo4RFRRRzJNSjRsQThD?=
 =?utf-8?B?M24wdFEzUkJCejVnb2xSZFB1YXhyMUhNbGZ1aEZGa0J4bHJ4ZEhnWSt0ZE5a?=
 =?utf-8?B?ZGhUdHIwQ0d0RmVvSGt4eGczY0xTbEdYeE5iVDdCc0JtUWlDcW5GUUNXS2gy?=
 =?utf-8?B?SzdIa216dmc2OE9PY1BuTk1KQkh0TlBsMDlOZGpJbS9GclJycDF0ZWw0Z2pV?=
 =?utf-8?B?WjF2d1RQYzVvOHA0bkF0RVdUMVdEMUFiTk52M0s1OUVzbDZnUjRmclYxRHdh?=
 =?utf-8?B?UFlKdEpuMUhUcVVranI4ODVtL3EvSWxzVThBZnVBNGpLNjhXWlp0Z2Fjbmh2?=
 =?utf-8?B?Y2NpMnQwMWNCbVY5cXl6QWtFY0MxTmZqeElIZndXWklYQ3Z3b1JkVWpIa3pi?=
 =?utf-8?B?RmhubTNPTi9aaGdMeitxU2srOXN6MXhaZ1BpbzQ2RnhEejRsNzRKTnRIeG52?=
 =?utf-8?B?TmVvcTdxSUU5R21LSk9BOE8wVXBhdmNDSHFlaXZFdHJRb1d4bDc2MlVESnNO?=
 =?utf-8?B?b1dzaVdka1M4S0lFWkJ6Z1JJQWZFYjVUTHo0OENXb0ZTTER0V2hFNWVycnBv?=
 =?utf-8?B?aXBtZFQ1Q0tFMkNEMGxaTG1QazNhTFc5aDBKdFJIMmpwNzJmVWlUbC8zRktK?=
 =?utf-8?B?aDlFKzJGTThKYndqN21MSnhMaUltVjExQjRkMHMyVVZYOVN6d3NlYlpzZ25L?=
 =?utf-8?B?OWIxek1oVURDR2d4RkVVRWxQMlUxZnkwMGEyVnU1cUM1TkllK3pGSkRzbE9r?=
 =?utf-8?B?NFNER2h3b1EwYWZKbVk5M3ZFT2hkWHoxbXFnMTdGSVBZVGNPMmxsQWxwOTFj?=
 =?utf-8?B?WEN2ZTlaaGsxeFd3ZWxwZmRlMU5GSmJXUmR3bWEyK01KQ3hsdjE3a21La0Vo?=
 =?utf-8?B?V1lHOFBhelBjOHFSM3VFSGlOc29SVEtqSmJWTDBLc3dBV2Nwdk5xcS91NVd4?=
 =?utf-8?B?T1AvdW5rTGVmQlJKZXF4SkwxcEh4Uncwci9YUTVVOGRvRnBObXVrenhsYXli?=
 =?utf-8?B?c2JiaUVMUnozZEVOS0VyQmE0TTFYRC96SGx4dVBwMHlHNXhWRThiVENnQTVO?=
 =?utf-8?B?L2ZlRFIyblhJc2NEcWNxM3BsK29GSmZQeXYyR1JMTWxITUx5eFZUSE4wTVVK?=
 =?utf-8?B?S2wzd0NFTVl5S0ptM01kTXBiaVVockxRN3NUaStHclVjM2o5QWFnSDRXT1FN?=
 =?utf-8?B?RDJEN2tmbE5ZWU4rV25XNkljRElSZk1kS0htL3V6eDVPTStidjBSSGpIWVNl?=
 =?utf-8?B?UVlWeVQyNVBlbE5JME1tNjViTndabGowMlhybGJzeXFVNnc5L1h2OWZ0cUZa?=
 =?utf-8?B?YnpXeWJCSWxVUWwrVExPQ1pMTHM0TUhhbHVaeG1HZTd6bXFpWE1FY2kxQitO?=
 =?utf-8?B?ckpxS252ZnM1YW55MlFOUkFwUmdjOWtEYjFlWTNsVWpPNFZqZjdXTTRmNHNS?=
 =?utf-8?B?YUVUWjFhbk1pZXhjVkhwNGgrV3YxZ3Q2WjJVcFVRV3UwS09kSG1DaXVsQmFJ?=
 =?utf-8?Q?D9maOfHdi0wQLqom8RrLLoKHe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6b8ab4-d652-45a3-b39a-08de3e794c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 21:06:22.3447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NCMDDtajw9/hZbl3Z3q0exI5Up70Pn3kud4u/Qq+qdVcD+QNxlK53U00dICFkNsg9CjqvMrw/Rc4HAVkVNvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574
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

DQoNCj4gT24gRGVjIDE4LCAyMDI1LCBhdCAxMDo1MuKAr0FNLCBEYW5pbG8gS3J1bW1yaWNoIDxk
YWtyQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/VGhpcyBpcyBhIG1pbm9yIHNlcmllcyB0
byBpbXByb3ZlIHNvbWUgb2YgdGhlIHBpbiBpbml0aWFsaXplciBjb2RlIHRvOg0KPiANCj4gMS4g
UmVkdWNlIHJlZHVuZGFuY3kgY2F1c2VkIGJ5IFJlc3VsdDxpbXBsIFBpbkluaXQ8VCwgRXJyb3I+
PiByZXR1cm4NCj4gdmFsdWVzIHdpdGggcGluX2luaXRfc2NvcGUoKS4NCj4gDQo+IDIuIFJlbG9j
YXRlIGNvZGUgdGhhdCB0ZWNobmljYWxseSBmaXRzIGluIHRoZSBwaW4gaW5pdGlhbGl6ZXIgaW50
byB0aGUNCj4gaW5pdGlhbGl6ZXIgaXRzZWxmLg0KPiANCj4gV2hpbGUsIHRoYW5rcyB0byBwaW5f
aW5pdF9zY29wZSgpLCBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGtlZXAgaXQgYXMgaXMsDQo+IG1v
dmluZyBhcHByb3ByaWF0ZSBjb2RlIGludG8gdGhlIGluaXRpYWxpemVyIGhhcyB0aGUgYWR2YW50
YWdlIHRoYXQgaXQNCj4gc3RydWN0dXJlcyB0aGUgZGVwZW5kZW5jaWVzIG9mIGZpZWxkcyBuYXR1
cmFsbHkuDQo+IA0KPiBGb3IgaW5zdGFuY2UsIGludGVybWVkaWF0ZSBkYXRhIHRoYXQgaXMgb25s
eSBuZWVkZWQgZm9yIGEgc2luZ2xlIGZpZWxkIGdvZXMNCj4gaW50byB0aGUgaW5pdGlhbGl6ZXIg
YmxvY2sgb2YgdGhpcyBmaWVsZCwgbWFraW5nIGl0IG9idmlvdXMgdGhhdCBpdCBpcyBub3QNCj4g
bmVlZGVkIGJ5IGFueXRoaW5nIGVsc2UuDQo+IA0KPiBPbiB0aGUgb3RoZXIgaGFuZCwgaW50ZXJt
ZWRpYXRlIGRhdGEgdGhhdCBpcyBuZWVkZWQgZm9yIG11bHRpcGxlIGZpZWxkcyB0bw0KPiBpbml0
aWFsaXplIHJlbWFpbnMgYWJvdmUgdGhlIGluaXRpYWxpemVyLCBuYXR1cmFsbHkgaW5kaWNhdGlu
ZyB0aGF0IGl0IGlzDQo+IG5lZWRlZCBteSBtdWx0aXBsZSBmaWVsZHMuDQo+IA0KPiBEYW5pbG8g
S3J1bW1yaWNoICg0KToNCj4gIGdwdTogbm92YS1jb3JlOiBmdzogZ2V0IHJpZCBvZiByZWR1bmRh
bnQgUmVzdWx0IGluIEdzcEZpcm13YXJlOjpuZXcoKQ0KPiAgZ3B1OiBub3ZhLWNvcmU6IGZ3OiBt
b3ZlIGFwcHJvcHJpYXRlIGNvZGUgaW50byBwaW4gaW5pdGlhbGl6ZXINCj4gIGdwdTogbm92YS1j
b3JlOiBnc3A6IGdldCByaWQgb2YgcmVkdW5kYW50IFJlc3VsdCBpbiBHc3A6Om5ldygpDQo+ICBn
cHU6IG5vdmEtY29yZTogZ3NwOiBtb3ZlIGFwcHJvcHJpYXRlIGNvZGUgaW50byBwaW4gaW5pdGlh
bGl6ZXINCg0KUmV2aWV3ZWQtYnk6IEpvZWwgRmVybmFuZGVzIDxqb2VsYWduZWxmQG52aWRpYS5j
b20+DQoNCnRoYW5rcywNCg0KIC0gSm9lbA0KDQoNCj4gDQo+IGRyaXZlcnMvZ3B1L25vdmEtY29y
ZS9maXJtd2FyZS9nc3AucnMgfCAxMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gZHJp
dmVycy9ncHUvbm92YS1jb3JlL2dwdS5ycyAgICAgICAgICB8ICAgMiArLQ0KPiBkcml2ZXJzL2dw
dS9ub3ZhLWNvcmUvZ3NwLnJzICAgICAgICAgIHwgIDczICsrKysrKystLS0tLS0tDQo+IGRyaXZl
cnMvZ3B1L25vdmEtY29yZS9nc3AvYm9vdC5ycyAgICAgfCAgIDUgKy0NCj4gNCBmaWxlcyBjaGFu
Z2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9ucygtKQ0KPiANCj4gDQo+IGJhc2Ut
Y29tbWl0OiA5N2NmNmJjMGFiZDM4MWZkODRlNWQ4ZTk3ODMyMmE2MmE1OGZiMDBlDQo+IC0tDQo+
IDIuNTIuMA0KPiANCg==
