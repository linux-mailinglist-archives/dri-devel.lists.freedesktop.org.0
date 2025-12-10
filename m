Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68999CB3D77
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 20:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C5310E25A;
	Wed, 10 Dec 2025 19:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="hsiYC+tQ";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="d1ul8Lnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 10 Dec 2025 19:14:55 UTC
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [67.231.157.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50F10E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:14:55 +0000 (UTC)
Received: from pps.filterd (m0050102.ppops.net [127.0.0.1])
 by m0050102.ppops.net-00190b01. (8.18.1.11/8.18.1.11) with ESMTP id
 5BAGxYZG1234999; Wed, 10 Dec 2025 19:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=Apwr9De/DUoeOapPXHW4XNTDBh8O3hKsJzHE9YTHvQI=; b=hsiYC+tQOXy7
 PUfcX97V/t+gqVMUNDSRWHqKoWKbTmsA7y6pGDlxCSSlmx8DPKxIShv5IUQMqXbE
 HWGkwr8ClTDOkftR+Ziakwbav6XbD8tBNtXP7toH6C+noXTMEksqT3DcfKEfda+X
 K9rkT0eQVrTFjjvaQdRb7nt2GgJ25JGLEd+Dqs54a7skgppc1aeP88CX/wyyjrRX
 p1JEC7CWeOI0rqlwK45Fa4NqxYGO3KhgllCCczv0mukfsqCZ4HM47HRaxxbL4Pyh
 NCQSb9MkO0KLxNabyE/alYsTT50VMLwNpgJhJfxgZ72jvL9kSEE///BDhkrNRW38
 9fFuAr7+PA==
Received: from prod-mail-ppoint8
 (a72-247-45-34.deploy.static.akamaitechnologies.com [72.247.45.34] (may be
 forged))
 by m0050102.ppops.net-00190b01. (PPS) with ESMTPS id 4ax8yv5hg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Dec 2025 19:14:48 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint8.akamai.com [127.0.0.1])
 by prod-mail-ppoint8.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BAH7W5W010508; Wed, 10 Dec 2025 14:14:48 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.220])
 by prod-mail-ppoint8.akamai.com (PPS) with ESMTPS id 4avgq1t84k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Dec 2025 14:14:47 -0500
