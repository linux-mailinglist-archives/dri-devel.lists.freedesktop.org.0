Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A5B92C08
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AA710E4EC;
	Mon, 22 Sep 2025 19:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rlcqpLvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010000.outbound.protection.outlook.com
 [52.101.193.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDF810E4EA;
 Mon, 22 Sep 2025 19:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRCMsqw2XVXQQvKiDUVDMO3zoHvjKY1pCUNbhEefEVDf4rcl1Vvmen1IGdyaK1U9Lw4VuCPaengSSek1M0alBhbWSB12EODQEJ0VmI1iR6pVMUOxdiU1Zz38ndF0KGllLeCPBwN8IlZfbQd6J+AUjrLvPvQcNQbz7omgC5m70vjaEuiagbZ77FdoloR4c5M07XkbtZ4qx3suzsfFniHmrYqRN9LF9ikyc8YFn9s0htEEYyDGeCVGWwoq7mpt0JJeb9KA8wk47eAde30osIsUH9f+um9PEplNBH0k18oLhY8e0qnSS9vRryBFzxUXHsSQydqy5T7NRjNjX7glsIgA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUIOETeJ7+/E9L6MQepSnxutP/s87L8lwnnYOgkzdkc=;
 b=xnrQyZb/5fggf9+G16hj6HKVgyhoq5fzh1THdWmGNbbzIS96BN0bF8RVdY5gcPGcTev3fxjWZ/WW/5D68KIpuxdmj2LcOxxspm8VILqm+TfBsbaJnVppoqHsVQZCdM4vFqdiksu0x7sK/4WMUfMtwI3RTHjTy9PZlSueVAZJ1lsT9Agdc95yZIdySw1IzUt72GbsZ9AIP9JdLIImQg7HnW9ehOgU1dc5mCf0wVsYkkdaZDHh4z6QiL7BRQk6j8WRy05LwdZT/sv/+VnZCDlBAZPajjfs9jacgNfXXjv+woJp1MxXcZGOls5/y8d5JN2BdwhppeNEteyHm53uLACncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUIOETeJ7+/E9L6MQepSnxutP/s87L8lwnnYOgkzdkc=;
 b=rlcqpLvU/FpkTFiM/WLY5sbp4y2QbclP7n1qncmuCnKBsPjEqvWaPC7vZuo3jqFaTBfNPRTMna+1Gwvq5aLvQioNZ4+PuRA53+ECQraK3pfckJXkN4+/JvAbjRhKSGlFTIO60s17Uuxo9dwCr4BE9l2kXARqMv+kzY9fn3YoUbdM6TT/x2c4JGoXVxizLONYLJVR6pcos3Ozoug7T2iEDCd6xCYVlPDw3Eo9jGH1y1qhRCrZVLlYEA+m70YJBc1OrYtzuodKL99kD1cxGD4IqXroB0SrD09ywG9X1twkbQzuoOTP7Vj4oMsevbgzsvKzKMLtQAvheDFy779w8J95EA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:12:56 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:12:56 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH v2 08/10] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Topic: [PATCH v2 08/10] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Index: AQHcK7RuFuxZ8CZ67ESqg+gi8zK57bSfkmOA
