Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF931343AE1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 08:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E6189E2A;
	Mon, 22 Mar 2021 07:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF3E89E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np9OgNpo+wB0bbCA6C+xBlRsGgDB8CRKP9LqjSKmmuAmPFHMb5fRLkYq8Pob34QugaFOPOySPHqjsvFWfMNzk9JRPSLsUCZR2Ra10bqWvrvsPZgVOKBYlHROkWWicNQhIP5yipwkpY4us6iQxr9/OkxLma4PVpAEljtKSqXxmQEAIbAgI5lNS89Gki3ziaRpObmw1cnZgDOHwV+xBbkAKey1KhHHD1bk0haj0A9v0R2nRZkWB545niuheRyCSmtiJ6md+8HgFfki4Njv+aUzP65Vs0ELgAtZdihVb11jnhYj9D/JmnImA6I6g54gvOTVIwbLdeIcvJDCnlCF1iZtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2/XlEC8HKFSARSgLacW0LK2SGE785lVBTxU3wDC2Yo=;
 b=Yjk/MR+I561Xgg7xKjvIMYR0OYa5Xgk3XLtvedfb3JoKSj24p7pNDKeiUwtWg5Uuq6lpmwTFT8sr7Uw66yvaEb7EZ36lkDu+8tA0VhHyEhG9GjkHNl2I8MsYySxLh4c9xvu+DhGVhjOPkPr1gJ5stFYF16TYs1tnsCRug1GyRHGVMREHHOZuqVhH0Y1alGi+afLNQy9/7NpmeVUBOSs8jZ3Ex081iqAW2I2n+Xpi8MmVEpI8GyyW+RDdNU5YNx2k9pbdhX2AJz1+F+ypcq3USO/OOKal2VcNxVJIP/wyfmMvxc/CNs8OF4mk/ODXowZ5u8q7xr80VKeUCuFH5BbJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2/XlEC8HKFSARSgLacW0LK2SGE785lVBTxU3wDC2Yo=;
 b=kbuktm/wq0QNcDC2GPgQT/XCltHLBNLFtbBQ+GoS+aZA2MU424vpGcnENb7AyoE1PZ1oYVPtq6D0JzS+/Z+VSq6P9qyNJ5wSV5+rldGvPL4HdDrFjGmDFhGgI9wvHWTUNRhJfR+hfupplXzLcLMn/CZbDPtPkycoH3Io0pqNjUM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4782.namprd12.prod.outlook.com (2603:10b6:208:a3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 07:47:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 07:47:57 +0000
Subject: Re: [RFC PATCH 2/2] mm,drm/ttm: Use VM_PFNMAP for TTM vmas
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-3-thomas_os@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d49fad17-f515-d4f2-cef2-4108c8375747@amd.com>
Date: Mon, 22 Mar 2021 08:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210321184529.59006-3-thomas_os@shipmail.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
X-ClientProxiedBy: AM4PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:205:1::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
 (2a02:908:1252:fb60:e345:6f8e:fa4b:2c52) by
 AM4PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:205:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 07:47:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7e13fc3-fa3f-4432-c0b5-08d8ed06cec5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4782:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4782D56B30DD233D7F2F6FF883659@MN2PR12MB4782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BN7a4MPcUYURNHQGCs+JmUKp7/MfN5OuBV1JmnJx+aC7iQbTMmi+bPlkryDeNylBmQDHJKpPVq8uoL+o6wInCtTcamo7q24waw4RFTZrBzsm9axb963dD8E8L+oJDcNIouT2WRE7ydPw0rXEklSLy7oe90p2hNxPWCuCIMoHYbJ3wWP9zNRu/f3khfGbcyDfbRn1+DWQ37wsfxUCZA7KXAjo0ExYwyPzm2Zt0Dnz4DMhlcxktOtRUBqchInPVdA/3obp7O+EJecGMQnS3Be3aKMpDDIkr4/GIJL+pYGtPeAqbrD7TiFBBNonT3JpU68AwjQatDkchjsrCu9fDZ9rPfDY47m1GTw0fHq0Rrw4H5rllrIeZWZLBUZTZqDXfc7pdGswm5S7qAOWPraPPWt4frSUjN+Lut7PVmV83hIo8EYroQa01EoePYweCwV+Ek17BsTMtdwM414bE6P7tcA1YBHUXkVNVv4eRltQUdqAA4+epdoS00xUam2kerFJfFC8yxDxE13s3PUwm4NQp64JUxplc2XC5j5wPz738Kf7kVP7u2JknL8l6ZyWCW2KGWPVY85Exui73SwPg8B57N2i/sOtpvZuxx/Q1ndXd19ZgAa6ugtNlwDzPK6w6PnNUEV2EcWGKXYtNur+xEzPYmf92uLhtepiwVkUzosJKAHaPuqu8actNDrksblvgtFPPSdV9XHYcgSBub3pXhzyLLiPM4eTs9NHUOio8hPmxXbWd2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(6486002)(2906002)(16526019)(186003)(6666004)(66556008)(86362001)(52116002)(5660300002)(4326008)(54906003)(66574015)(2616005)(316002)(8936002)(31686004)(31696002)(36756003)(38100700001)(66946007)(478600001)(66476007)(83380400001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjJMN0pYNzc1aExteVFSSUVUQktiTkc2Ty91bCtTUVFUSXFrYWZvTHBKMngz?=
 =?utf-8?B?OHkyZlFRaXBGTUd2aFY1MW1xRlR1aEtNRlBSeUpOd3BYYmRrc1kxUk1vcGJW?=
 =?utf-8?B?TlJEbCtVdWhFT253ZGNGa3d0L0dTL3luNC8rbkZ2cXo3VkcrL0d3eENUMVY4?=
 =?utf-8?B?SGtLMVM0T3NwWVZ5RGhuRytLT1ZCNXpJa0RTTi96L1k1MUdZS3JCbUMzeWdV?=
 =?utf-8?B?dmdxNU1LQ1RPRlBORWhUSXQxU2xnUTlGQUtQMTlJZCtWMXJrK0FnNUs5M2dV?=
 =?utf-8?B?YkpvVHkwb29uL1RDRWxSb0IrS25PUWtwS1dUbGgvajBwRkRCY3ZXMFlyKzE4?=
 =?utf-8?B?LytlcHduTkFiY0VYUmRXYVNIV2hDQVFVNHlORTRZRkVZZEpwcG5ZZXlBbGNv?=
 =?utf-8?B?RzlKZW9BaFNyTjUzY2IxbS9ablJqSGFZNDVGc0g2dVQ3QWpmSWtJb21Salh6?=
 =?utf-8?B?eDY4SDVyZHZOKy9SeDJnMXZwMHVkdURkSTJMbjNtdjhVNTdpbTEwRWlBc3NL?=
 =?utf-8?B?eDZuS2tVU2Z2VUl2TzNLZVl2QWFuc0xzSXhFYjdqS1lyYkw4Z3RTUkVGMXdQ?=
 =?utf-8?B?dzdZT3NsZUxQdlhyZXQ3VkUyNHZPbDQwYnlZZXpSbjZwcXJMeVNjTlhIeUc1?=
 =?utf-8?B?WEhsSEw3K2g5M2NYRDVNYXBkT1RIVHgxTm0rYVJKMnlsZjkwZVhmeldpb1lE?=
 =?utf-8?B?UlRSNFV0RGsrTS9ZSEw2VFZ3alc5bW11QThUN1puOFg2dS9nMW9EdTY2OFpj?=
 =?utf-8?B?YjlIdEZuU29rcDl5d1M4aTJqVWJNdVlZRHhCNTJiNGRXZjA2VXp2MkdEZkVE?=
 =?utf-8?B?c2xtVTZndy9HMFNoOEtNTkZvb3NlQkUrc0dqODBTZ1hOWng2cDRaaDloMVJO?=
 =?utf-8?B?QmZadVJYVlBGb1Y2dlZUYlNmTmgzOGdob3h2SHFvTVk0SE5tZHFsZitVWk1l?=
 =?utf-8?B?SDRQT0haNVRicE9yT3ZReUtSSExGWHNrek9aODJpeTZDc2lxTEs2Nmw5MGlm?=
 =?utf-8?B?emx6bmxqaitjZERMWG1EVHR4K1dqYkNZVXZ1L3RPYWlFckczMUEvUlYvOHU5?=
 =?utf-8?B?NHF4cVo5aUkyMGJFSmlpeHRtb0xKTTBDT2pOcUxrT2NYQmQ2dUhma0d1VHJM?=
 =?utf-8?B?TE55eElxd29taitFMXE2SCtHSWZidDcxSWJ5amQ2WHZZNnRyQllCMVU2aXBs?=
 =?utf-8?B?K2hsQTZ4QUkzUldwSkhiMUh0cFBCOFRJUjBCUzZKWlB2YnlUNDYxcWh4RHp5?=
 =?utf-8?B?dmtOT0xpMXFVMVJKclFkbHBhWDNHUTJGUEZ4bGozVGdGOGhqT0RvbXBDOVpp?=
 =?utf-8?B?cVFITmEzMTJGOWtpYnZ4VHMrSElxOUo4SWhaV2FhWE00Q1IvZGFKT2hGaTRE?=
 =?utf-8?B?ckJUeFpMZ3pYOWFpcHpteEpJeUJwemFaUm41bXNTQVEvaFZtM1lCSWZPd3JE?=
 =?utf-8?B?UUxwRHo5dFhrT09FaFAwMjBwRHZvY2hFdGNGOS9SalNKVWhMRFJ2YW5pRHdp?=
 =?utf-8?B?Tmk5Mk0vUExVNjBFaWN2ZE1SeUdmQjBTb2VuVHNjeHNrTWZtWjNpbzkwZmli?=
 =?utf-8?B?THZ3N2pmbzZtYnVGQkFLMVh6RUd0R2pvbHRLQlB4S1E3a0JEY3daaTdCdktS?=
 =?utf-8?B?aDNxS2ppWEJoRFZpYUN6WEltcW95aUVtVnhITzhQanNBSGNvUnpVNU9aY2dl?=
 =?utf-8?B?dXpRMm1TYkp6LzBqK2RjTTZwMjNsYnErQU5kRUc3UlpxdDRRWWJsRlduZmRU?=
 =?utf-8?B?Z3hLUWZLWGgxQlMrSDc5ZnVOQWoxeWxUaDZCOU9DaG5sOThWeHNwTnFsTi9P?=
 =?utf-8?B?V0ordlREbmh1b1JFNXpOeWtaMTRnWmY0aGs5WjZKTnNsbUh0UkppY0g2cG5y?=
 =?utf-8?Q?zJ4usjshRj7lD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e13fc3-fa3f-4432-c0b5-08d8ed06cec5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 07:47:57.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbKgCOKgpwovKhgPbUa06LwAC6h2AWzy0dVEYs7KKdFkyggI0j+cO3pYm/ooCBKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4782
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDMuMjEgdW0gMTk6NDUgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
IFRvIGJsb2NrIGZhc3QgZ3VwIHdlIG5lZWQgdG8gbWFrZSBzdXJlIFRUTSBwdGVzIGFyZSBhbHdh
eXMgc3BlY2lhbC4KPiBXaXRoIE1JWEVETUFQIHdlLCBvbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG9u
J3Qgc3VwcG9ydCBwdGVfc3BlY2lhbCwKPiBpbnNlcnQgbm9ybWFsIHB0ZXMsIGJ1dCBPVE9IIG9u
IHRob3NlIGFyY2hpdGVjdHVyZXMsIGZhc3QgaXMgbm90Cj4gc3VwcG9ydGVkLgo+IEF0IHRoZSBz
YW1lIHRpbWUsIHRoZSBmdW5jdGlvbiBkb2N1bWVudGF0aW9uIHRvIHZtX25vcm1hbF9wYWdlKCkg
c3VnZ2VzdHMKPiB0aGF0IHB0ZXMgcG9pbnRpbmcgdG8gc3lzdGVtIG1lbW9yeSBwYWdlcyBvZiBN
SVhFRE1BUCB2bWFzIGFyZSBhbHdheXMKPiBub3JtYWwsIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSBj
b25zaXN0ZW50IHdpdGggd2hhdCdzIGltcGxlbWVudGVkIGluCj4gdm1mX2luc2VydF9taXhlZCgp
LiBJJ20gdGh1cyBub3QgZW50aXJlbHkgc3VyZSB0aGlzIHBhdGNoIGlzIGFjdHVhbGx5Cj4gbmVl
ZGVkLgo+Cj4gQnV0IHRvIG1ha2Ugc3VyZSBhbmQgdG8gYXZvaWQgYWxzbyBub3JtYWwgKG5vbi1m
YXN0KSBndXAsIG1ha2UgYWxsCj4gVFRNIHZtYXMgUEZOTUFQLiBXaXRoIFBGTk1BUCB3ZSBjYW4n
dCBhbGxvdyBDT1cgbWFwcGluZ3MKPiBhbnltb3JlIHNvIG1ha2UgaXNfY293X21hcHBpbmcoKSBh
dmFpbGFibGUgYW5kIHVzZSBpdCB0byByZWplY3QKPiBDT1cgbWFwcGlncyBhdCBtbWFwIHRpbWUu
CgpJIHdvdWxkIHNlcGFyYXRlIHRoZSBkaXNhbGxvd2luZyBvZiBDT1cgbWFwcGluZyBmcm9tIHRo
ZSBQRk4gY2hhbmdlLiBJJ20gCnByZXR0eSBzdXJlIHRoYXQgQ09XIG1hcHBpbmdzIG5ldmVyIHdv
cmtlZCBvbiBUVE0gQk9zIGluIHRoZSBmaXJzdCBwbGFjZS4KCkJ1dCBlaXRoZXIgd2F5IHRoaXMg
cGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgCjxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4gVGhlcmUgd2FzIHByZXZpb3VzbHkg
YSBjb21tZW50IGluIHRoZSBjb2RlIHRoYXQgV0MgbWFwcGluZ3MgdG9nZXRoZXIKPiB3aXRoIHg4
NiBQQVQgKyBQRk5NQVAgd2FzIGJhZCBmb3IgcGVyZm9ybWFuY2UuIEhvd2V2ZXIgZnJvbSBsb29r
aW5nIGF0Cj4gdm1mX2luc2VydF9taXhlZCgpIGl0IGxvb2tzIGxpa2UgaW4gdGhlIGN1cnJlbnQg
Y29kZSBQRk5NQVAgYW5kIE1JWEVETUFQCj4gYXJlIGhhbmRsZWQgdGhlIHNhbWUgZm9yIGFyY2hp
dGVjdHVyZXMgdGhhdCBzdXBwb3J0IHB0ZV9zcGVjaWFsLiBUaGlzCj4gbWVhbnMgdGhlcmUgc2hv
dWxkIG5vdCBiZSBhIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgYW55bW9yZSwgYnV0IHRoaXMKPiBu
ZWVkcyB0byBiZSB2ZXJpZmllZC4KPgo+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Budmlk
aWEuY29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9y
Zz4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAyMiArKysrKysr
Ky0tLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgIHwgIDUg
KysrKysKPiAgIG1tL2ludGVybmFsLmggICAgICAgICAgICAgICAgICAgfCAgNSAtLS0tLQo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYwo+IGluZGV4IDFjMzQ5ODM0ODBlNS4uNzA4YzZmYjliZTgxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gQEAgLTM3MiwxMiArMzcyLDcgQEAgdm1fZmF1
bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gICAJ
CSAqIGF0IGFyYml0cmFyeSB0aW1lcyB3aGlsZSB0aGUgZGF0YSBpcyBtbWFwJ2VkLgo+ICAgCQkg
KiBTZWUgdm1mX2luc2VydF9taXhlZF9wcm90KCkgZm9yIGEgZGlzY3Vzc2lvbi4KPiAgIAkJICov
Cj4gLQkJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9NSVhFRE1BUCkKPiAtCQkJcmV0ID0gdm1mX2lu
c2VydF9taXhlZF9wcm90KHZtYSwgYWRkcmVzcywKPiAtCQkJCQkJICAgIF9fcGZuX3RvX3Bmbl90
KHBmbiwgUEZOX0RFViksCj4gLQkJCQkJCSAgICBwcm90KTsKPiAtCQllbHNlCj4gLQkJCXJldCA9
IHZtZl9pbnNlcnRfcGZuX3Byb3Qodm1hLCBhZGRyZXNzLCBwZm4sIHByb3QpOwo+ICsJCXJldCA9
IHZtZl9pbnNlcnRfcGZuX3Byb3Qodm1hLCBhZGRyZXNzLCBwZm4sIHByb3QpOwo+ICAgCj4gICAJ
CS8qIE5ldmVyIGVycm9yIG9uIHByZWZhdWx0ZWQgUFRFcyAqLwo+ICAgCQlpZiAodW5saWtlbHko
KHJldCAmIFZNX0ZBVUxUX0VSUk9SKSkpIHsKPiBAQCAtNTU1LDE4ICs1NTAsMTQgQEAgc3RhdGlj
IHZvaWQgdHRtX2JvX21tYXBfdm1hX3NldHVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IHN0cnVjdCB2bV9hcmVhX3MKPiAgIAkgKiBOb3RlOiBXZSdyZSB0cmFuc2ZlcnJpbmcgdGhlIGJv
IHJlZmVyZW5jZSB0bwo+ICAgCSAqIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIGhlcmUuCj4gICAJICov
Cj4gLQo+ICAgCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87Cj4gICAKPiAgIAkvKgo+IC0JICog
V2UnZCBsaWtlIHRvIHVzZSBWTV9QRk5NQVAgb24gc2hhcmVkIG1hcHBpbmdzLCB3aGVyZQo+IC0J
ICogKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpICE9IDAsIGZvciBwZXJmb3JtYW5jZSByZWFz
b25zLAo+IC0JICogYnV0IGZvciBzb21lIHJlYXNvbiBWTV9QRk5NQVAgKyB4ODYgUEFUICsgd3Jp
dGUtY29tYmluZSBpcyB2ZXJ5Cj4gLQkgKiBiYWQgZm9yIHBlcmZvcm1hbmNlLiBVbnRpbCB0aGF0
IGhhcyBiZWVuIHNvcnRlZCBvdXQsIHVzZQo+IC0JICogVk1fTUlYRURNQVAgb24gYWxsIG1hcHBp
bmdzLiBTZWUgZnJlZWRlc2t0b3Aub3JnIGJ1ZyAjNzU3MTkKPiArCSAqIFBGTk1BUCBmb3JjZXMg
dXMgdG8gYmxvY2sgQ09XIG1hcHBpbmdzIGluIG1tYXAoKSwKPiArCSAqIGFuZCB3aXRoIE1JWEVE
TUFQIHdlIHdvdWxkIGluY29ycmVjdGx5IGFsbG93IGZhc3QgZ3VwCj4gKwkgKiBvbiBUVE0gbWVt
b3J5IG9uIGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndCBoYXZlIHB0ZV9zcGVjaWFsLgo+ICAgCSAq
Lwo+IC0Jdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsKPiAtCXZtYS0+dm1fZmxhZ3MgfD0g
Vk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7Cj4gKwl2bWEtPnZtX2ZsYWdzIHw9
IFZNX1BGTk1BUCB8IFZNX0lPIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOwo+ICAgfQo+
ICAgCj4gICBpbnQgdHRtX2JvX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLAo+IEBAIC01NzksNiArNTcwLDkgQEAgaW50IHR0bV9ib19tbWFwKHN0cnVj
dCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgIAlpZiAodW5saWtl
bHkodm1hLT52bV9wZ29mZiA8IERSTV9GSUxFX1BBR0VfT0ZGU0VUX1NUQVJUKSkKPiAgIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gICAKPiArCWlmICh1bmxpa2VseShpc19jb3dfbWFwcGluZyh2bWEtPnZt
X2ZsYWdzKSkpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCWJvID0gdHRtX2JvX3ZtX2xv
b2t1cChiZGV2LCB2bWEtPnZtX3Bnb2ZmLCB2bWFfcGFnZXModm1hKSk7Cj4gICAJaWYgKHVubGlr
ZWx5KCFibykpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCA3N2U2NGUzZWFjODAuLmM2ZWJm
N2Y5ZGRiYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRl
L2xpbnV4L21tLmgKPiBAQCAtNjg2LDYgKzY4NiwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdm1h
X2lzX2FjY2Vzc2libGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAJcmV0dXJuIHZt
YS0+dm1fZmxhZ3MgJiBWTV9BQ0NFU1NfRkxBR1M7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlubGlu
ZSBib29sIGlzX2Nvd19tYXBwaW5nKHZtX2ZsYWdzX3QgZmxhZ3MpCj4gK3sKPiArCXJldHVybiAo
ZmxhZ3MgJiAoVk1fU0hBUkVEIHwgVk1fTUFZV1JJVEUpKSA9PSBWTV9NQVlXUklURTsKPiArfQo+
ICsKPiAgICNpZmRlZiBDT05GSUdfU0hNRU0KPiAgIC8qCj4gICAgKiBUaGUgdm1hX2lzX3NobWVt
IGlzIG5vdCBpbmxpbmUgYmVjYXVzZSBpdCBpcyB1c2VkIG9ubHkgYnkgc2xvdwo+IGRpZmYgLS1n
aXQgYS9tbS9pbnRlcm5hbC5oIGIvbW0vaW50ZXJuYWwuaAo+IGluZGV4IDk5MDI2NDhmMjIwNi4u
MTQzMmZlZWM2MmRmIDEwMDY0NAo+IC0tLSBhL21tL2ludGVybmFsLmgKPiArKysgYi9tbS9pbnRl
cm5hbC5oCj4gQEAgLTI5NiwxMSArMjk2LDYgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQg
YnVkZHlfb3JkZXIoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICAgKi8KPiAgICNkZWZpbmUgYnVkZHlf
b3JkZXJfdW5zYWZlKHBhZ2UpCVJFQURfT05DRShwYWdlX3ByaXZhdGUocGFnZSkpCj4gICAKPiAt
c3RhdGljIGlubGluZSBib29sIGlzX2Nvd19tYXBwaW5nKHZtX2ZsYWdzX3QgZmxhZ3MpCj4gLXsK
PiAtCXJldHVybiAoZmxhZ3MgJiAoVk1fU0hBUkVEIHwgVk1fTUFZV1JJVEUpKSA9PSBWTV9NQVlX
UklURTsKPiAtfQo+IC0KPiAgIC8qCj4gICAgKiBUaGVzZSB0aHJlZSBoZWxwZXJzIGNsYXNzaWZp
ZXMgVk1BcyBmb3IgdmlydHVhbCBtZW1vcnkgYWNjb3VudGluZy4KPiAgICAqLwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
