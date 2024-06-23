Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D379138C3
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1183C10E0E8;
	Sun, 23 Jun 2024 07:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Q0rEXkzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEED10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:26:27 +0000 (UTC)
Received: from rly02d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) with ESMTP id 45N7QIuS364633;
 Sun, 23 Jun 2024 08:26:18 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) id 45N7Q25O362238;
 Sun, 23 Jun 2024 08:26:02 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2043.outbound.protection.outlook.com [104.47.13.43])
 by rly02d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45N7Q1OV361232
 (TLS bits=256 verify=OK); Sun, 23 Jun 2024 08:26:02 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNI28+M7jBO1FMRPqaemxgQpS2QNQPZlfj0oRfEGMKJ623F37m3h/UYkUyZ7WkRrke18u5OZtpUM26PYqIF7jsZlAh9YI6+owQblts5uQtxBbtgkv331hl8R6ldKi3eh2GmmUNVy6bzi0ZRNhPsrdngUSXydHE1A91vBroYlld/tDbMAV24xW6jFKfebPPuvD8Q++sE+glxfsoJ3K/Mv41k1zzuMMv8575Z7t0yWspTLY6mu4HcqZexOIt3491bVRK16EkAuWlqb17clnpWhACdyOWqwxD3P1OjClpSNZnhd9mwCKfuim1oRAxesREkvqlwdZYy2bB185c0N4faL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhB44BtLGbjuLbKRaFGOylLyPqyhtx87kBOEYgL/tDo=;
 b=YkzvJKBiThFNbgfp5QLldXRChzwVsOxNY4iEAhHcO04sF1Bp4f/jJbw8aLkd4RCArfk3bqOOQlirnEdaZNTKyIrXXnPnQ/sXxz6eb6xhcgmLrFrPDhNO4dWBs5ZYtFlUFHxaYKEO2gaQeksiQkOYLKBktI2PFMz32SuetWaIGjPZ6R3e7j5tQr4MLJaofkZuQOua2CIxt8UjeVreJuIquFpkLqCYYLdloDiLf3xnHQJpOXLTH+2geH8ZAZng7xk41eu5y1fYaS4qka9JIZ4kCAqx2am+daOJqIHPLEUmYOKWLUgW45mhf3wnT+2GohFSxK43pOCkc647VBTQ8HcGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhB44BtLGbjuLbKRaFGOylLyPqyhtx87kBOEYgL/tDo=;
 b=Q0rEXkzQfTqhzA1wESJdlOiAl9Re/o8noYeNdrhx1ZNIQ4/BeUMTDggA/BuaQVHLzcklKQ9XjDpBuD0QQO9oNyet6BpKLGnUGjRxrdGIAaihjP2L5oWExkDjy4qYxtPJixIa4UW9Uxyjd0y9jup2jwP7cNful2oddfXHXQgB+YopvsA6MKbB4wiLgjyBFSCN7dISHecr7oXRaPbTawF28tqM0xhDNEToWsEcWeVRS1ECsDbUqlA2vWxEJQcxLHRCY9gaIRW7ugoXyBlZGC63k89IetofQyk7UFIPihGsBSvGZSEMzY1hHIHeDFytJj3L/ocjne2HnD9mG1yArUTphg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DU0PR02MB9489.eurprd02.prod.outlook.com (2603:10a6:10:41c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Sun, 23 Jun
 2024 07:25:59 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 07:25:59 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai
 <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Topic: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Index: AQHavWrP8fzUP7TvlUuSpdkfhyjIlrHPc/UAgAKZx4CAAAN0AIAC8SqA
Date: Sun, 23 Jun 2024 07:25:59 +0000
Message-ID: <74988916-af2b-422d-86af-6fae8dc9c97e@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
 <BY3PR18MB47373D1A7ACBDB92DDDAB655C6C92@BY3PR18MB4737.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB47373D1A7ACBDB92DDDAB655C6C92@BY3PR18MB4737.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DU0PR02MB9489:EE_
x-ms-office365-filtering-correlation-id: 963c2fd0-b7f1-4f3c-a817-08dc9355baf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?UGE2aE1pR1JYK3lwSjVuUDdIL01SektUam9BaXBhLzVaYlQ4VkNtdFhsM1o2?=
 =?utf-8?B?UEhsT1J6KzBrcU1PWi9mUEIwM2FadFB5VlhrTzZRWTFnOVdIMmlpUkFaRlN5?=
 =?utf-8?B?Si9wREI0T0llejZ2M3M3MDBHeHVXUjV2SStwYVM0YTZmcitKY2NFc0VNK3dr?=
 =?utf-8?B?YnFtME1vM1l0bFhId0VLQTBXNEo2ZFpwNzV2K2ZZY0kwNHY3QWEwSXd1WmtW?=
 =?utf-8?B?YWlyWWZveUt6NEd6RE5FcC9PbDZYZUxIZytOOUNyK3c1Zlo5NUk2NWk4c2R2?=
 =?utf-8?B?a2wwd243bzJoNkRJNmMwSVBtaFpaeUg3dzZCS0lyTHJSUXhpNmRxbzJFeHQz?=
 =?utf-8?B?Y040SkRRd0dBak80c2tTVUNjNmNHZDhnQy9qSUxZK0VMdnJmZml5Nmx6NVQ0?=
 =?utf-8?B?QVcybUR0d3VoNk9UT0I1cGZXREttTkZVbDFod2IyaWgyQ1lMdXAvTmYvZnJx?=
 =?utf-8?B?WnNwVFpQUjNGMEdScDk1Sy9qM1BOVitzMllJWEY2WjJDcSsxVS92aXJDa3J3?=
 =?utf-8?B?OFpaRUdSUFpsYXlZcmJYUlFrQjJlN3o1MkF4YnNnNEFjWnVVRjVVeGYrTzBo?=
 =?utf-8?B?R2hVbHdLMm93Z1c0TVkxaUhhTWw3eEZmN0krZnZOVkRlK3FOSVozbVdKYmdo?=
 =?utf-8?B?VG1WZk9YWENCSEJ0U2FqeWJGY1JwSWVTMHZ4b0RXOWJHZkVPaUYvVGUzM1VC?=
 =?utf-8?B?cjllWGNzNWxTSjdIUVh5ejR0WDd6SHlzSUlxbEpEQzZTYXQyUG9wei9vaVRR?=
 =?utf-8?B?QVNHWTYrbU43UjVseVgyOEc3eTJ1SzFvbnR3bkE3T0FreGpCUHRHRlhTQXVi?=
 =?utf-8?B?K1ZsalAxaURlUGw1aDQxN3hVOEZ6RDNQTXVFU0x0ZXpwN1BZWVo3dVNxb3pG?=
 =?utf-8?B?NDZwdmlvb3ZXU2lUSWszRThBVGVFbVJNOUlRZ25KaFBzOFo1dy9uRjVvQnVK?=
 =?utf-8?B?M1ZtekdmWGQyNzJnTTBhOHNxUFRwTEJKNU1yS3lhYW1DL1VTbDRnQnF6aTk4?=
 =?utf-8?B?aWhqN05lZE1BM2I4aFpMcW55MFpIanZyOEw1RXVONDFLMzlIWjFRVzRKQWhj?=
 =?utf-8?B?R3BuOE9PbmRhY3lyYlgxMlhhTlNlMkVSYUJ1TEtUOVBlL0gvK3pUWWc3ZUNu?=
 =?utf-8?B?eDNIWmM2SHhDQUNhNGRLTFp5VUdlMnNKeGIyL0xueEkwaXM3UkdvVUZIRVZI?=
 =?utf-8?B?dGtIbURqS1h5U1dlVEVPVTdWZzVHRTZ0Vnk4M1JuYXRLZ24wUGNwZ0JlN3B4?=
 =?utf-8?B?bkl2RkkzQTh1L3VvOXF3UzR5UDY4L2lIdllwYVVBaFg0MnEwRjEyb0p3QmpL?=
 =?utf-8?B?TjBITjFJVGk3R0psQmVlcSsrT3lVOTk3em8vYWN2RmtLUGN6S1FZU1RnQ0ND?=
 =?utf-8?B?NXBDdVVUNmN3aG1DeTVHVGlWcU5OTDFvRzlKWU1ZaTJoZmtrOVBZUnJtSmdS?=
 =?utf-8?B?SHhXSldmOCtkWEozSEVLU2VPMDFqcFNXOExqYnlJeUVjMDhsLzM0bVVPVGVO?=
 =?utf-8?B?UENXQ3hGRGNndXg4L3FzU1lvWXRIUmVFYWNYOGcrQ3N4ckd4ejBlVmxDVUJv?=
 =?utf-8?B?VTlKOHVuMEtXVUdVV1RJaWdPSFNxcVlYRVBqZmZQV1BzNkNmYlRrSXFNSjRZ?=
 =?utf-8?B?UGF4a0JrM3F0TlNoQVB6MnNpWm9wTGd0cWhIckJaZjhobDl5cmI4OEhXMCtr?=
 =?utf-8?B?VTNKQXdJTkVwWEw1TXRXNGgwVmpDanBMdnNJQlczb2FMVW5IQXVFMkIyT1p4?=
 =?utf-8?B?cGx6Ky9pTytlK21wTzhScDNYNDR0dUNWY3crb1JsWStjZzN2Y2VsUGFrUmRD?=
 =?utf-8?Q?jS5R6WfNxatphIM0Vee0dRiYC9aHRkw7XjMDQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXFVamQ3SXhpMXcwMnhTRmphMENNRG05VTNHN3JhbUV4ZG1iVFFXWGdJUjZQ?=
 =?utf-8?B?Sjk1Z2hra0IzeGNlK1pWUGhkb1duTWQxUmlYZnJPM0tET1pTWGhFaVNvVjly?=
 =?utf-8?B?dHo5ckxkdnJwZmMxMGhabk5RSzNpZm9oNEtpTGNldk1XVkYzRkVpZElRQVFZ?=
 =?utf-8?B?ZEpod0FWRTE4M1h5eHhKeURVSUI0UmFmemxGQVNONU5qMXN1ZkIxck5CYlI0?=
 =?utf-8?B?aEtUZjBRd3JyY1pjK05id0FkYmpiV1RTZWdmTXVMb29VSXRZZkpmckxxeGsr?=
 =?utf-8?B?YkxkbFNaNXZmOHFsYUgwVEFzdXZpWFk1ZG9IWG1NNXNGSDBOeGtKcVc2a29D?=
 =?utf-8?B?YnBqMkE5VXVYUWtmd2NqMGxPWVdpYTdkYTZwRGpDKzl0RGZFMEJtYzVkZXNV?=
 =?utf-8?B?WnNnaUFaQ3MwMDlEaUV1YnpXWW9sclkvTWhuK2ZMQW9TdXUzWm9XZnR4SnFk?=
 =?utf-8?B?TXhPWHd3NXZaVDlHNmdvN1VWdy9MSEZLV3d2M0d0R2J6SlFiNkhuQ1pRcy9o?=
 =?utf-8?B?L2MxaXYrUWxZMitGN2lrSE81TXJsODJlU2NyZE1FRkQ3dEJqeWJIWWF6cm05?=
 =?utf-8?B?NUJwM0x2dnNkY09CcU5vVUZ4WllOQ3lERUIvYnFSZ1hkL2R3RFE1S05aZ1FQ?=
 =?utf-8?B?TDBEZDdkSkFPYkJBWUpnZVoreWJVRThVQWtLcHFya0tOSkd2Wk9xejlwb1Qv?=
 =?utf-8?B?ZGpEa2xZc1FLUE16Z29jUHpiZ0d0T3RtRTVlQXgrNXRSeXBFeVVrdkpKUWhz?=
 =?utf-8?B?TDl6TTVGaEs1Y2h0aDI0NnQ1MXl2NTJNTGtoamkwQkdvQkY5MzEycGZmNnJ0?=
 =?utf-8?B?WEY5dDFhdERHOUo3L2tZUkdVRmgyUFZVbWZhbXNoaWpVd2x1T2tUcmgydlRa?=
 =?utf-8?B?ZDBpYytvQmlCV24zOHRpVzZ0NmFrdDdmR2l4TEtmVWd5OUVzaEV6WlhHam8v?=
 =?utf-8?B?VlVYM2huemJpRGRPbzlydkxhT2FVQXdIaUROeGFvT1FDdWhEWS9mQlNaeXJ2?=
 =?utf-8?B?NjgwM0RRM25SWXhaQmNHZFJrZDRyVFhYMm8vTS9xK2pXcG9WOWpncVNjRE9v?=
 =?utf-8?B?VWRhd003SC9lWEVwYS9Jc0h3TGFCUUJHekszM0J5ZUNVSHpkZXoxbHRHQzZ6?=
 =?utf-8?B?Qk05eW5Rb1AyUGc1ZjNudjV6Rll0WVpxeGlCaXNkNmZ0T2J0NzZuRmdHT0x3?=
 =?utf-8?B?YW92Z1JxemVFeGtzVGJtdTBsL0FrRzVQcDdCSGZoNDBqZWJzTUgxV3hRZTgy?=
 =?utf-8?B?WDlDTG9oeUpmSXJiNS9jeUZmSXBkTFBQSlh6bzVlY0ZMSElDSnh5WjRwUDBa?=
 =?utf-8?B?MmhSeWpoaVhkNHYxK3Blc0F5MU45RG01K2NSd2YxbnNTMm0vU0hHYmM1SDVY?=
 =?utf-8?B?em92T0FiUVNKc2NoWElWQ2hVUG42MzcxQUZRTFlwTXFuY1QxdGRab2gvckt2?=
 =?utf-8?B?ZzJqbzByZzlvV3E4VjVwKzYvVlRBL3RLR1FsUE53a1hkYU1ybEhRaHdMUldm?=
 =?utf-8?B?RWJZUDdCdnprZ1ZqTTVubS9aK1JmWDlZaWd4MElQc1dQRXR3MzQxdmRmUEFM?=
 =?utf-8?B?bzlEVW1SbXNvR2NrY2l5NVlZd0w1bzQ3ZGlWbGZqRjh0U3JCSlZobmxHeUc4?=
 =?utf-8?B?dTh4aUw1Z095MTdIdHYwK09FS2RBSEpyWG5PV2ZXdjl6MUtSaGV5YTJneFln?=
 =?utf-8?B?Y1llRkVXdzNPN0FBK2VpNWtDbnlISXRDM0tMTTdOUGRGQnNlVHIxUnZPMGFs?=
 =?utf-8?B?RXZNKy9VeUlnN3g1bmJ0YTk0VWIxNkpidXdjeHZiT0hYaXI2dDVDSzJtcFJm?=
 =?utf-8?B?bktaaDhXa2Jwd2FoeThGUGhYbUs5eVdUNzJSbTRvS1BWME1xSThVT3M3ekFU?=
 =?utf-8?B?WjltRVRaK2h3MUxtQTRmbUdUYkgvV3k2YTZjUDJTQUp0VXAvNjI5czZNSWha?=
 =?utf-8?B?UXNQTGN1bDdYcTJBZUhHeXVDRWcxYiszdG8rb2xZbWhGZkQyMGwwSFFWU2Y2?=
 =?utf-8?B?QkF4ZGMwdjlTeHp2bjRBWWZZY2x3cUtlT3NyR3ZySkxvKzhNZWQ0NTRBVlh1?=
 =?utf-8?B?bGhZdi9vWnpCcUtuUnkwQTVzcTRPUGt5YnRtcFJ0aS8rWFlkU2hWN0xVVUdY?=
 =?utf-8?Q?Td99VWPtXDaoH94x5D6aoLGlM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE6010DBD20D7A4BA0721C76FF09068F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EFlNhpgpl62Bb3BiVewRvd4Zs2KZwztWvx/Zt84IQYJSD1DJTgmT1d/fOJhVIfGuaBwXTLv+rYvkB2ChRIcZoOWhunfoOhsSqmldDB0uEX/YJ8w1R/5M8WLTGtClRYrEkj4oDWrVTulMtNYoAWhW5ICNZkK2rBAzJ+3VqvUmOQ01mSJmNORyS6n+noQwkoxKxU5jpTCIOn6yUBCNW6aNBjppF1xPkKEHk7VnjpROkMSHGATAfJRTt8mFTRKm3BisRpXFyfMTZwNhJr5Gr3jAnUIQ6GrEZEtVaBISxU8jbmEJ4MbUlBXkNC1CbBh17Qb8Z4gKdtuVb/xzutpomW6+brFYnjm8OAFZuFfLjFua9nG3BNGD21Qi+m7+CUEDsoKRFivflvPxX4Z2QgYWtV2MbagQ4LulJ0GdTGKZG5ZIfJ6v66YCN9CY4/QG/rAos7JyoNhwhdKg8Q9ILluqfYXZ4yFAyVZbZSA4zC751zACvxEv2xdLSYV3kVDTbvc3Dd34FgY4CeMd6KWpXpgs1T4Gn0/Q9ZD0bp3xH/DPssaTZg++vO/+PJcbmwajBQTL14ktJGfBra+i8h1VxLaZRoS1Z8aRr8H+rXaRdAdZgfWdNMazftfUlzfmg3k9fNT6XaG1
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963c2fd0-b7f1-4f3c-a817-08dc9355baf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2024 07:25:59.7499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bpsc+dP+8F1pPvFuQLDPSYJ1sZGd4XxOb2MIulCgEGLg8c22lQBbYcZ0MaJyR/oqkxBtc3H/xcqEJk/R1NNHCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9489
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTEyNzU3OTpGUEtleTEucHJpdjokKR3g1oXU4fu4U/jH/lD8oUgaIZsi+JstwldJpazBfKNtjFaGskVlDvC20E52UzSURzJcL/+5T1pfeknSC2LyeA4orAUKh4R5xTV66g5O269WMbWbQDnz8zCevR/+jHa648iOZV4ua0+Y833jvT6nptLV0UzgJcNm8YDpErxgm+ZVXBZsiFU2tXGoGe+wbf71qPbpBtypd46Pg/Am/KVI/d3Hq6UhmuTU4MMlywy7rqXVptfVkyMioLYHqC0frsf9H7tOO9cQMWDTn10MgEPXD1BJGpsa73W3Cr6AjjtAI8RM+aIwp9t7tan0XN/8w/uPhxL4RWo+u+TjW/T0XaH1
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.112
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

T24gNi8yMS8yNCAxMzozMCwgU3VuaWwgS292dnVyaSBHb3V0aGFtIHdyb3RlOg0KPj4+PiArDQo+
Pj4+ICtXaGF0OiAgICAgICAgICAgL3N5cy9rZXJuZWwvZGVidWcvaGFiYW5hbGFic19jbi9oYmxf
Y248bj4vbmljX2Rpc2FibGVfZGVjYXANCj4+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2tlcm5l
bC9kZWJ1Zy9oYWJhbmFsYWJzX2NuL2hibF9jbjxuPi9uaWNfaW5qZWN0X3J4X2Vycg0KPj4+PiAr
V2hhdDoNCj4+IC9zeXMva2VybmVsL2RlYnVnL2hhYmFuYWxhYnNfY24vaGJsX2NuPG4+L25pY19t
YWNfbGFuZV9yZW1hcA0KPj4+DQo+Pj4gRG9uJ3QgdGhpbmsgZGVidWdmcyBpcyB0aGUgY29ycmVj
dCBpbnRlcmZhY2UgZm9yIGFsbCB0aGlzIGNvbmZpZ3VyYXRpb24uDQo+Pj4gRGVidWdmcyBzaG91
bGQgaWRlYWxseSBiZSB1c2VkIGZvciBkdW1waW5nIHJ1bnRpbWUgZGV2aWNlIHN0YXRlIGluZm8g
Zm9yIGRlYnVnDQo+PiBwdXJwb3Nlcy4NCj4+Pg0KPj4NCj4+IEkgc2VlIG90aGVyIHZlbmRvcnMg
aGF2ZSBkZWJ1Z2ZzIGVudHJpZXMgZm9yIGRlYnVnIGNvbmZpZ3VyYXRpb25zIG9yIHNldHRpbmdz
LCBub3QNCj4+IGp1c3QgZm9yIGR1bXBpbmcgZGVidWcgaW5mby4NCj4+DQo+IA0KPiBCdXQgZGlz
YWJsZV9kZWNhcCAvIG1hY19sYW5lX3JlbWFwIHNlZW1zIGNvbmZpZ3VyYXRpb24gcmVsYXRlZCB3
aGljaCBjaGFuZ2VzIHRoZSB3YXkgcGt0cyBhcmUgcHJvY2Vzc2VkIG5vdCBkZWJ1Zy4NCj4gQ29u
ZmlndXJhdGlvbnMgYXJlIHN1cHBvcnRlZCB2aWEgZGV2bGluay4NCj4gDQoNCkFzIEkgd3JvdGUg
dG8gQW5kcmV3LCBJJ2xsIHN0aWNrIHRvIHRoZSBkZWJ1Z2ZzIGVudHJpZXMgdGhhdCBhcmUgcmVh
bGx5DQpuZWNlc3NhcnkgZm9yIHVzLg0KQlRXIHRoZSBlbnRyaWVzIHlvdSBtZW50aW9uZWQgYXJl
IG5vdCByZWd1bGFyIGNvbmZpZ3VyYXRpb25zIGJ1dCBhZHZhbmNlZA0Kc2V0dGluZ3MgdG8gYXVn
bWVudCBkZWJ1Z2dhYmlsaXR5LiBCdXQgeWVhaCwgaWYgd2UgY2FuIHNldCB0aGVzZSB2aWENCmRl
dmxpbmsgdGhlbiBpdCBpcyBiZXR0ZXIgdG8gdXNlIGl0Lg0KTGV0IG1lIHJldmlzaXQgdGhpcyBm
b3IgdGhlIG5leHQgcGF0Y2ggc2V0IHZlcnNpb24uDQoNCj4gVGhhbmtzLA0KPiBTdW5pbC4NCg==
