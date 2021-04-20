Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A7365346
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF756E0E5;
	Tue, 20 Apr 2021 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDC36E0E5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qhejzx7hDOly/kpb6vIDI3+tNsKgl1ffSqCE90w0l4R1jyLyPq/lC9McyuxGRZ6l9ONC9GmaaU3caeFqnYN+Fg/VRtcD/znKjr2WTDlZAfUAriGTYQ1mK9HRJhuT+R7GeB6qD4l2XCmf16Wgnh/1HPwOjPjytVsrUahGT1vbr2419PjS9prdjiZwT/TSJnIMic7tZFyG92vkWcLwZjrB/NMFaVsw7rzS+CYf+q4oTDA6Rl/9AoEKZJNOACN8eiJywIRvhNF2+lKT5aENDRHu6LnsmRLv+UVvB96Sw9Tm3cfx7xQC+6nSQhHNLoID6pMlpK7Lm+sT3Q7TLrvj22jumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZsESb2eMux0sSe6qh0StSo8QVUUt1tyqnlPvEKwHgQ=;
 b=h7PLXzo76Nkr7bhcOG3aSkZXCcAPJIvPbEIRZMM8jxSdW+dEoILDNOMb7782y8WfWJQC5NEPkoGaBwRLHiD/AlpyiVaWIIth63kqWjc5Jgg91iQf8+jEnFYHtFHiqox5IcTjTUkWIC1ei8mNNl/EDFsxZqKHlM1NQ/+s17+4mfWiwcsKzTroF0SWRCZvlAJw5jXOCk51rqjENYP1Fp4hkPmUPZ+nJ8syeQDm2GmrjXKrenlh+1jJKmDR5bw46yUy2oaC5eRLrSSdap83Xw2yQpXWwJ5eUw9d+qmvT1SwshANPl1F5BqAnl4kFH5UepjH6uNl5jodmj22fIQI8eqqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZsESb2eMux0sSe6qh0StSo8QVUUt1tyqnlPvEKwHgQ=;
 b=P/q9qmk21ob6V2QCbtvHKqzWSVNbGRcqdpMWbd2YDXVYyE2m+4xUN/c4bFAbM7TBERIVGrnXExUszkYZjOL8sFm8oZ8bgM+WAgBAY/t/3N3ZkHNwKKRJfs664IlQ8Brj6JTBJTuQG/4HgxvpCNziwNfotk1kmEg3+1NQsYlS5xg=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 07:32:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 07:32:23 +0000
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Michal Hocko <mhocko@suse.com>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
 <YH59E15ztpTTUKqS@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