Date: Mon, 22 Sep 2025 19:12:55 +0000
Message-ID: <38bbcbbb7bdf88f3a06ed9925d4fa058d6352d51.camel@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-9-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-9-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB4101:EE_
x-ms-office365-filtering-correlation-id: 27a9cf3e-0742-435c-3482-08ddfa0c0961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bFlPSFhIaUhXaThOSG1MaXJWOFg4SEJjQ0FXRHo3b0hiWkF6SnRXYlhDT1lU?=
 =?utf-8?B?d1dLbDgwMURHeTVyQmRBOXlnWTJTUHd1M2RFTnkxSGtLSjJNZnhTM0ZqdXM5?=
 =?utf-8?B?aXZ5OVpSOXZvTTM1ekZYbFo5OXMyakpyK25EOVBtMG5KVU1nLy9yeFdqQmpi?=
 =?utf-8?B?MUpzeWM0UDNhQVlxTUZrSExhZVRMTTJCakdpT3lpZklrTjJVS1VtMzF6MUNi?=
 =?utf-8?B?RTNBS1g3QXZpbzdjWXVJMm1EcjlzaHIzY1NXU0FzMzkralhzS21CTkpaQjRD?=
 =?utf-8?B?eDVRWm1LWnpvc1NVUzk1NUZSU2hXMFlEMVp0amoyM01FYWl5eHRlU20rQ0x2?=
 =?utf-8?B?QitYVW10a09SOG1aaTNlQ08veFg2bmM0dUU0ZFpzSVQ5ZDdHeUZMNkhjZWJC?=
 =?utf-8?B?M21GRk1iZDBtNnd2SGRSTUR3QVNMVlNTRlBWVENwYVhwRjVtU3doQzl0cWVV?=
 =?utf-8?B?QzdrTUJqSCtpemtoNDdsdThGZS9IdnNBTjg1MFc1K0U0YkI2clE0ZWU3K3Nx?=
 =?utf-8?B?SEFOY29TWUJULzl4bFY2UWE0c0lCY3Jlbm9OSk42QXlDaWZNaVkvR1diK3VP?=
 =?utf-8?B?enpDcW9KTXdMS1F6M2VmaFVVT3N6ZzJ5QTUrb1YxekFodnBXcVJuODk1T3cy?=
 =?utf-8?B?TkhQd0JGcXQwSmFXSkdBenpFMWFidUkxVVNWRG1lWkxkRFczd3pab3RnTURm?=
 =?utf-8?B?RU5lbXBhU0d4SFNNdHNDbmFSbVo3UzhVQ1ZjVGRBM0tzVHJnQlQxMWVFTGFH?=
 =?utf-8?B?czQ0MXFwbGZHV3dkL2FEVTVQSldZdyt6ckU4OGlDb3k3ZjNCNEk1OGtKZHEx?=
 =?utf-8?B?ZFYwQlZqa2JGa2Yrd2t6ckh4dll5aURrMDZLYjFrVUUxeG1XNXZ6MXpuOE8y?=
 =?utf-8?B?QTFBUFRaUEU0WUFaV05HZFEwbXAvczk1S3BsZUdtRVgrUHFoU29CZWRJdUVO?=
 =?utf-8?B?eHZuKzBLL21qVW50S3RVYkY1ejlYM3RqdlJycGlaRGVGbCtpY0ZPMithTElK?=
 =?utf-8?B?ZXBOUXBGTFU2ZmgvWjZkVmZkTC9lOGRrUTFoVnRCbGRxYW5Gd2JsMGJjbHli?=
 =?utf-8?B?TDRJUE13c2xwZDFnMFYrY1ptTXBvUmx2bGtObkhmOW5GQnoyTWlidUdoZmww?=
 =?utf-8?B?RitJRmZXczhHR21BZ2JDVVFvbnQ0Wnh1azBMbVc2Q0h1NUp3SDlBeVNzV3pt?=
 =?utf-8?B?K1dkOXJ3aTFUcE1UamUzT2IvWDB4RFVRUDh0UTFyeStodmFMTFB5VENuUmpF?=
 =?utf-8?B?aHp2WmpUOWUxaUg2cS9lMkVMWVRHV2ZYT1p4b0xGbE9sQzRVS0JhZk14NmxH?=
 =?utf-8?B?QUM0MWYrU2hpL290c0IxZHNRdHpwUkVjOHdMY0tpeU8zQTRJK1B1MkpNSGd0?=
 =?utf-8?B?a1k4SU1BYmhna0VBSGNvMk9qZ28vV1VJMzFPTkIrNlBoOXloWnczMUJNamhj?=
 =?utf-8?B?SkdBaE1qMkI4Q0YzanNrL1hPeFhqTkp0LzV2Q3hyWkt0aGtlelg0UG1xSHlB?=
 =?utf-8?B?TUZmako5STVsS2U5QmgySldxeG9yTVpVNXI1WmREaUUvVGxvOGx2VmZxU2Nt?=
 =?utf-8?B?ZU1HVGRpMlUwQWIyRkoxcHY4S3NnT01iUFEwbEU2YWNVU1FBVDdUdlBsRmtU?=
 =?utf-8?B?MEJkUy9venpQRWZIcEFGQU9yODBUc1Z4RDM5NFNwcWxid3lnZ1NSK3k3K1F1?=
 =?utf-8?B?TUxFZHREOW14Nnl4Qk93RWcrOVdqeFQ2Y0FuRHViYThHRkZVNWRPakNCcDVq?=
 =?utf-8?B?R3lxbHB5TmR2SS9qak9JVUlnUGxRRTgyU2dOVUxiLzlNMG9kSTNrcHlOa0l2?=
 =?utf-8?B?T0RKRVRLL3U4dzZuU0xLdUlmc1VYOUJnTXlMRkNrU09za1BoNU5qRU52Ujgw?=
 =?utf-8?B?bUFMeExrcCtvdVlaWXB1M0NLUjVqQm5hWHVzMTE1V0NyOW5uS0k4bGE5WjI4?=
 =?utf-8?B?MGN5Y0FyeXBvSEc2dnl4TU1vNXo3SEhYVVlMUzZlMTlWM3pLS09wZTFUZnlS?=
 =?utf-8?Q?7vY8BD3JQa9iuoKqhHphvJed3xsqr0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWZDZFFPQzJUQUsyejRmQ1JVdjdkeUUycFZCNVJwTjM0Z2lxUGhydExIc2pR?=
 =?utf-8?B?ZWRCS2U3TnlkV1J2Y0FmZE5RUHBtYzVhNDVmN2xSZFlkcngxeEtEc3BOOThL?=
 =?utf-8?B?ZE0yZUJKV1loY21yYzFGVzZlTkEwd3Znb3lyL3o2Rm1IWTBvVnRvN0tYZGFs?=
 =?utf-8?B?SDY0VFJPbVdrSjVGTlFpQVNvelZpengveDRwZTBQZTNKK20rSHh1N3piVHc1?=
 =?utf-8?B?OEZJZVREUytub3lxYUxzQkZRZURGQWFkdFpQYkplVlVYdFhKZFk3ZmhUYytM?=
 =?utf-8?B?NUozZTVmVW40MGkxRmNXeW9VN0FyWXdjTndTbldlTmpWSUJJSjNOL3JpbVVp?=
 =?utf-8?B?cnUxYUVIcHJzVDhybkd4TFBzdk92Qm9XL2F1N2plR21ncTdSS21MckxrU0JD?=
 =?utf-8?B?b1ZlQ0NmejdZT0hyNHlCTGFSMGFGeENYQUh3MHIxWWdxTFlzQlh2YTBRRlZr?=
 =?utf-8?B?R3JYS1N1ejZqSDl4Ti93UHlEb0xTMkFoMEpldlVodW5xamxZMEh3L3A1bTdr?=
 =?utf-8?B?TlJRcWRLSEhVdm1LdVQzblJBUXFmbTJxY0FPN0hDeUtKL2x4MlhYanhXcElQ?=
 =?utf-8?B?ZEpHN0NBOHNTUFNFQWdIVzVUVys2MU4xRHRVTE9pSHRHUjgrdFM0RXBraFoy?=
 =?utf-8?B?dXdyQnROQVdOWjk2ZzZUZXdnY1ZJVkVFU3p3WnNvaDQ5aVRucDVuaEZ4elV5?=
 =?utf-8?B?b0JhdHlGTVUyYXhKRVVZRW5KWHYySnJoTVkyRkZYbDZXUWxmQVBncEVYanNq?=
 =?utf-8?B?UDU0UXNjNzRyYWxCSGJDRzlMVVZrLzIrckNDTGowRStuR3diNkRvK0FuMVNH?=
 =?utf-8?B?dWRyRzFZOStmeks0TVovTGE5dUp0WnVIMWhEUEJhS0NtZ0ZQYVk5c2FPQ1Ft?=
 =?utf-8?B?eGNvVWhrYit3MTMrb21jOUErOWQ4SE9qdVFxQ0V3clhDK0xWZDlJY0tXSUds?=
 =?utf-8?B?aVlvUlRCTkxuVjdjbkwxc1BSZ3J1a3pvKzRXZUdEL1JsWVVRRkV4OUhidy9r?=
 =?utf-8?B?NTVNWnRPN0NjWVV2cEIySlE0N1B2Uk4rR2ZXSU1nM3Y0MHdpT0lvTmpXRG9Y?=
 =?utf-8?B?YUtZeVNwMHdmc3NqajF0RDBNMm4rQzk5amZkSmppOGF5OHBHUFJLZ3orTThB?=
 =?utf-8?B?WkhDcW1VS2FNUmQyU0p6ZTljSWl5OEJWOHgxVnZMZHBRQjE5TUlxOHM0M3VX?=
 =?utf-8?B?RjQ5T3h4dWxIdFpuZ3BuRktMeGZsdkNFalRWSDMwZnVieU5GdEFJYitYNHBD?=
 =?utf-8?B?TFp0THJHN2hOUnRFZnJ5Sm5ub2FRdjYwdGZpOFNkd1pnSml4a2ZVVXJxQ3JY?=
 =?utf-8?B?WUlxTU5kYmxSajBDOXA4Q0xBQlRWNWhQa3NCUTVNcWV0Y0hnc2FDSHFFQlBh?=
 =?utf-8?B?dU5ad2wyN3d1YjNtZmdFdzhCL1dJRzlienRBbjVEUVg5TnFvSGlld0RoWEFD?=
 =?utf-8?B?TzdtUE5MdUJqbFVqRnhxTVJWZStlYUsyYjB2MFJaMkhETkpnOGpFaDZ0ZzdO?=
 =?utf-8?B?eTNvdkhYRTN5TWFoeTVjWXpDOXJ1dnFxSXRHaGNhTVhBdFBObDV4b1Y2QkNC?=
 =?utf-8?B?a1VlMW1xUGxTNEZXemNwQUo5aVFlZmkxNFpwUnVTOGZUaFhpVDE3MjNLbS9o?=
 =?utf-8?B?QmhDRnI2dThjTldyWVhSWlYxQVhaZHVGV2MvMmtVZ3dMNmtnUlNJeXRBUDZU?=
 =?utf-8?B?VE1LSFU5NHVHMGlvZ1AxTkI0eHphUjRFNWJGV0JQM2pmcytRZCs3OWwwM3hs?=
 =?utf-8?B?UEZ3NjlHSmFvczJIVlRRd0VISVNqbkRlV0RMUzUrcGNtQ1VtS3ArTEF5UHRl?=
 =?utf-8?B?Rmw1RDFqV0NFV3Y4ZVA0TmNDZzk4dTdlc05lbDFodnlqdmRJaXluVmFmS3Vi?=
 =?utf-8?B?RXByVkU2Y2FtMW1xV1NBSm1Qc0cwblozVHZraXBkSVpYM2JRUER4bDlaTEJB?=
 =?utf-8?B?VjB4d0h2dDUrWHJDdU1BZkYzcFZpYmU1dG9vZnAzRVNlTUVxVERjMlZKaWZz?=
 =?utf-8?B?bGRpWVdnaHVGZ0c4cmVtd1BaVDBXNUZkUFJ1M2NVcWpsWVMyTFF0bjBhUE9q?=
 =?utf-8?B?RjhxOFZiZ2N1YTFlaURGK3JteENJL204amsrdHYrM2pDZU5wQ1Vtam9qUEx4?=
 =?utf-8?Q?qc1WCeH86wryxoNEJRYCuFU8r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C224B78A40C0BD4DB2A8311614FCF801@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a9cf3e-0742-435c-3482-08ddfa0c0961
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 19:12:56.0130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NNmf59mtJn8zQo2qCfEB8DYUts4U8GeLUyXWbQOMGVo63Lc3Bo4JYlNCQQG6P/ny1RZqarORQTu63ntJVMbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
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

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDIxOjMwICsxMDAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+ICsNCj4gK8KgwqDCoCAvLy8gQ2hlY2sgaWYgdGhlIFJJU0MtViBjb3JlIGlzIGFjdGl2ZS4N
Cj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDCoCAvLy8gUmV0dXJucyBgdHJ1ZWAgaWYgdGhlIFJJU0Mt
ViBjb3JlIGlzIGFjdGl2ZSwgYGZhbHNlYCBvdGhlcndpc2UuDQo+ICvCoMKgwqAgI1tleHBlY3Qo
dW51c2VkKV0NCj4gK8KgwqDCoCBwdWIoY3JhdGUpIGZuIGlzX3Jpc2N2X2FjdGl2ZSgmc2VsZiwg
YmFyOiAmQmFyMCkgLT4gUmVzdWx0PGJvb2w+IHsNCj4gK8KgwqDCoMKgwqDCoMKgIGxldCBjcHVj
dGwgPSByZWdzOjpOVl9QUklTQ1ZfUklTQ1ZfQ1BVQ1RMOjpyZWFkKGJhciwgJkU6OklEKTsNCj4g
K8KgwqDCoMKgwqDCoMKgIE9rKGNwdWN0bC5hY3RpdmVfc3RhdCgpKQ0KPiArwqDCoMKgIH0NCg0K
VGhpcyBzaG91bGQgYmUgcGFydCBvZiB0aGUgSEFMLCBiZWNhdXNlIGEgZGlmZmVyZW50IHJlZ2lz
dGVyIGlzIHVzZWQgb24gVHVyaW5nLg0KDQpZb3UgY2FuIGxlYXZlIGl0IGhlcmUgaWYgeW91IHdh
bnQsIGFuZCBJJ2xsIG1vdmUgaW50byBhIEhBTCB3aGVuIEkgcG9zdCBUdXJpbmcgc3VwcG9ydC4g
IFlvdXINCmNob2ljZS4NCg==