Received: from ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) by
 ustx2ex-dag5mb3.msg.corp.akamai.com (172.27.50.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 11:14:47 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag4mb3.msg.corp.akamai.com (172.27.50.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 10 Dec 2025 11:14:47 -0800
Received: from CH4PR07CU001.outbound.protection.outlook.com (72.247.45.132) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 10 Dec 2025 13:14:47 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXNynreuMUaNmzgHJv81HeAhU169cg0cFMBDphowgshRgm+e3eslzHOpTGZ5nHrLk3BWBHijMU3PaZxQir6XKagELwcQLE37YylZbpK5BVOgW2+q+uZPt4E6zQbbcub3HeqgHui5Ek9B3LXJ+BbMplNTWKuDeEgtEszT+j3d9DTWaaFtDofI2ygjI0IQEePcvSTa9WtQ9Z1zZLWfgeinv2tKyzMZ/uW9guCySRTR9TLs0d2T4LMBNMOXTnNtndJvZBT+WKZOxjjvkmJjUbLYPUWxDcG3qLV0kAQ1MUEqwMPGoJUuEvRLW384z6ZdeEHG9/6zZY57BL7IieQBVWga/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Apwr9De/DUoeOapPXHW4XNTDBh8O3hKsJzHE9YTHvQI=;
 b=qw7R1xKbyoDatsRKpzGl6AtVHJq/PIJXb9CxWxd/5LzKCrG2yn1kYJ46wCcudU3lBPrzfOzlAcC0BwnvBVPzUOIzTSDsUfmBDY9aWsjET01lTJZwXg8uA3HD3p7yA3q0VhQlvhICDACgOEBTbAiI+G9QEHQU2JGurHWufLCuJ5YHboSyPgMoImITaoD6Fxgq5ARjJRqm6k+sBcmhTSw61HvWXp1ycrP7YBBFGW3w9otT2UY8z74xvXoJ2z1oQh4cz3aCJKjjXIH0zDVmCLPciES6q2xliPYR/8qxzov5w/0P2KkKpqXebbjew74QwCuaqydDAho5CcpHzb0H/czQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apwr9De/DUoeOapPXHW4XNTDBh8O3hKsJzHE9YTHvQI=;
 b=d1ul8LnrFb14zj63PG++PrsobL3aRy740uJL/rqeROxvB4QX6vEPNsArsFz5iTOKieaXvsU8RtDXoam1xlS+aONjZG7Pb6mh9c2GTkRwwZCP4R874Yw45AtkNeV2yehmZgrzZc6CViOn7hTl3hKafjGYavK3sd+rfqIx+BRSH3A=
Received: from MW4PR17MB4876.namprd17.prod.outlook.com (2603:10b6:303:10d::17)
 by IA3PR17MB7430.namprd17.prod.outlook.com (2603:10b6:208:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 19:14:45 +0000
Received: from MW4PR17MB4876.namprd17.prod.outlook.com
 ([fe80::2b53:64e8:a13b:b404]) by MW4PR17MB4876.namprd17.prod.outlook.com
 ([fe80::2b53:64e8:a13b:b404%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 19:14:45 +0000
Message-ID: <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
Date: Wed, 10 Dec 2025 14:14:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
To: <jim.cromie@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <gregkh@linuxfoundation.org>, <ukaszb@chromium.org>,
 <louis.chauvet@bootlin.com>, Bagas Sanjaya <bagasdotme@gmail.com>, "Linux
 Documentation List" <linux-doc@vger.kernel.org>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
 <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LV3P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::35) To MW4PR17MB4876.namprd17.prod.outlook.com
 (2603:10b6:303:10d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR17MB4876:EE_|IA3PR17MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 242a5fe3-d631-4813-a35c-08de3820612c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ditleFZ0M1BSQjQxeks3aHNuRS9rYjNuOWJtWCtVb0Y3QW02RzBOcnFaU2tX?=
 =?utf-8?B?TFBxc2dnckE2UnBRWXN0YjFTSStCT1E5djBaeVdVNllFK1IwcGozWVA2VmEy?=
 =?utf-8?B?Q1BqTTRDVG1vaVVHL2F1ZXRZcDZYaGZnbGFBMVNSaU0wYUkzYkozVzRxYVlP?=
 =?utf-8?B?NWN4U2h6eDAvRWhJbHNtOVpMOFVtZCt6TDhUVG14MFRjd1BPLzl3M2lCTzBu?=
 =?utf-8?B?QnNhVndHS3FRQ2duUXh4NnRmUjA5eWIzY005OUxTb1FUZFAyYlRvQU10R2R1?=
 =?utf-8?B?Ti9lbGtNQW1sSEVQTnh1VXAreEttTG50M2M5ay9Lak5vQWdYYzhBM1hBVUdN?=
 =?utf-8?B?dWF5Wm9aclNITTkzbytKTElBWFpJSTY1MDRodVAwUFNlclpjWEtGbXk2UnNv?=
 =?utf-8?B?SEdFdFE0UC9JNVZGcmZEa2dQZmpKT2ErUjRFeE5nbERxL05mV0hqRkpNZ2Fp?=
 =?utf-8?B?NE1LN3I0Mm9vMDlQSHA1Q1Ezd3NsSXIwOEJDNFE5cmlSVFBUVFNPVFBRWlhh?=
 =?utf-8?B?dnh2SlNXc0VjeFFydGRzSjE3Uk1HRnZoTnBqL1ZDSHd0ZEl0QjRoRGordU02?=
 =?utf-8?B?M0h4V3YvNkprOEdNUU8zdEhoRTV4S1M5NWMxQ283TTdOem4wUUtGMlA3QmR0?=
 =?utf-8?B?NzFLeVJkM0l5MStiUnQvQzk5b3ZkcW9FeGVFRGVJMUZlWkcwdFJzTVFQTzRC?=
 =?utf-8?B?UTVhcm5mTE5manQzUFErYVFzWTJ0aCs2dEtUQzJhbS9OVnYwb3hLQ1ozZVRR?=
 =?utf-8?B?ZFppWDF0b1lFeUkrNEFhZXFieVZSbnowWFlWRDFLVE84dDVMOUZWMTRlRm00?=
 =?utf-8?B?OXlKMTQvSThjbkV5UGRVZllCdTZ1TnNHdnBQVzM3NTFuL3JqU1JheCtFWVd5?=
 =?utf-8?B?c29mcThLM0NZYk1XTEZZR0VVSDdUYzZzRDd0dzFGOHdENXlLQ21vUkRXUCtk?=
 =?utf-8?B?dy9jWjMvbXhEd2tnOWQzeThUaW1weHZKblFKRFowZFRiQ3UvbXlLMUJndW5I?=
 =?utf-8?B?NkQvQkRWbFRRS3ZJQnpKOTVudGVUaXFkOEJYalBmYWxhUWZLSFdUN1BFY2hS?=
 =?utf-8?B?VGhSWE5PNnkvZ0U3R1JzRHZ3Z0ZnR0ZMeDNmNWpybFo1VDZaR0hnQkN1N3Ns?=
 =?utf-8?B?dzFIVE1BTHVhRm4zc25DYTRZOW41KzVQc203SU5wSmNLMkhMMXJxaEQ2MlRS?=
 =?utf-8?B?KzJjbmlBNUZOa2gzNEpvblFvYmM1VUdlVyt5VGpwUDBZVkkrY1JjVStjRTFj?=
 =?utf-8?B?bUtVZ0V0Tk42MEc2UTZUQUdIaDU5NW9lNXJvd3dsZ1ZBUEROMHNFRGtQS3lZ?=
 =?utf-8?B?dWVxTkg1a3g0R0dzNmJ5Mi9USldRbTdFK1Fidzk1ejJSTkNvdXNxUVpwZ0l1?=
 =?utf-8?B?K0crdVMrd2daNVpIZHZZQXJrMlR4TFczajk0RzJWRjhzQXdXY0plbmlFdFk2?=
 =?utf-8?B?NERNWnYyMW1Fb3NKSzQybHhQUTRabnBWc1pIUHNXdGgvckM1NFBzdWxINFhD?=
 =?utf-8?B?U0s4cnlzVEx5UTBydWpxRWsvZ0JDSFRKZlBiaGMwN2dXVnZMbndlNmhGZjNJ?=
 =?utf-8?B?Z2hsbFkvRk4xRlBXZ3hPckQ5YjFKZUlHQ01WMmJSK2NnMWJXWXJvaHRCK2ZE?=
 =?utf-8?B?a2w3d1ByREFJMzNkbitwcytKUjVIS3Nma2tTdlJ2VUdHTHNiQXBZdk5CbnJN?=
 =?utf-8?B?MmhJeXBRTEZPNFM2dC9IVkl3Wm9hUFB0c1dYNjZpSjRxeTBpYkxlZ0NLdlAr?=
 =?utf-8?B?YUZJTXhhTGVqSDFwWkt5b3BUT3dJcm5xOFRwVjJ3dzMzdnFJNS9wT3IyRitD?=
 =?utf-8?B?SGhjcCsra3lqSzFzQVNFa0ttWlowcHl5YkNYdlZpTXNSMTU4dDk0dXNlczJ5?=
 =?utf-8?B?anFWc0xkQTMyeXdHT0xwa1hQeE13VXNaYVJRYlZKc3paVmxrY2VQMk9BdVE4?=
 =?utf-8?Q?GFNHXU3KXImZO+p8MBx+h+GTHAlnbVFo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR17MB4876.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjRVeXhhZ1VRSzhzRWs3b2ZiYW1KQWZkZDAraEY2UTZ5eXdDZFdFYm5PSU95?=
 =?utf-8?B?ejgxRlpEKzIyU3o2Q2VZZjJWcktBaTY1dUpxc3ROL0JrcEV5anpGVXpGaFlT?=
 =?utf-8?B?ZlpKOUxoREFXT2d4MjFac0p4OFhSSFJLRit3eFlVRTJJMHR0d2tJbmNuOG5P?=
 =?utf-8?B?MHIzWTczL2RiejFzdnNPNFVVdWxPM28vbGwvUGVjMkljTEhlSnQrN0NsYzk0?=
 =?utf-8?B?WmtoNldEcHhLRmtVZjMyWERmcy9aK0pDblZNclh3UWVRdWl4UFBYcHlyVE81?=
 =?utf-8?B?bWJ6VUdtS2tvRXZYdzBGUk41MnFtRndMVUQrbzAxWkRrSmwvQnJxOTFpRnRT?=
 =?utf-8?B?WEhRYVk0QWdmN3hpOUVVVWdSeUo0NGZJZEkwTFprUHlSUUJMNXY1TXRQRHc2?=
 =?utf-8?B?bktuaUxqcnM4S01QSlEzdVlSZHhyN25mUmRZM245Ujh1KzQ2S3BMa0tBQk5y?=
 =?utf-8?B?UTcxNnNLY0VRYVd3Y0JhWDhzU1V5NlkwUEJWYXpURlgzbE15SUREWXBTU1l0?=
 =?utf-8?B?d2ZaUisrdWxra2tONGdHVzVSa1BrWWY2TTF1Q1M0MmVIVUNWcEg0MVo5R1ZN?=
 =?utf-8?B?Slk2Z3g3c1V4Y21kOElhSzhTZ1JWOXQrM0RqZmNaMWtHOFZDMEwwWUFGMktQ?=
 =?utf-8?B?WHdKcHJ0S3JBQnJtbmh3Q0Rob2JWWnVYeEdQenovR3JGTjVTSjVvSjFDYkxW?=
 =?utf-8?B?WkR2QmJqYzhzVmx4ai9aZ1diOVlaTlRZZm52aEoxY1lkK2JJOFEyUDhpTGVl?=
 =?utf-8?B?YjBDYll6cmdkaEVzREdiSDBMMnlvV0JSN21QTnRQNlU0UEVUOWxSNy9kVUtB?=
 =?utf-8?B?bXlET2ZMWDFhZU1DUTEwcDREcThZMlBTeCt0ckNLbzBMVTl0b2JxYXRocWlt?=
 =?utf-8?B?UWRlWTdWTDEzTEFQZ2tuZXNUaGJjNklZUmN5ekJveEc1aERxbWR3cThGYWFT?=
 =?utf-8?B?N05RV0UyYWFWdHVTYldhSVFud25aa2RCTkFheXFKcUtPZWZ4U01GeXRkczd3?=
 =?utf-8?B?SUNWYVJPcDB2NmR2QmwzZjN6TXVHNzgwOGhNY0s1Qlo3YTBFeVUybmQ5N3kr?=
 =?utf-8?B?d3VGNlN4MW5OclVhL3FabjNtNDNaQmtjMWxUamhib3VDNXc3LzFEOWJRQXNo?=
 =?utf-8?B?bzNwc1pIR0ZvUVZXc1VsQ1FrTkN1MWtTS3d6cVUwSUg1ZmYrSjJOeWJabjlY?=
 =?utf-8?B?bEdmVVVqK08xMm8wcDdMT040V2ZENFgrTXJHYU9kMUlENFhRcGw0YWQ1S2g5?=
 =?utf-8?B?aG5VSEU4KzdaK0xCdCtXQ2ZyTWoxQXVRRENQYkVqTzJzTk1jcENVUUQxa2Zj?=
 =?utf-8?B?YWpNTHFERVZrWmlqWDVtSjBoZlhtV3VuTkpKVFQzcEJ2Qk1GVWN0bEhYQ3RO?=
 =?utf-8?B?eUQzMEVIWVJWdkhtV0dQZTFLeTVRbk12dWsvOUN4RXNPOWNUREllb1FrUWM2?=
 =?utf-8?B?eE5QSE9nR0I4MGpnMDdZcWFpc0VQMnA5OTlGSStwckI4UjA3TUJXajZMUzFy?=
 =?utf-8?B?YUQrWVFFdW4rSmFodjhKZTcyUGF1dyt5Ukprc084VXg0WlFNNWxyT1I4KzlO?=
 =?utf-8?B?SWZNc2s3Q25kNkROZk5qVXRENjFuRWNRZFNkdFAzRndiWmhqZHBoRzRUc1ht?=
 =?utf-8?B?OVg2MzVhT25tVWNHMEhFY1FnZmJ5a3A0WTF1b1VKcGE4eXRJeDliNEpUamxa?=
 =?utf-8?B?d1dYMkRpUVhSOUt1MUF2SVBVZzl5N0MwbktZWER2SjlPRWc3bS9JZDdINmxx?=
 =?utf-8?B?MWM1eG9ueDE0SENZcGhiM2pLR1FCZ3RCeFBIL0NTVVNuK3lMd0VKaHJSSkpM?=
 =?utf-8?B?eHJ2UDI0SVdHRFhOOElZdmFPQXFqTjhtUHE5dmJDTVZ4VHlJSk5pVEo2MlZi?=
 =?utf-8?B?dnVwYWQ1N0c3T2RWWVc1dDg5QldMcjVZQzZSVzFYd3BxcTB6a3dxcFp4UXZz?=
 =?utf-8?B?RjQ1N0dvV29FMmhRNTc3Zjl3NDdUMDMzeTFySXl3V0l4WkNOOWkrNnpjcEF1?=
 =?utf-8?B?ejV3OU9lUk9PViszZHU4aU0yaXBzOEgzN1R1Z0hVWWl1a1N2UHFlRHI5SVgy?=
 =?utf-8?B?ampzVnQrYUNaVDZseE9zN2hHcXNhdHdUNTdncDVxUG1YTWVTclIwZ2NBQy9y?=
 =?utf-8?Q?684GVbT+2EzWQ1R+PpaOKkRrA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 242a5fe3-d631-4813-a35c-08de3820612c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR17MB4876.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 19:14:45.5063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfPSMYVsJcunXEWtFg90N9LRzIPVK0DimEfax00FZMRtXnzGTKnRvzL3ML+vj3CyYs3R3nkXjPMqi7ov6GN57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR17MB7430
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512100156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NyBTYWx0ZWRfX61RTZskZR4dX
 o8uKDdUM8KCBnUYhH0drzFMs6mHmXAkNvhcdXeqzaTopEV/7nh8BWa1wA2F+QZ2XIJb1xZaW1tm
 Td/TGIho43cya/HazsAnS/g6xBnMd7+hQdYjI0TnAA8r3Dd97wmB+cHPLZEcuFOKC1Wd7wgNNkI
 tiIas2zBrQ8Ql3jyJGOHkd+c1oMlAKauQB/8rbZAJKR8RvXedgu5cMTZWhJIgjVMRzWwJ70zZaT
 dY0srafaC3145dvv7EDEkvgY7cZfWQ0ZKYgho9m5ZSeecvNDzPs54dPtSStjg/nl03Ti7vnUOR+
 +G8Dkvb21weYBiddb63T1udHIk7A/y57Czz4iCwtlosasFxyTf8/S6VdqRBeLTa0fA9AuK2XpM4
 Cy0LuOQnso6wjnDOqRXJC6TytOl/vQ==
X-Proofpoint-GUID: Or_7Km1Byi20VEhd_wAOAhU1CL0-qeaD
X-Proofpoint-ORIG-GUID: Or_7Km1Byi20VEhd_wAOAhU1CL0-qeaD
X-Authority-Analysis: v=2.4 cv=Y5f1cxeN c=1 sm=1 tr=0 ts=6939c6a8 cx=c_pps
 a=YfDTZII5gR69fLX6qI1EXA==:117 a=YfDTZII5gR69fLX6qI1EXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=X7Ea-ya5AAAA:8 a=9eqoR-FqzWT41qJ7ulUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100157
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



On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> On Wed, Dec 10, 2025 at 11:43 AM Jason Baron <jbaron@akamai.com> wrote:
>>
>> Hi Jim,
>>
>> Very minor nit below about the kernel-doc ordering for args...
>>
> 
>>> +/*
>>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
>>> + * the contiguous subrange of elements matching on ->mod_name.  Copy
>>> + * the subrange into @_dst.  This depends on vars defd by caller.
>>> + *
>>> + * @_i:   caller provided counter var, init'd by macro
>>> + * @_sp:  cursor into @_vec.
>>> + * @_box: contains member named @_vec
>>> + * @_vec: member-name of a type with: .start .len fields.
>>> + * @_dst: an array-ref: to remember the module's subrange
>>> + */
>>
>> Not sure if the odering matters for the docs, but it makes it a bit
>> harder read when these don't go in order.
>>
>> Thanks,
>>
>> -Jason
>>
> 
> I chose that doc ordering for clarity,  the easy ones 1st,
> and @dst last since it gets the subrange info.
> I think reordering might mean more words trying to connect
> the pieces, and with less clarity.
> It does work against the macro arg ordering,
> which places @dst near the front,
> I did that to follow  LHS = RHS(...)   convention.
> 
> Im happy to swap it around if anyone thinks that convention
> should supercede these reasons,
> but Im in NZ on vacation right now,
> and I forgot to pull the latest rev off my desktop before I left.
> so I dont want to fiddle with the slightly older copy I have locally,
> and then have to isolate and fix whatever is different.
> 
> the same applies to the Documentation tweaks that Bagas noted.

Couldn't you then re-order the function args to match the doc order instead?

Thanks,

-Jason


> 
> 
> 
> 
> 
>>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({                \
>>> +     typeof(_dst) __dst = (_dst);                                    \
>>> +     int __nc = 0;                                                   \
>>> +     for_subvec(_i, _sp, _box, _vec) {                               \
>>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {       \
>>> +                     if (!__nc++)                                    \
>>> +                             (__dst)->info._vec.start = (_sp);       \
>>> +             } else {                                                \
>>> +                     if (__nc)                                       \
>>> +                             break; /* end of consecutive matches */ \
>>> +             }                                                       \
>>> +     }                                                               \
>>> +     (__dst)->info._vec.len = __nc;                                  \
>>> +})
>>> +
>>>    /*
>>>     * Allocate a new ddebug_table for the given module
>>>     * and add it to the global list.
>>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
>>>    static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>    {
>>>        struct ddebug_table *dt;
>>> +     struct _ddebug_class_map *cm;
>>> +     int i;
>>>
>>>        if (!di->descs.len)
>>>                return 0;
>>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>
>>>        INIT_LIST_HEAD(&dt->link);
>>>
>>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
>>> +
>>>        if (di->maps.len)
>>>                ddebug_attach_module_classes(dt, di);
>>>
>>

