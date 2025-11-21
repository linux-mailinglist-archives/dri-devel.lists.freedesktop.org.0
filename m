Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A5C7AFA4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3340810E8EA;
	Fri, 21 Nov 2025 17:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="tj4lxZ9B";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ha6EcwyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1229 seconds by postgrey-1.36 at gabe;
 Fri, 21 Nov 2025 17:04:53 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C1410E8EA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:04:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALFScwd2391104; Fri, 21 Nov 2025 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=Ij9kkj71O5/6oR4zgEDLU9jpL/BK5k7p+97CubanZvQ=; b=tj4
 lxZ9B4ubS/kZwC6gf6Q7TqFTvwZB/sRqXwwJ6zGcPGd5woK/AkAOjHRtjtiLf9Mt
 kfi3ngPJIriNIgYELcgcNVKmsnN+2I13AlS4XoEATt8rJFWkVSObe9yk+Bi0y9w1
 t/3PZmiCU/6tG8Rnmqmdby4C957FRUH17/qucPTSqpiVQqyIazqt4N3Ixe+/Bwqr
 90Ez5SxEPW29O7mqG+r5wlaoQTlKrtwmhmCd/Ke6luFugn6n0fS0W+6r6f4Kc7iS
 hAjRcONVYjpB8YJ1M596CnKe4mVAMyimxzio8OzUtOGH+SEfYyhhz81qdDzxgyEc
 3597xuFNAjlgKVFch9A==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021142.outbound.protection.outlook.com [52.101.95.142])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4ajejxgffk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 21 Nov 2025 16:43:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/jFc4ODN2/L3OKMHOV/D2/2rQ7B8HH4e3ElKmLuIt1NaNrD8I406riKsJj5Lf77s3+ScScqJ+O7+rNaBdkyQE9AuWk9CEFVn1hFm/xsTCz6783B7sAZdqTrjbWJF5eD2xcoJcgr41ge3GUQE2ykxftx7BWys40/pBuux/4lXKgqZ2EPZ3B4nd+36/h9bnERogwy6LIbUprUZMs3u0UP3/DDEblHkKSXpIH1MCW9Yu9RAzsYGEc31kmSu5eBGMM+H4ySGRMiqdFe+R8k1Gai+gEoxrHs7Of4NRZ6h0mYTtaHr8NnI8kr/PkUIPpGxUzjNHOymRKgrIrRY2edkAsy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij9kkj71O5/6oR4zgEDLU9jpL/BK5k7p+97CubanZvQ=;
 b=LVJWsUlphlm8+L1P4XhnhDjeuAFcAtX3VcpiQD84QpV6ckIshBrGYczepVzCeRuqfbPsKTeADwNq1cp8e4B/zxnfYyHgF1iKhvdnUf4Vlo/rPzQlqrOkoICmW+Y19QBMvnl/x7j9hSdudKukbFjKmp5+U5dm3d1A3K5giQvxSjXJOQV87Y7jKhwuQMmRsqw+rOFWSPz1/NZcIOenSHqCwEUNT6PUEgoO8Eafok8ueeXKZONjo7hS2ViwKPRk7W9rDcK0zVfZRdm8bLZhMEbJKOG0glA2KuHmDvXbJp3m7sfP+qyu0ARfoGrrnhushX8UCYIMHtjGipku/L4lqbpCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij9kkj71O5/6oR4zgEDLU9jpL/BK5k7p+97CubanZvQ=;
 b=Ha6EcwyAjHX7GDhX2S77VDJWYV1qtIVhu3HNdcoyl407k2lgZEWDhxM+h6E1rdyaFLsQBSUgQE5HJIhvpn/ejFj9DpIRhYCCugEIyKTgtziEQdyZ7DxQVoDbrSLHyfeDmUyvA+p3qUX/wO0TPTvnktX5HPC7VKUEBsC6g5+19Rs=
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::5)
 by CW1P265MB7481.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 16:43:57 +0000
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2]) by CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:43:57 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
Thread-Topic: [PATCH v2] drm/imagination: Document pvr_device.power member
Thread-Index: AQHcWvpp5DgtO03Fykm66H1RXPOJ07T9VhkA
Date: Fri, 21 Nov 2025 16:43:56 +0000
Message-ID: <ab6c81c2bb61dfd46bbc87b419c5555e6f34115d.camel@imgtec.com>
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5009:EE_|CW1P265MB7481:EE_
x-ms-office365-filtering-correlation-id: 4037296b-9821-4306-d585-08de291d2a1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MTlNNHJmK2Z0MmFMN1NYWVVNeW9iK1FLV3BtMjZESFF2RDJUdURlYWFVVG9Y?=
 =?utf-8?B?RXBJN0t0U0ZFMlZmR2I5M0hxaHpsalE5dE9KaFhTbDE0djZ0N2tBR0Fqa0Z2?=
 =?utf-8?B?YmtHSFZzSFRNMFc2REVzSW9qZCtRSTErd1hrdGtMTjJtRjVNcXdPWVV1RUZX?=
 =?utf-8?B?TXRJWnhoUTdyb3I5NGJWODQ4ZjBWdHZXT3hPRWhJdGs0UGN0MEtJTDFSTWI1?=
 =?utf-8?B?bm9LMEtxelNudU9VamxjN0hDNms2bi9ZU2EzK2t5djVZS3NaanVBZnJxOW40?=
 =?utf-8?B?V3BzVEc0QmhPVmo2L2I2a3dNeFBCQlBPY1NJdW83ekxWanVBY2hRVWdmM3B3?=
 =?utf-8?B?a2tkYjYvZ3F6cUEreEo3dStHODUrV0xTaFB3enFvZGZqanI4eGVqK3RYaFdt?=
 =?utf-8?B?M2ZCQk1HeSsyS3BkZWR4amdxR1I2NEFXRHdBNkc1cjQrM1Znbm9WV0N6d0Q3?=
 =?utf-8?B?YlhiS0FOV1hpVEFYcVdWQ1lhZnpUMThkUHJlcHBudHBKeEh2eEp4SzhYNXJC?=
 =?utf-8?B?M04vcjV0Z2VTcUM0VUw4U1FFbU9PYjFlYVBkdGk5VThyTUg4eldYbE5iMGMw?=
 =?utf-8?B?MmdCNXo4Umc0SkdIRGVYbjJqdjBvc2NBVmxnbTh6cHBFaUllcTlET2lIelZN?=
 =?utf-8?B?RE5BQkQ5RktNSlpsYk5PdzlBbGcwRHZFeU9TLzkzTU1UQ1BRNkljUHA4SXZM?=
 =?utf-8?B?YmVnOWpsT3VLWTVvZ0NENDhURnlpTi9ZYzJ0ekcrV2huMk9kV2h2MWtxTjA4?=
 =?utf-8?B?Q0RKaVYrMFA0MXljdW4zK2JiOEpCOUhwVnpuTTBoa1dzUFVNbDNuaXZSZW1V?=
 =?utf-8?B?cjh3UTlhYkUrOHBZTDZDdjVBYUhYY0EwN0krTHA3Y3hWbElhalR6eUZOeUFK?=
 =?utf-8?B?U3hOUkdtNVNBZHhQTlRLNVpOdVZuU2g1dU83V1hkVE5mY3VZOE95R0phM2p1?=
 =?utf-8?B?YnNzWkVRazZ1bWVSNzhUNVpUZU9NN0tTbmdFeFV1Q3ErajFaS0tILzJ0dHRF?=
 =?utf-8?B?YzQ4bXhLRVpTM0FYdjl0S2t3Vk51OE95VUlPV0I1MXFaR1ByY1pvYjA1OHlP?=
 =?utf-8?B?dWFiQ0NiZHcySkM3MWF3UEVGUWdCVGZLUkFGMmVDVEVpWGFjaXNsdStBZE1y?=
 =?utf-8?B?Qlg4a3VIK2hoTFAydjRQT3d4YmNtSHJtZnNjNmg0Kzk5cFZBMEhaQ0JXaGpj?=
 =?utf-8?B?NTZqazhvR29DZTdoOFRUYUNoK1g4Zy9iV2Njclo5Q1huZE5JeEVWRGpsSGdh?=
 =?utf-8?B?TDIyTjdKcndyd1FyQ0dNQVBBRDZvTW03NW5iWFdQZ3gvYXovckI4bys4VmdJ?=
 =?utf-8?B?TG9JK2twaE52N29sU3BSOXIrcmthbDhSa2hGL1gxTW94T3MySzMrY0xjRDBV?=
 =?utf-8?B?dWp3V2NtbzlKTXZTdXNadnNoMHdHVmM4eWRicFp2Sm5QenAwV2hTYSt6MEJ2?=
 =?utf-8?B?UHdHbGRoL1ZIL3c3T2hvYjBBbHJkZFRDQUE3dnN1VVRySFFxQ2xnVThyVEhn?=
 =?utf-8?B?dkZGZE1HMXJMek9VMjVHR1NTTm5kTzllM0xsSGh6WThadDFTOGRvRmoyeExi?=
 =?utf-8?B?aE5WK2llK1J1bFhNU2tTSXN2L0pia0J2bkZ5aUFEd25TUG13aXMwSUgwZE1N?=
 =?utf-8?B?eCtqVG5hQ3JIZXJpKzVIWHVwZEhPcTFHNHZ3aEk1RWtVaXIxVFFScmxhZGFV?=
 =?utf-8?B?UDY0V2tzMmRFa0RLNTBEVGgvWHVPV045MDhnTlBaTW1IczlLb3FUb3VLNldp?=
 =?utf-8?B?OTE0dCtRU1RqT2ZkZE41eUd3VjJkeFcxZDkva0dHNkhxTTdJTkRhZ3loK0Zi?=
 =?utf-8?B?b0YwY2dyQzBuYkdsY0ZBSkNCSUxaa00yM1dkbXVwRHFaVWU1azNaOXd3N25w?=
 =?utf-8?B?ai9OdXkzVmlEL1ZTTklLSXgxNWV1TE91d0Z3RlJlOGxJVG1kNTVTL3duWHhB?=
 =?utf-8?B?eCtKK2FHSGZaZTJFd0sxa3h6MFp6R043VGVuazhSUUlaTWhVQmhrbnd3RGtU?=
 =?utf-8?B?OW1zdWxOUUtUTTg3WUY5NDdacFMrcTVUTmNla3RibUMvQU9Jd0IwbndpTHJw?=
 =?utf-8?B?Q2RFTnJIK2x1MzVxWVljK2MvdnNzVDcvSnNGdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1JQbkVzYXRzaGFMMHcvTGhuYUhYbFhPUXlWOUk4TXBsQWNpVXJCMzZSUG96?=
 =?utf-8?B?a0pzeFBnZUdZdnBOaVlQbHdhUEdEcStaZk5SNTRpM3NWYzc5OUU1dWN4YkF2?=
 =?utf-8?B?a1hwMHF2ZnJkYWQ2VUJjZForTDdYRDhXcHpRNTlTM05OVTdPeUJFQWtUb0VK?=
 =?utf-8?B?UEpnSEI5VlErQXc1bSttN29aWGVlUVJZQ2lsUGV3eUdGaUtXTlI1SytOd2Rh?=
 =?utf-8?B?OEt1V0dkTkRDcE53REhJMHlKU0toVE83NFV0QUZ2OUgxK0lVTUhyc2lCWXpT?=
 =?utf-8?B?MWdvSEJDYWpyaEhaY0F0WU8yazBXaHQwZGxXcEFmbzNHQmpENkd4Tjk4RHRr?=
 =?utf-8?B?M3NvNTY2ak1QZEdpZjFZMXJuSVVzVFlmVTFvdVN6OU9vaEV1czJaQzdtZUdL?=
 =?utf-8?B?cTJuQ1JidExkQloxWm1HS3hHS2hCczJLNjlBTEc1OExENTdQRzNaSVg2SDh2?=
 =?utf-8?B?Nkp6bWcrYk50cGo4RkhNT3pNZnlxalpIWG0rT1hMSEVzZ0VycnUvSXV0Nmls?=
 =?utf-8?B?Rk9YRGdVT0xEcEhQOGtBT01HTk40ODg4L0hLemdhS1hBOTRXdEhvck9zQmFI?=
 =?utf-8?B?Nm9KSUUxNWw3MURXVmt3djl0K0oxMXM0OTZOUk5jWW0vMHRXVFEzV24zcmVz?=
 =?utf-8?B?Y2gwbmplcGtlYWxvYUtNRndtV3dvbXNSY0NMaER2anVZalluVnM3dW1rM0lv?=
 =?utf-8?B?bktxY0RaWVNwNXJIbzN5eHJoVHc2NjRjc3BrTGU0aWdXUHZzTVZRRlRTZVpF?=
 =?utf-8?B?anRTY1dhNkp5d2RlRXp0SjA0Z21mVGdVSTlhaVlLWnBrKzA4TmpieEhXZDRr?=
 =?utf-8?B?NWJwZTJINlUyRTJRSDdIbFUxY2hHRzhyOWNYM3ZBK2cwak1WV0NVcktacyt5?=
 =?utf-8?B?YW5vUDdabGRERWpVZDNqcGZReWp4TDhzanFYQmRSWmlhVXJOZEgyOXNCeFIx?=
 =?utf-8?B?L01hcjdJcVZhNTVhMGNHSHJjbmZDZWk5UlNia3pCemVJREg0ay81T2xJL3I3?=
 =?utf-8?B?aE52UUM1dzhqVlR2SElPcEJZWnFEbWZaTDNwYVdNYlo3WEVIR012UnhxZlVq?=
 =?utf-8?B?QjJRTXFmYjFCK050UmZYWm9QdXlFTzVoc2pJR2pnOU0vaG9FVlZkVU53MFpo?=
 =?utf-8?B?ZkgrSlRud2V0WEFRNHVTTzcwNE9CTTRrRGMwd21pajlVK0U4NWo4cjFLeHdk?=
 =?utf-8?B?YW14cjU1S2RwckJFV3cwclZKMFd5YXc0dHNaT0FpUExaaTdhZTBaNmpOYWhw?=
 =?utf-8?B?bW1sajJmaE1NM2w2RDNnNmhSUm5uTjFGTTFhdEtqNGwzcXY5WFA3cHFxUU1i?=
 =?utf-8?B?SzhYRXltNjhxQ2ZMYTBadzVEQ2xJWlhUR1pIWWtwbVhSQmdtRllGNkZOMXdy?=
 =?utf-8?B?UUVNL1QvVUoxZHNBS1hvcllXWUFwdWJmYVZnQnN3dU5GT1JDTGFIK2cyVFJK?=
 =?utf-8?B?TWVzZFNrN2VDbzQ2aktPdEk1RVB3NFA5cEllTzVjUnZNN2NsVjZ4dUQ3Rkpt?=
 =?utf-8?B?NXRDRk1VUXRUUkxkQTNYdnh2Yy8yQzZXd3VmMlg2SmgvVDBqVzdPS09iNzlI?=
 =?utf-8?B?d0hPckpNSjFaUERRNzZGU01XbVdrZjd6bXlsMGlMRVRaSEZxK1Jzb29SZURw?=
 =?utf-8?B?RC9LdFQ4cmhqSzFiMFMzc080bS9BeXlTL3R5bU5abm5zN0VQSWxvcmxkRVdj?=
 =?utf-8?B?aEtUclRheEUydXhMTitoZ3NMem5vb1pNeFdnbXlnSUQveUFsMkN4ZTRYTUlm?=
 =?utf-8?B?LzQyMmJPclhnUk04Q25mL3lWT1FFM2NkYUgrWER3N2FqYWMzWUcxSHkxODZS?=
 =?utf-8?B?UXVZaFBnSDh4dDhVL013cWtuZk96TFM3WUdtSllSUHhRVEltc2x1U2hGYlll?=
 =?utf-8?B?YjVwTTRFQWROYWlnVnJrMmFRakhYTHZaQVN0Ykg0eXRBVndnbThWOERDbXJJ?=
 =?utf-8?B?dW4xU3ptVjc1RUhvWUVxbUxXQ1NGQ3UvaUNrY2dHWXJLZENJRjZDc2RxbHNw?=
 =?utf-8?B?cERpRGtiTWRuZGJxdUVqS3VrbmU4d3lQUGlURWhUMEhYYndwZkRHVlBBRG5U?=
 =?utf-8?B?VXFDdWI5Wm1ObkpzQnc2R1JUcjlHVE9NMlg4VzhRdit0UjBMU1NQaEVTOHFo?=
 =?utf-8?B?b0VmNFhPREFOUVFWbzcyREpIOFpSK0tUc080cGZ5WXpJRnB1UGkyYWUxYkFl?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49FAB4E27AD9C94791B49268FFC1AA8E@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4037296b-9821-4306-d585-08de291d2a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 16:43:57.0445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0wXbjZJbP0hnQRvk8nNl8PMhW4WJyJdQIDf8PyM1672la5eMMR3eVkL5owhHNhZjdNxiLU+hhTGa97dXANTL6kUPUoAAWWFQsFAILo2jNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7481