Date: Tue, 20 Apr 2021 09:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YH59E15ztpTTUKqS@dhcp22.suse.cz>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3caf:a441:2498:1468]
X-ClientProxiedBy: AM4PR0302CA0001.eurprd03.prod.outlook.com
 (2603:10a6:205:2::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3caf:a441:2498:1468]
 (2a02:908:1252:fb60:3caf:a441:2498:1468) by
 AM4PR0302CA0001.eurprd03.prod.outlook.com (2603:10a6:205:2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 07:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2231e9-1f8d-44bc-650e-08d903ce7084
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42555E8169BA6DEBFFDCC81083489@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3znJ3dWKhmfwBnbI44s0EoT5YKSiIVsofIhTvlPhFGk0pFtkrANfLF0EcfWLmFCaOEDXYNoVMsn6onhxCDAMrZgWDIf5PIQJn/OCoEihPe1l9wUMibvzmSVTDDG8i0xGzDTABvwzVPLBZvo/nu1mEXZGVxb/KMdX9GskeTbxHAOKzzP2XO/EOjgVefmvEndIOOc/D1WLY5KKDD0/BGBbxLN4fIrjz02mBN4g06o3O30JXJLnRaJbZEWyhXszUG/ONCctY9Wp/Z3R72n5KoXw6qsK7uJVVABsyxQVRoCDmJCuDThWoTm6sgmoH1Rmdfs47O+bj4RXEQEAHiZJnZmaI6b/slHAPavqh6G9xxPeh0U0QRLTLLiSnPKF8lgnSI2RbDvJ4BWR7LE1jijGTBQKbulVLqvJwLVjXfSxdxNTUyEpFqUTIYWtdESMKslXLxyLwJi/pGT7s+MrY+HSAe+ZOWMnHPEUlF3mr7ph26/fztZzOEECZDPa9Vsg0d4w6OGKH94Ze/PwuYXo8bpyFo3FE+8Um9WDetiKNpfVH5X4HkRAzZ6CWaOX2Erap4yXLRIrkBkEjnnQLgzm7ktAml+rdTyCPfTbaAq11XTE3SaVeOhMyydzlDrqDNBEHPCwSqOoo6DKY1SD50IiF/9JQaGwIzOC8UbMAoVVdsiEtl/WWVzZkhIQy+YQb9IHnedNFAsm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66574015)(83380400001)(16526019)(6486002)(6666004)(52116002)(5660300002)(66946007)(2906002)(66476007)(66556008)(316002)(2616005)(38100700002)(31696002)(8676002)(7416002)(86362001)(36756003)(31686004)(8936002)(478600001)(186003)(6916009)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjNBYzRYQzNaZkF4bGdpSWVxQWJFNFpEUjBXcm9DVE9jTUZVS1VTaEFwMXli?=
 =?utf-8?B?TktpZFdWdmpOYTJwOUNTSXJubEdSODUzUGxBUGJhRC9ERVlSM0ZOYkpZcGJF?=
 =?utf-8?B?QkpUcGN1Tkg0M3dhRFAvblVwMHhQRVpDd1hNVlZCTm94cVYvN0tsMkpyTWdy?=
 =?utf-8?B?a2IvVTRzRTZONzdEeXlsaklNUTZuSlhQSWVIdTJUT29FNEZHNEZSOCthL3NR?=
 =?utf-8?B?SEJwZTNLVzZYVFJxLzQ4cGhVUU5CTC94KzhqUzhUdUtHeG1VNkdrclVnUk9x?=
 =?utf-8?B?akhGMWFRdmttbEdQaUxlYjFjVTZYVk8zRTNDZGF6NFZkTGdZNjR2SkN5Visy?=
 =?utf-8?B?UUsvRXNMTko0SHVWaVZPRWFPRVNYczNYMkcxTnJIUllTbjMwMjlRQ3RBMkIx?=
 =?utf-8?B?UHJacXFSODlXOWxGcDVKTnVIOG9nejNTWTIzOURNRjlieVFpelFLUWlPeFht?=
 =?utf-8?B?eUoyTEJaRjhmYSs5T3NIbEE2VTRDUzg0QTJqb1pFOWNPQ1I0eklXQnJGaVZE?=
 =?utf-8?B?cXZjWnBwb1VqR2NUS29kZmU3RDRuRFE2QVhKTGJCSE95bWlleEdPL0dOTEZK?=
 =?utf-8?B?VEJYVkNDSEtOdVhMVWxJQlh3U2RhY29lRmczMVdzWGgwYitYOUxMa011aVhC?=
 =?utf-8?B?WWxtcmhCVVozRVZBZFhIMHdQVVlyZFpURndNV21SQ2E0QldPMkI5UUU2MGNw?=
 =?utf-8?B?L3cxSGtRd2x1bnR5aXEzUzBMWEd4S3haUFRlZzNvbmdtcTFucDYxWi94S1hD?=
 =?utf-8?B?dHQvQXRmQVFVZ1QwblFRakhET2pOSUozUGFsUS9VSG8xU2ZYNEhyVm51QUZH?=
 =?utf-8?B?THJDZFVLTUJYTVkvK2pKVHlTQzlzVlJzWU0xUHNWSmU4bE1ON1JnQVFVUzBr?=
 =?utf-8?B?SStNR1lCS2VpTXVLRWxPU3NPVjFoMWxtL1lPV0UvNFhKeDZGRkxEcE5mVFdo?=
 =?utf-8?B?eEVTZWRmUlk4SWNLQTd0MTRXNDZQQkljdmxQQkZLM2xCTE1kdEc5VTNRWElG?=
 =?utf-8?B?N0hTS2FjVzZtOWpqa0xScVVsTU1qaWRJYVZjR2pqSzVMK1YwNGtvYk5oQnIx?=
 =?utf-8?B?eW1XZXViektwRXRFVTJVNEZGZ1pHM3k4Yml6SU45dFc1WmwvUzdvUjQ0VmFY?=
 =?utf-8?B?NC82MURKcU1oNXFlMzVKM05kbWM3VmhacHpHcW5XeDBQVGRwdVgzdWhGd2Jt?=
 =?utf-8?B?bkdvRjQ3c0Uydi9tbGtFa0xBODdSREkwU2tWZC9WSHpxdjlDRU1vMlh3dXlX?=
 =?utf-8?B?QzNQQ25PWlNPYjhQRVFsMk9lMTJzYVNhMXJVSStQV3JheUlrZ3BhQ2FycWMz?=
 =?utf-8?B?YXB2RlRQRFVHMGhWekc3THAwRmVTRzFhQSt5bWxJVXpyUGhsc0ZtVkVNZkx5?=
 =?utf-8?B?MzM1SFJydE9mOHZ6RWtNNFdjTEFVS2pmcTRRMU1iTWw3UXFuZlIwQldrZFV0?=
 =?utf-8?B?M0FsUmJNeHBseWtHaUxNMFA1QlAzenhaazhieUYyZWQvTjRDL01nbU9tcEcr?=
 =?utf-8?B?amhCeEM1RUN3Y0F1cy9vL0lhVVhTRVNwTzlnaFc3eThyM2RyVW10VG1ISksw?=
 =?utf-8?B?TDMzZk9JU29JcC9zSyttNzFGVmpmQTRadjkvWk1najFWRTJQZEZ0cUYwRDl3?=
 =?utf-8?B?ekNEZnNEekg1Wk1LUFpPNjg3ZWxUbkZCN3BSUkxWZWRFQ0xZQlI1NUJsamdF?=
 =?utf-8?B?UVg2TWROZHQwUENNdnNJZE8vay9hK1ZkSHhSTytub0d2ckRoa3BuYUh1TVJ0?=
 =?utf-8?B?OFRvN3lIR1RvUS82VjNpajRYb2NHaHo4dE1HaHg3UHZKWW8wYnlXNFFMZ0dX?=
 =?utf-8?B?M2FFSGRiZzNOenZjUXlVcmFQTjhhRTN5VU9hblJEOGkvUjNKcmRSWW9Eb0NO?=
 =?utf-8?Q?HXTTc/vfH/SbP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2231e9-1f8d-44bc-650e-08d903ce7084
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 07:32:23.7405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq9hJnHIiROV20zJDReXElaV1GwytiZAWbgc0IlYEcDHTdRhnMo0D6c05ldvCITS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Cc: willy@infradead.org, neilb@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter.Enderborg@sony.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDQuMjEgdW0gMDk6MDQgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gT24gTW9uIDE5LTA0
LTIxIDE4OjM3OjEzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAxOS4wNC4yMSB1bSAx
ODoxMSBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPiBbLi4uXQo+Pj4gVGhlIHF1ZXN0aW9uIGlzIG5v
dCB3aGV0aGVyIGl0IGlzIE5VTUEgYXdhcmUgYnV0IHdoZXRoZXIgaXQgaXMgdXNlZnVsIHRvCj4+
PiBrbm93IHBlci1udW1hIGRhdGEgZm9yIHRoZSBwdXJwb3NlIHRoZSBjb3VudGVyIGlzIHN1cHBv
c2VkIHRvIHNlcnZlLgo+PiBObywgbm90IGF0IGFsbC4gVGhlIHBhZ2VzIG9mIGEgc2luZ2xlIERN
QS1idWYgY291bGQgZXZlbiBiZSBmcm9tIGRpZmZlcmVudAo+PiBOVU1BIG5vZGVzIGlmIHRoZSBl
eHBvcnRpbmcgZHJpdmVyIGRlY2lkZXMgdGhhdCB0aGlzIGlzIHNvbWVob3cgdXNlZnVsLgo+IEFz
IHRoZSB1c2Ugb2YgdGhlIGNvdW50ZXIgaGFzbid0IGJlZW4gZXhwbGFpbmVkIHlldCBJIGNhbiBv
bmx5Cj4gc3BlY3VsYXRlLiBPbmUgdGhpbmcgdGhhdCBJIGNhbiBpbWFnaW5lIHRvIGJlIHVzZWZ1
bCBpcyB0byBmaWxsIGdhcHMgaW4KPiBvdXIgYWNjb3VudGluZy4gSXQgaXMgcXVpdGUgb2Z0ZW4g
dGhhdCB0aGUgbWVtcm95IGFjY291bnRlZCBpbgo+IC9wcm9jL21lbWluZm8gKG9yIG9vbSByZXBv
cnQpIGRvZXNuJ3QgYWRkIHVwIHRvIHRoZSBvdmVyYWxsIG1lbW9yeQo+IHVzYWdlLiBJbiBzb21l
IHdvcmtsb2FkcyB0aGUgd29ya2xvYWQgY2FuIGJlIGh1Z2UhIEluIG1hbnkgY2FzZXMgdGhlcmUK
PiBhcmUgb3RoZXIgbWVhbnMgdG8gZmluZCBvdXQgYWRkaXRpb25hbCBtZW1vcnkgYnkgYSBzdWJz
eXN0ZW0gc3BlY2lmaWMKPiBpbnRlcmZhY2VzIChlLmcuIG5ldHdvcmtpbmcgYnVmZmVycykuIEkg
ZG8gYXNzdW1lIHRoYXQgZG1hLWJ1ZiBpcyBqdXN0Cj4gb25lIG9mIHRob3NlIGFuZCB0aGUgY291
bnRlciBjYW4gZmlsbCB0aGUgc2FpZCBnYXAgYXQgbGVhc3QgcGFydGlhbGx5Cj4gZm9yIHNvbWUg
d29ya2xvYWRzLiBUaGF0IGlzIGRlZmluaXRlbHkgdXNlZnVsLgoKWWVzLCBjb21wbGV0ZWx5IGFn
cmVlLiBJJ20ganVzdCBub3QgMTAwJSBzdXJlIGlmIHRoZSBETUEtYnVmIGZyYW1ld29yayAKc2hv
dWxkIGFjY291bnQgZm9yIHRoYXQgb3IgdGhlIGluZGl2aWR1YWwgZHJpdmVycyBleHBvcnRpbmcg
RE1BLWJ1ZnMuCgpTZWUgYmVsb3cgZm9yIGEgZnVydGhlciBleHBsYW5hdGlvbi4KCj4gV2hhdCBJ
IGFtIHRyeWluZyB0byBicmluZyB1cCB3aXRoIE5VTUEgc2lkZSBpcyB0aGF0IHRoZSBzYW1lIHBy
b2JsZW0gY2FuCj4gaGFwcGVuIG9uIHBlci1ub2RlIGJhc2lzLiBMZXQncyBzYXkgdGhhdCBzb21l
IHVzZXIgY29uc3VtZXMgdW5leHBlY3RlZGx5Cj4gbGFyZ2UgYW1vdW50IG9mIGRtYS1idWYgb24g
YSBjZXJ0YWluIG5vZGUuIFRoaXMgY2FuIGxlYWQgdG8gb2JzZXJ2YWJsZQo+IHBlcmZvcm1hbmNl
IGltcGFjdCBvbiBhbnlib2R5IG9uIGFsbG9jYXRpbmcgZnJvbSB0aGF0IG5vZGUgYW5kIGV2ZW4K
PiB3b3JzZSBjYXVzZSBhbiBPT00gZm9yIG5vZGUgYm91bmQgY29uc3VtZXJzLiBIb3cgZG8gSSBm
aW5kIG91dCB0aGF0IGl0Cj4gd2FzIGRtYS1idWYgdGhhdCBoYXMgY2F1c2VkIHRoZSBwcm9ibGVt
PwoKWWVzLCB0aGF0IGlzIHRoZSBkaXJlY3Rpb24gbXkgdGhpbmtpbmcgZ29lcyBhcyB3ZWxsLCBi
dXQgYWxzbyBldmVuIGZ1cnRoZXIuCgpTZWUgRE1BLWJ1ZiBpcyBhbHNvIHVzZWQgdG8gc2hhcmUg
ZGV2aWNlIGxvY2FsIG1lbW9yeSBiZXR3ZWVuIHByb2Nlc3NlcyAKYXMgd2VsbC4gSW4gb3RoZXIg
d29yZHMgVlJBTSBvbiBncmFwaGljcyBoYXJkd2FyZS4KCk9uIG15IHRlc3Qgc3lzdGVtIGhlcmUg
SSBoYXZlIDMyR0Igb2Ygc3lzdGVtIG1lbW9yeSBhbmQgMTZHQiBvZiBWUkFNLiBJIApjYW4gdXNl
IERNQS1idWYgdG8gYWxsb2NhdGUgdGhhdCAxNkdCIG9mIFZSQU0gcXVpdGUgZWFzaWx5IHdoaWNo
IHRoZW4gCnNob3dzIHVwIHVuZGVyIC9wcm9jL21lbWluZm8gYXMgdXNlZCBtZW1vcnkuCgpCdXQg
dGhhdCBpc24ndCByZWFsbHkgc3lzdGVtIG1lbW9yeSBhdCBhbGwsIGl0J3MganVzdCBhbGxvY2F0
ZWQgZGV2aWNlIAptZW1vcnkuCgo+IFNlZSB3aGVyZSBJIGFtIGhlYWRpbmc/CgpZZWFoLCB0b3Rh
bGx5LiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgoKU3VnZ2VzdGlvbnMgaG93IHRvIGhh
bmRsZSB0aGF0PwoKUmVnYXJkcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
