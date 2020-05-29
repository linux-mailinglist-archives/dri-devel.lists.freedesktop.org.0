Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B61E7FD8
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCBA6E911;
	Fri, 29 May 2020 14:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEB26E911
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1gkm95kFjfxSHzGQmco3XJY16vQHyHG/CFjwHHc3rgR4tq/S0pcfHH5AT+X9S1ObpHpZUWS5F8Igpp8KcbtBdKVKJxPIuTvnHW4vo+XRUjKVwUxMyteTjyLRCO6wszaJiEonw53C73nxEsFz+fTe1KecqUEoTU+UDS2TAQe98TW32XfVsDRGzwjV93UJtpYtct20T2HoqWA2SHekTT6POvOGOgjCVliJhYc034VCJFhViPlKIlQLknCdvJYWg4i/SZoTjdUQEAid04HnRwikllqlh7NNpF8NYQp4adeJYq+5AZ1VnlnaDqFK4gqyUGFEIyVQLCQGefmR4Nu6QVEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OQNwJXLHBX9qF7ukCexb5WM1jgrWp0Gm0NKWz2mB/8=;
 b=IdgaRtyq8eDYWQpb1zQYJtVQOOw6NWq5HgfjK8diTQBy+Ew8C8vxp6yLc796GtZfoCMOMd5XNV2DiPdZHrIBmJgQ1riCD+N917fW8GcQMNcW5vhef7murv4JDpbqZQkNnLsKtqiDf9HIJ2jwdXunjOD27jmNPRIOmpGf81jaK0I/7L6wWTz0mlbNZgav2bpjYRJD83e6egVBwLCuEKDpluA92QYL4QL8Fr0VZqP6pWDd2VkJQh60K/2tgz76E1NW2vLNfoOipIGSyjdP333yuYTTT8xk1+Ok7oMLnj9mHBe89bBKWG/TSWT6CA7DMk+PxcgVPqXIBaOGtDrvRsjPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OQNwJXLHBX9qF7ukCexb5WM1jgrWp0Gm0NKWz2mB/8=;
 b=S0EyU03pgV4PS4HOtmROPoL6M8awgjWug9VgaIMFcsahquWDsZezbpbU4ZZ9oY+J9HlFi82Tn8r4VHgSwcMO3PXqxr6nVpEe9ZHdGD+v0AMeLQrf2L6hGS98sG9BYS7gDL3MqYzvS8VRCaMuYqeALNGYr3VAO5p1mO8CqPZjYBc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3339.namprd12.prod.outlook.com (2603:10b6:5:119::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 14:11:52 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 14:11:52 +0000
Subject: Re: [PATCH 1/1] drm/mm: fix hole size comparison
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200529140401.39396-1-nirmoy.das@amd.com>
 <159076134014.8851.16032748127357561504@build.alporthouse.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2afb0933-cf7f-42a6-060d-8c30cea742db@amd.com>
Date: Fri, 29 May 2020 16:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <159076134014.8851.16032748127357561504@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:205:1::34) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:205:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.7 via Frontend Transport; Fri, 29 May 2020 14:11:51 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d46be52c-06be-492b-5018-08d803da3c75
X-MS-TrafficTypeDiagnostic: DM6PR12MB3339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3339870D1A07E332DAC47F15838F0@DM6PR12MB3339.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pV1+ocfgVwv5y19jHk0o1IBEp83IVPGZs4wnVwiJlgf6TlM6Q4FXO5bxmmkEwSb1gs4JROo7q18PYp5gPbxQ8cN/KjANnuma//Ew9n0Y6jSvRqxnJ6ASNlz35JZkkV0riUk8ctu2h0d4EdIgyP+VY6YFuM4ONpEB+sXUzLTrEr1gJPirqvvxqHS2jAYWYUjAnMOik0EL0KCixfRc/vIgFrgSfSPsOwUM+ebPBz/OqtTeewLyBcFU57S5o98bTUX9QXJcOXevPfRXfFnArHIhggwgUWu0ImdKGrGLUahL6W6/Ub2J0GClGp5ievP6n83dxW2Va0sZSnjog1+IPbCsquCJ1+9h+ixmv+esevPtRIHOthOkmnp18JxH6eLVkT/I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(5660300002)(6666004)(8676002)(110136005)(66556008)(66476007)(2906002)(52116002)(8936002)(66946007)(83380400001)(16526019)(36756003)(4744005)(478600001)(186003)(4326008)(31696002)(86362001)(6486002)(316002)(31686004)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mgMVWDsqaAovry83kDO9UCHhDm8AFiTbrQBAGn/7YYC7tvBHQwnkid9JJlqSInL42efcLA38ak/9LAlt/Sf+lEASs82btzjVZidfwFnKRPM98t1onSTY+P6RTHMqpx4eHq3PDqdjqsAx7FgX9M9hSQdipsqs6MYkrXA/tZFlqeGarS7XQ396DcmwABtIEJDtrk5iGf5dGgIXWd2NHKZUxbhz3/KI61MLzsbU0TpNMD2j6Smt2xfojS04wkdDEHQkB9HXlQAE9mqKniBnS4Dpf0oKqk02NoLsZj1KNtATj1M/KofHQYDOkYZcsm1ivMcGx7gZid9fZ4oxzr0O2VorjWgfosvCus6DWqv8knuxlDUbcnfF50Z8SItPjnLDPFVmsHMGTqdnDlwyqE1kwKwGkrXYpzNk1w8sAMUbLuF0YG0AuPNwaYE3BeDPps+6MWKA08zwlS8InOUPx1ZRanha2wToh5XnMXjqBNSx93cnaaH4LYMprrR2wQv+c/J47fT/18rMYQUJvSM90H2NCFJIFKiVGMEXIzNnGLg/Al9wG0qKu0L1R7aGt/eZ+OFtjSwV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46be52c-06be-492b-5018-08d803da3c75
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 14:11:52.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI8ZUQuFzdbL6QrERm+jlWezKaQ25mhJ5SoDSHW2GERCfFZBeapHEaLrviMev4x+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3339
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
Cc: Nirmoy Das <nirmoy.das@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDUuMjAgdW0gMTY6MDkgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBOaXJt
b3kgRGFzICgyMDIwLTA1LTI5IDE1OjA0OjAxKQo+PiBGaXhlczogMGNkZWE0NDU1YWNkMzUwYSAo
ImRybS9tbTogb3B0aW1pemUgcmJfaG9sZV9hZGRyIHJidHJlZSBzZWFyY2giKQo+IEhtbS4gSW5k
ZWVkLiBOb3csIGRvIHlvdSBoYXZlIGEgdGVzdCBjYXNlIG9uIHlvdXIgZW5kIHRoYXQgaGl0cyB0
aGlzPwoKTm8sIEkganVzdCBnb3QgdGltZSB0byBkb3VibGUgcmVhZCB0aHJvdWdoIHRoaXMgYW5k
IHN0dW1ibGVkIG92ZXIgaXQgOikKClBhdGNoIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoKSWYgbm9ib2R5IGhhcyBhbnkgb2JqZWN0
aW9ucyBJJ20gZ29pbmcgdG8gY29tbWl0IHRoaXMgdG8gZHJtLW1pc2MtbmV4dCAKaW4gYSBtaW51
dGUuCgpDaHJpc3RpYW4uCgo+IE9uZSBvZiB1cyBzaG91bGQgYWRkIG9uZSBmb3IgZHJtLW1tLgo+
IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