X-Proofpoint-ORIG-GUID: zYIVptSlo7fm3LM7YtUe2sqeU7pJ-rBA
X-Proofpoint-GUID: zYIVptSlo7fm3LM7YtUe2sqeU7pJ-rBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfXwE2IS1yXktC4
 u53Gc4GOLSOhJkygYsmTbw8ogt6Nov8YqzDPmAyHNr2lGqh83phpckU+kvgdYWEALqhri1SgnGz
 18xMwzfBjPXFSwGEJR1JdWT7IQRm+Yu6QtNVIiLRVDc/eHsqjoWrY/3QkYXbJo+G4soOuuRAkHQ
 MhQupKn3pBHTeixRp6oDLnVWEnTtGDhBiejgN0a2k52uwjfKkohcJBquI+xy4OYaOlDeHZFoHG+
 rZz0mpbJXjvEgEJg8CM1KvuQ2hWBq/Q9Dr2w/e7DP9jRNv4pgGx4Gn7riU4NfqkZUnEk1bKTZYS
 vZsCgscDC2nleX+MLbAG4DPoOIj2XUooSD8Em2o1rGF1v29I20Ej2QUAi+9hNttlkq81b5Xd+PN
 CURWLUoFj5J3p02j6yMfguS8NF9qfA==
X-Authority-Analysis: v=2.4 cv=IqgTsb/g c=1 sm=1 tr=0 ts=692096cf cx=c_pps
 a=GwulDlvyJS+gHpL3b5V7Dg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=r_1tXGB3AAAA:8 a=u2DKL6YFAjTQyRFT7OQA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22 a=t8nPyN_e6usw4ciXM-Pk:22
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

T24gRnJpLCAyMDI1LTExLTIxIGF0IDE1OjIwICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
QXV0b21hdGVkIHRlc3RpbmcgY2F1Z2h0IHRoaXMgbWlzc2luZyBkb2MgY29tbWVudDsgYWRkIHNv
bWV0aGluZyBzdWl0YWJsZQ0KPiAoYW5kIHVzZWZ1bCkuDQo+IA0KPiBGaXhlczogMzMwZTc2ZDMx
Njk3ICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgcG93ZXIgZG9tYWluIGNvbnRyb2wiKQ0KPiBSZXBv
cnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTEwNjE1MjQ0OC40NTNiNTNhZEBjYW5i
LmF1dWcub3JnLmF1Lw0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IENvc3RlciA8bWF0dC5jb3N0ZXJA
aW1ndGVjLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFsZXNzaW8gQmVsbGUgPGFsZXNzaW8uYmVsbGVA
aW1ndGVjLmNvbT4NCg0KVGhhbmtzLA0KQWxlc3Npbw0KDQo+IC0tLQ0KPiBCYXNlZCBvbiB0aGUg
YnVpbGQgdGFyZ2V0IGluZGljYXRlZCBpbiB0aGUgcmVwb3J0LCBJIHRyaWVkIChhbmQgZmFpbGVk
KQ0KPiB0byByZXByb2R1Y2UgdGhlIHJlcG9ydGVkIHdhcm5pbmcgdXNpbmc6DQo+IA0KPiAgICBt
YWtlIFc9MSBodG1sZG9jcw0KPiANCj4gSSB3YXMsIGhvd2V2ZXIsIGFibGUgdG8gZ2V0IHRoZSBy
ZXBvcnRlZCB3YXJuaW5nIChhbmQgdmVyaWZ5IHRoYXQgdGhpcw0KPiBwYXRjaCBjbGVhcnMgaXQp
IHVzaW5nOg0KPiANCj4gICAgc2NyaXB0cy9rZXJuZWwtZG9jIC1ub25lIGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmgNCj4gDQo+IERvZXMgYW55b25lIGhhdmUgYW55IGlk
ZWFzIHdoeSBteSBpbnZvY2F0aW9uIG9mIGh0bWxkb2NzIGRpZG4ndCBzZWVtIHRvDQo+IGhhdmUg
dGhlIHNhbWUgZWZmZWN0PyBJcyBpdCBqdXN0IHNpbXBseSB0aGF0IHRoZSByZWxldmFudCBkb2Mg
Y29tbWVudA0KPiBpc24ndCBwdWxsZWQgaW50byBhbnkgb2YgdGhlIHJzdCBkb2NzOyBpbiB3aGlj
aCBjYXNlIGhvdyBkaWQgdGhlDQo+IGxpbnV4LW5leHQgYnVpbGQgY2F0Y2ggdGhpcyB3YXJuaW5n
Pw0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBBZGQgYSBwcm9wZXIgY29tbWl0IGRlc2NyaXB0
aW9uLg0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTExMDYt
ZGV2aWNlLXBvd2VyLWRvYy1maXgtdjEtMS03NmQ5ODQxYzgwODRAaW1ndGVjLmNvbQ0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmggfCA4ICsrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmgNCj4gaW5kZXggYWI4ZjU2YWUxNWRmLi5lYzUzZmYy
NzU1NDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2
aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuaA0K
PiBAQCAtMTQ2LDYgKzE0NiwxNCBAQCBzdHJ1Y3QgcHZyX2RldmljZSB7DQo+ICAJICovDQo+ICAJ
c3RydWN0IGNsayAqbWVtX2NsazsNCj4gIA0KPiArCS8qKg0KPiArCSAqIEBwb3dlcjogT3B0aW9u
YWwgcG93ZXIgZG9tYWluIGRldmljZXMuDQo+ICsJICoNCj4gKwkgKiBPbiBwbGF0Zm9ybXMgd2l0
aCBtb3JlIHRoYW4gb25lIHBvd2VyIGRvbWFpbiBmb3IgdGhlIEdQVSwgdGhleSBhcmUNCj4gKwkg
KiBzdG9yZWQgaGVyZSBpbiBAZG9tYWluX2RldnMsIGFsb25nIHdpdGggbGlua3MgYmV0d2VlbiB0
aGVtIGluDQo+ICsJICogQGRvbWFpbl9saW5rcy4gVGhlIHNpemUgb2YgQGRvbWFpbl9kZXZzIGlz
IGdpdmVuIGJ5IEBkb21haW5fY291bnQsDQo+ICsJICogd2hpbGUgdGhlIHNpemUgb2YgQGRvbWFp
bl9saW5rcyBpcyAoMiAqIEBkb21haW5fY291bnQpIC0gMS4NCj4gKwkgKi8NCj4gIAlzdHJ1Y3Qg
cHZyX2RldmljZV9wb3dlciB7DQo+ICAJCXN0cnVjdCBkZXZpY2UgKipkb21haW5fZGV2czsNCj4g
IAkJc3RydWN0IGRldmljZV9saW5rICoqZG9tYWluX2xpbmtzOw0KPiANCj4gLS0tDQo+IGJhc2Ut
Y29tbWl0OiBjZWFkNTVlMjRjZjllMDkyODkwY2Y1MWMwNTQ4ZWNjZDc1NjlkZWZhDQo+IGNoYW5n
ZS1pZDogMjAyNTExMDYtZGV2aWNlLXBvd2VyLWRvYy1maXgtYmExYTVkNzUzYjZmDQo+IA0KDQo=
