Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9191DD00
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 12:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4021510E395;
	Mon,  1 Jul 2024 10:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="VpBYs86W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0310E395
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 10:47:36 +0000 (UTC)
Received: from rly05d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) with ESMTP id 461AlIWr084757;
 Mon, 1 Jul 2024 11:47:18 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) id 461AktQC075588;
 Mon, 1 Jul 2024 11:46:55 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by rly05d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 461Akqwt074836
 (TLS bits=256 verify=OK); Mon, 01 Jul 2024 11:46:55 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSdQKTVZ/Tj8bxknX8woUOIfkOAzucZKuGOlTPFGGg2h49YDzXC0c+Hj0rrAw7sFsAUj5DxOBnDixlqznMlBVd/yn+QgptYlRPjQQuWNESMzm2ZTvVFyBsrw7Fr822uSxa175Rc9IDwJ70bDra7Imu3FtU3du96TG4QUaAdlENjMmszKwXmS+mK78lGHaw1Uy2adPdB+DZu8WPWi+SAB1GyvDvKndorB4h66iKQKtyj2XNiFo/DC4JwdwAEmTt0xxLEs42Qq2XnSU+v5N1gc+JJi7EafyCfWgYh0VBOlF0F7v7y3ZQCzKKRAsAUbZ/LdQqSz/nKI+Q9LfpyGfzsSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy4JZgAcD8Kp5rjdxErV/dKsVM/m7uQd3wVXxzKereQ=;
 b=C49dKGIPstBW+4M/Ni0PEUi80LF9K8rsBXJwWL6cBoxJ2gQiA5IZU4jPuTTSnq1lfDbDpJaAjCxfDzitzU69tV3QJHBDVfkfclYXefLdD7rK+LUHP6HIGAbUKBoFZCwRp9FRgeJEP7s4JSzhSYQVlCK/uuZs5mmHqBU4Mt95EVH8gKtVOPzim1iQSQUastzwsdcBToGIxRv5G+scVVoWNpupWjgKR+oDOLrMylCzzobGCKg1qQaJq2aY8+ps3MLPkKCyBGfMKiw3w8cQlPG0J6Nz/PntHcT7kZN9zsXUq4hqiJ+q9Q2m+rsE+ayRs/PmxTmSA/m+RjiA+0LXlSZKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy4JZgAcD8Kp5rjdxErV/dKsVM/m7uQd3wVXxzKereQ=;
 b=VpBYs86WDOId+NOLtbIZR1TARllsEj53mG6H5lCYCcghf4Rk8Bw9veePGIndYePbOj+TXr9oGOJ3IeZTvp79J6IMlXVSgsqGJTcU4Rtod2rOJ97xorFjQPvfXXfIDgDxjyvKjvRy16ZiYHucVIf7e9lyTmiD+N43pRvd9rTuvCZiQPjONAkYXILPzagzaFidC+4bRf+iXAe5qoif2oF/ciKoWCWZLiQChAi0fQbiYmzWVrEU5Sr/NuxlVlauRcFfAdXpaZ552LaMhdX6bMOrKED8Y9mHggjG0eYhgnR/4/ysLJ2q9K0+d//PLQDiWcb3Qn1qAITO9p5TMqKptP7ivQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DU5PR02MB10848.eurprd02.prod.outlook.com (2603:10a6:10:525::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 10:46:49 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:46:48 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOACAA1hBgIABZPYA
Date: Mon, 1 Jul 2024 10:46:48 +0000
Message-ID: <a19d80d4-e452-461c-a060-2c94030301a7@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240630132911.GB176465@unreal>
In-Reply-To: <20240630132911.GB176465@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DU5PR02MB10848:EE_
x-ms-office365-filtering-correlation-id: a862af50-da60-4de0-eb31-08dc99bb1c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N0FMaDkzVkhZK0Z3MkVPcng3dXN5eHk1TnBlL0ZIays2RVVWenlGMmFBMDgv?=
 =?utf-8?B?amFUeUlseHg4QTNpcnpMaE13a29xdXJJdE5Qd3hKVFdUb1hhOXRhNllRM3pY?=
 =?utf-8?B?NENEOGhWc2RiVjhmQWkzSW8raFo4aUlsU0s1VUlkeTB1WTBadVByZWgvZHFu?=
 =?utf-8?B?UWt0UDdZM1pKUlM4eS9PVEVqYWs5UTViK3RvaHZjdEdXeWJWZUZ0bGd2K3VE?=
 =?utf-8?B?NnhJVmxIbEs3TnFzRjdRM0lzSEdxMkZGVXFVUmVJaFdic3Y1SlJwN0ZwVXlQ?=
 =?utf-8?B?NW5pVGRFeTdWME9ZOVBMSkNzd0lTMGRzYXl2ZUlLM3hUamJ2YUkrQWtZYm02?=
 =?utf-8?B?b3hEWEdqRTREZTBxekpzcUpOeHluNEJSTWdSQ2tBUlNOVUpPT2NNYWduL0xW?=
 =?utf-8?B?V3lRWExzN0o5QlhvTjd4M05NandUMGZqOGsyUWt2cC8zdnNFQ0ZRUGUvUkZ4?=
 =?utf-8?B?azM1bXNVTlhGWmEyN2FDYm42cG9SZjU3S2RmaXBLVitjODhZMTA4czR3TVFv?=
 =?utf-8?B?UlpoUzhQZ0d1VldkUEZOYTRuLy9zR3dkbFJKcmp6c0pIQ09HNUljMVk1azhV?=
 =?utf-8?B?YjdQamNWUXl4elJCWDhTL0RBUEhzaUNueWpDd2JFU0prY0JYMFlPaHN4WHlm?=
 =?utf-8?B?Ky9yNjIwRXJOTzF0Nng1TS9WNWM1VjNYa3dZTUIyZTIyNGNEa1pWbSs3SE5r?=
 =?utf-8?B?NWZJTHRPby9UbTJXbDYzUS9CUzRGMzVocmlmeVNSTGoxRTFNRmJSTktPMHlM?=
 =?utf-8?B?Z3RYNmJtZjVJVGd6bGVueTlLaTAwYkhKSldkZHhYQjNXbjJXVEladHdmWnJ3?=
 =?utf-8?B?R0hrMDAxSHR2aEtpbXArSVF6U0RtTUt5d3dndGlCdzZLV0t1SDNRMTFBa2NS?=
 =?utf-8?B?Mm1VeVFGYUhsVlRCYnI0Z0dmaDJISXJLMnR0R08wcFliMXUwUm05Q1FkN0hH?=
 =?utf-8?B?V29SUExpM2VtMmJTZEdROHdtdHJMZnEyTSt3L2x1YU9OQWg3dFdJU1d0d2VX?=
 =?utf-8?B?RXJXcWZsQXVHTUFyY1RxcE94aFRLT3J3YS8xN0d3TnN2MDljcGJkZUlrL0t3?=
 =?utf-8?B?S21xWmJIKzFna1kzMDloaTR2WTZZbGtZc0xVRTVhUjRzZGw4OXUrKzBGNWpS?=
 =?utf-8?B?WXAwNmRwUTFBRWo0endFZFFnRXYvajJJeUp4S25GbmJKRVFIYWxDODJuOHI1?=
 =?utf-8?B?K1FNeGFBOG5kTW9hWnQ5MWJrZE1MMVQ4NHEwS093bHVjTmpQM0pxTTVreVJN?=
 =?utf-8?B?cEZDU3Q4eTNEU21hZEVHRzNIV0R6LzFaY0dDSlZHWmpsMWpuUk1GV3dXNGZZ?=
 =?utf-8?B?UjhoNTdCU2h1RnN2dUhBYlloOU5NVCt4c3hOQitORlVJVEFyeEZvaW52b0E3?=
 =?utf-8?B?dHhXUWEvZHZ1UTUwZWpuM2EzL1lRRDVPLzd6VkUwZVpxVXVmY2NkTXE5QjhJ?=
 =?utf-8?B?YU15ZFhOWFFYbzZ4VXRsL2hLUDJybEhpWUMwSHpLVk5TNTBhM2dWV0xtcHpD?=
 =?utf-8?B?UDQ5blZrQzR6VHZEUFp3dXFHM3ZSR0QwTGJJbVREU1ZTNVFabHhwdU11NXhO?=
 =?utf-8?B?RG9oWWwwdFYwdXNxcnFnSFFMNmovd1A0MFV1bzllcGVuQVMxd1liRmJib3JY?=
 =?utf-8?B?TzhNL0FvOW9lNEl2V0kvRzAwVXM1QkpDNmhSNktPeGdKMTZrTG9Yb3hGZjUy?=
 =?utf-8?B?RnVybHpMazFsV0VhcCtpbjJ6eU93WGxrQXdsNDVKT21NanB5Um1HVmRERUFw?=
 =?utf-8?B?UDZUR3dzL0VLMFJhS2YzVWdWcXF2dTROMEcxQVNGTXNVcmF3ZjdkeGdvcmp1?=
 =?utf-8?B?YlRXNSs0NnBsUFBFaWRwWmFvRUIyTHgydkw5RzJ4VlFlWGJSNlhqRGpkRDh5?=
 =?utf-8?B?UWVHQ0M1MU4wQUpSbzc3WEhSN0dFc3U3bVdtZmZsSzM2R1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0o1NGhPbjk5eGg5a3JqMHZzRmh1Ny9XSUs1UnNoUytwUWNoaDBHNzN1bERJ?=
 =?utf-8?B?VFgwejQ1VTJRcWN5ZE1xY3VmK0RWTzJpL2J0aGYvNTcxSndGbFkzTitNYVlv?=
 =?utf-8?B?UjB1d0Nka255TEJvZm04YUJrMm1rdnp3azZzTXNtbWhzUXVtc1VHdjBReFB2?=
 =?utf-8?B?dGJaMUxDd3JYbFpJN3ZlTk16WXp2ZDk5UmlOdUhpS1d2WkJIL3FPUEt5elNn?=
 =?utf-8?B?NTNtOW9HUzRCSlF4V3BJL0NMZ0JBZ3F2dlUzd0xpMTMzdjFhSTk4U3FHcnVU?=
 =?utf-8?B?dXJJTTFodVN3aHZzWmFlSmp1MFZ5a1lqTjRGalVlbTE2b1R1RHEyd1Z2VGJV?=
 =?utf-8?B?aDNCSmtRQk90azg5SGNjclRNeTNheVRJcC9ydWVSd1E4dFM3ZGZLU2dxdlNI?=
 =?utf-8?B?SHA4MmZYMzUwZ2hpTnNRTk44aHFYR1VUS09tNWxwT0RNazRiR3VnRGY5SHdX?=
 =?utf-8?B?TTZ0K2svNDFhdjliR3ppZWFIR0lsODJqRjU3cWRnSjRESEtuSml1eGVYZ1Zt?=
 =?utf-8?B?OHU4YmJqcUZhN3VWcHFlSlMwaVZiOFI2UzQreXp2M241U0RYU0IzU1QzVWVt?=
 =?utf-8?B?ZHZNQk5WbkZ1S29uZm11ZEh4bDJwMGRKcnFwL09KbEp5SzdwSlFOYVhYaFpt?=
 =?utf-8?B?WkFZSkxncDkzTkRDSnlxUEtyVjUvcUVKNVZuNmNqc1NXR3U4OFFyb2dzLzg4?=
 =?utf-8?B?T3JmcjNZQTBMWkg0L2pMYWFKSzlRWDVxSml3cUxZL3VjQzZTYmo3bFFVeDdW?=
 =?utf-8?B?RXZGTHNqNm5iR0dKM0o5Wkx4VTlMMEl1YUY4b29mS1pQRmZkeElhSWZlNWlu?=
 =?utf-8?B?Vm9USHRSZFMyUVB6SVlYN2szOE5VZ0hrTFpGVXMwSGcrODZVS2c4YmVNYWlp?=
 =?utf-8?B?TERIZmI4VXBxNGhtTTdCVWdpYkdFVFh1UDFhNnlWa2ZXdFRlL2wvVDMvemp4?=
 =?utf-8?B?VE1OQW56VTFoUG1teWN3L0NqU1NhQ3VybDZ5aE5RZ0tWZnVWdzA3VXpNUVlV?=
 =?utf-8?B?VzkreGJ5TzQxcDJ4cHZwRGNkL05wa3VHOFB4OVNuSjBRR3NqaGR5M3Q1TVA4?=
 =?utf-8?B?U3UvK29XV1JoYnJVc2lkUWdkUURodWt4YmhhQ2lBY3djS3VoTjdycG9mZC9q?=
 =?utf-8?B?MkFTcU9JMWVPMVQ3ZWg1b3VYeVdudTcrdVA4SVVUZmE4QTY0VVNpaWh5city?=
 =?utf-8?B?amRIN0c5QmpsaVh2RWxnUThKUW5GamhqT1hYOGVBWjAxeWRiN2pGWTA4UjV3?=
 =?utf-8?B?bm1vNnpaUkRvbDJEWldpNGFUaWJ4RDdZcjI3WWhrRThTeUFudnBBWCszNWNI?=
 =?utf-8?B?MjArVUppL2gyOGtyMVBVT29wS2NpeWVmRGk3YllCalF5TjI5Qm1nR0RHSS9i?=
 =?utf-8?B?bldGczFMSWxLbmEwS2NhMW1VTXdMVityNTkwQzBydTVZRUF6WXVtelZpMGxh?=
 =?utf-8?B?cndTY2dyZ25JZDhLckEwbDBjd1dldHBXemRiU052bVh4S1lxdDJrOTlBcnF2?=
 =?utf-8?B?YUcwSXY0V3Y2WnlrZFc3MHJOZE1MZXQ0c0F5ZytZTE4zMDl1bk50Nzh1V2Zq?=
 =?utf-8?B?Z2FKRjQ3OHYrekR3YnlzeS94SDlRYkRscERFS0sxUUlYQ2VmZzlicFZWVFJR?=
 =?utf-8?B?dy9oeXF5eGhWNENQdC9UcHM4dHhMenZjMU95VUpLdlg3aFhaSWw4akdVRzdk?=
 =?utf-8?B?aUo5UG8rSE04YnRGSStWbTU5TWNteDJJbFRKbFdPb3R3R3UzbGI0dDlTbUlU?=
 =?utf-8?B?OFI5dnZ6QzVEYUx6Q1FrK0hEK3lrbmxxMWpkUDRFYlV3NFBJOXkyd1E3TTlT?=
 =?utf-8?B?Q1NtdGlrZ05LaEVJbGd2WGozMGl0QkREaU9MS0lZajVDZWx1dmJObzdmNVNV?=
 =?utf-8?B?TC95eW14RlJ6YVdZc3M1azhDZ2V2QUNraG5yTTF3RmQzNXEyNDJRNnJBcVov?=
 =?utf-8?B?cEV0UHViZThzc05WQkRRaXJxK2M1ZCtRZnNJZjhTVmk3NU44U0VhRk9LcGVz?=
 =?utf-8?B?TlN0TW56Zmk0dHozWG0zVEdPUjNoVlVwakZVL2dEd3Q0QkMvdWkva1FwMko4?=
 =?utf-8?B?NzdiQVpkYWdOVjB0eHBYWDF4R3NNM1hheERzSTZFMUZBdXJFTWxBdWNjR3dD?=
 =?utf-8?Q?IZmutw+k2P7LNztUmGAi/loHq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <465BFEAF1B1850488CB3EBD5AA786FAE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zWiRs0svE3ZZaP95OWLkuEX826zgBczTFmIZwcbwDbEp4BV7UU2oQ7yxYp3rMOOjKx3nn3At07GyDrpmkCQ7LcmjED4ZmhF+9zRO+fo8+Y59g1NiR9wYX1k2l8jY9RhnwJPeaVB5FkWVG7TbK4f7TIMxu78cWvyHr6qRSA7HUsBanS0KV95B8SVeik3VPE1QngMef40PTGvM7xA85P2XWjkwa2fYTCa+B0ciGj/MRIa7gnUWtIPItK0qhqSvg8dTyEjLxTUOZ3ox27WEezFvU+j10v9MXKEl7IbKv6g7y+htLL7NYnDlhaDvhp0QcI0z2a3+5hFFmU92leVLAHk2jnBj6giGixdsfA21ffqu3VnghM7xKVSk32UYm3g9fNbHzNJB/3+h5E5u6c1PzLjOUOchbImR9N8b8m2tyI/cr+b9++UwgDrAaUaCO8qJ23upBYlGqmrYYJ04SSeDtgLLsa6gjepkxqjEkT57/Bi8qKLjkUS0YY2Z5OwF57anceKrPE7/x6fGx7E1yfY1t/KkDFjEpka3ei6AWZzzSEi5woiC7EXx8QCpZ24Q04Aa3SaUo933lnkJ3DVJKP89AZ8u4Fjists1JGh3lLc0wSpjEvofcJ5io4u1+mPd44fGWWJR
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a862af50-da60-4de0-eb31-08dc99bb1c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 10:46:48.8840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e11bKxwQXJYWdWYoClc9TyJk+jhplguOeWYDOn8spli/4Zrlfnvnazd2oWY7/oi+Yg34U7SOGdl+GNbRqLGO9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10848
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTgzMDg0MDpGUEtleTEucHJpdjpWbKF8YIiOhTOCjzxGd2/9kNQ7aEmNSP+oFcdVxQhRnbA8lmxg9m5KTmLZJir2dR6VOH+6FPJ56Ezl1hTBrhpcmRDS1H8Gvw3SdIRaZTXBY2+0oVU2LeIH+9irFavXzMJ6mboNd6Xen5Tr1PlWM/PmReYZlT+voLqarIA8sLcup8cBrSR7qPVOSL+wpkYloF4MxxT/ngRu2EhJRyMl7zYYk2TVvG0a6xzuyG0kZBG4bl0vZYWiYa5Yp4kSczMtDo9Uh2hZUSroxhEp0Hpsjj7ImVfDeuUL/RZIYNRwqmvbc/F1A+rMw2UeUTWPGPh0YUwkVfWgodtKMFNHSDEtQ63f
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.115
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

T24gNi8zMC8yNCAxNjoyOSwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBPbiBGcmksIEp1biAy
OCwgMjAyNCBhdCAxMDoyNDozMkFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA2LzE5LzI0IDEzOjUyLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4gT24gV2VkLCBKdW4g
MTksIDIwMjQgYXQgMDk6Mjc6NTRBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+
PiBPbiA2LzE4LzI0IDE1OjU4LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4+PiBPbiBUdWUs
IEp1biAxOCwgMjAyNCBhdCAxMTowODozNEFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6
DQo+Pj4+Pj4gT24gNi8xNy8yNCAyMjowNCwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPj4+Pj4+
PiBbU29tZSBwZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQg
ZW1haWwgZnJvbSBsZW9uQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBh
dCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPj4+Pj4+
Pg0KPj4+Pj4+PiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAwNTo0Mzo0OVBNICswMDAwLCBPbWVy
IFNocGlnZWxtYW4gd3JvdGU6DQo+Pj4+Pj4+PiBPbiA2LzEzLzI0IDIyOjE4LCBMZW9uIFJvbWFu
b3Zza3kgd3JvdGU6DQo+Pj4+Pj4+Pj4gW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1l
c3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbGVvbkBrZXJuZWwub3JnLiBMZWFybiB3
aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IE9uIFRodSwgSnVuIDEzLCAyMDI0
IGF0IDExOjIyOjA0QU0gKzAzMDAsIE9tZXIgU2hwaWdlbG1hbiB3cm90ZToNCj4+Pj4+Pj4+Pj4g
QWRkIGFuIFJETUEgZHJpdmVyIG9mIEdhdWRpIEFTSUNzIGZhbWlseSBmb3IgQUkgc2NhbGluZy4N
Cj4+Pj4+Pj4+Pj4gVGhlIGRyaXZlciBpdHNlbGYgaXMgYWdub3N0aWMgdG8gdGhlIEFTSUMgaW4g
YWN0aW9uLCBpdCBvcGVyYXRlcyBhY2NvcmRpbmcNCj4+Pj4+Pj4+Pj4gdG8gdGhlIGNhcGFiaWxp
dGllcyB0aGF0IHdlcmUgcGFzc2VkIG9uIGRldmljZSBpbml0aWFsaXphdGlvbi4NCj4+Pj4+Pj4+
Pj4gVGhlIGRldmljZSBpcyBpbml0aWFsaXplZCBieSB0aGUgaGJsX2NuIGRyaXZlciB2aWEgYXV4
aWxpYXJ5IGJ1cy4NCj4+Pj4+Pj4+Pj4gVGhlIGRyaXZlciBhbHNvIHN1cHBvcnRzIFFQIHJlc291
cmNlIHRyYWNraW5nIGFuZCBwb3J0L2RldmljZSBIVyBjb3VudGVycy4NCj4+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT21lciBTaHBpZ2VsbWFuIDxvc2hwaWdlbG1hbkBoYWJh
bmEuYWk+DQo+Pj4+Pj4+Pj4+IENvLWRldmVsb3BlZC1ieTogQWJoaWxhc2ggSyBWIDxrdmFiaGls
YXNoQGhhYmFuYS5haT4NCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQWJoaWxhc2ggSyBWIDxr
dmFiaGlsYXNoQGhhYmFuYS5haT4NCj4+Pj4+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBbmRyZXkg
QWdyYW5vdmljaCA8YWFncmFub3ZpY2hAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgQWdyYW5vdmljaCA8YWFncmFub3ZpY2hAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4+
PiBDby1kZXZlbG9wZWQtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBoYWJhbmEuYWk+DQo+
Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBoYWJhbmEu
YWk+DQo+Pj4+Pj4+Pj4+IENvLWRldmVsb3BlZC1ieTogRGF2aWQgTWVyaWluIDxkbWVyaWluQGhh
YmFuYS5haT4NCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWVyaWluIDxkbWVyaWlu
QGhhYmFuYS5haT4NCj4+Pj4+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWdpdiBPemVyaSA8c296
ZXJpQGhhYmFuYS5haT4NCj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU2FnaXYgT3plcmkgPHNv
emVyaUBoYWJhbmEuYWk+DQo+Pj4+Pj4+Pj4+IENvLWRldmVsb3BlZC1ieTogWnZpa2EgWWVodWRh
aSA8enllaHVkYWlAaGFiYW5hLmFpPg0KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBadmlrYSBZ
ZWh1ZGFpIDx6eWVodWRhaUBoYWJhbmEuYWk+DQo+Pj4+Pj4+Pj4NCj4+DQo+PiA8Li4uPg0KPj4N
Cj4+Pj4gbWx4NSBJQiBkcml2ZXIgZG9lc24ndCBleHBvcnQgYW55IHN5bWJvbCB0aGF0IGlzIHVz
ZWQgYnkgdGhlIGNvcmUgZHJpdmVyLA0KPj4+PiB0aGF0J3Mgd2h5IHRoZSBjb3JlIGRyaXZlciBj
YW4gYmUgbG9hZGVkIHdpdGhvdXQgdGhlIElCIGRyaXZlciAoYWx0aG91Z2h0DQo+Pj4+IHlvdSds
bCBnZXQgY2lyY3VsYXIgZGVwZW5kZW5jeSBpZiB5b3Ugd291bGQgZXhwb3J0KS4NCj4+Pg0KPj4+
IFllcywgSUIgYW5kIEVUSCBkcml2ZXJzIGFyZSAidXNlcnMiIG9mIGNvcmUgZHJpdmVyLiBBcyBS
RE1BIG1haW50YWluZXIsDQo+Pj4gSSdtIHJlbHVjdGFudCB0byBhY2NlcHQgY29kZSB0aGF0IGV4
cG9ydHMgc3ltYm9scyBmcm9tIElCIGRyaXZlcnMgdG8NCj4+PiBvdGhlciBzdWJzeXN0ZW1zLiBX
ZSBoYXZlIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlLyBmb3IgdGhhdC4NCj4+Pg0KPj4NCj4+IFdl
IG5lZWQgdGhlIGNvcmUgZHJpdmVyIHRvIGFjY2VzcyB0aGUgSUIgZHJpdmVyIChhbmQgdG8gdGhl
IEVUSCBkcml2ZXIgYXMNCj4+IHdlbGwpLiBBcyB5b3Ugd3JvdGUsIHdlIGNhbid0IHVzZSBleHBv
cnRlZCBzeW1ib2xzIGZyb20gb3VyIElCIGRyaXZlciBub3INCj4+IHJlbHkgb24gZnVuY3Rpb24g
cG9pbnRlcnMsIGJ1dCB3aGF0IGFib3V0IHByb3ZpZGluZyB0aGUgY29yZSBkcml2ZXIgYW4gb3Bz
DQo+PiBzdHJ1Y3R1cmU/IG1lYW5pbmcgZXhwb3J0aW5nIGEgcmVnaXN0ZXIgZnVuY3Rpb24gZnJv
bSB0aGUgY29yZSBkcml2ZXIgdGhhdA0KPj4gc2hvdWxkIGJlIGNhbGxlZCBieSB0aGUgSUIgZHJp
dmVyIGR1cmluZyBhdXhpbGlhcnkgZGV2aWNlIHByb2JlLg0KPj4gU29tZXRoaW5nIGxpa2U6DQo+
Pg0KPj4gaW50IGhibF9jbl9yZWdpc3Rlcl9pYl9hdXhfZGV2KHN0cnVjdCBhdXhpbGlhcnlfZGV2
aWNlICphZGV2LA0KPj4gCQkJICAgICAgIHN0cnVjdCBoYmxfaWJfb3BzICpvcHMpDQo+PiB7DQo+
PiAuLi4NCj4+IH0NCj4+IEVYUE9SVF9TWU1CT0woaGJsX2NuX3JlZ2lzdGVyX2liX2F1eF9kZXYp
Ow0KPj4NCj4+IFRoYXQncyBob3cgb25seSB0aGUgcGFyZW50IGRyaXZlciBleHBvcnRzIHN5bWJv
bHMgdG8gdGhlIHNvbiBkcml2ZXIgc28gdGhlDQo+PiBJQiBkcml2ZXIgaXMgYSAidXNlciIgb2Yg
dGhlIGNvcmUgZHJpdmVyIGFuZCBzbyB3ZSBjb3VudCBvbiB0aGUgaW50ZXJuYWwNCj4+IG1vZHVs
ZSByZWZlcmVuY2UgY291bnRlci4gQnV0IHdlIGFsc28gZ2V0IHRoZSBhYmlsaXR5IHRvIGFjY2Vz
cyB0aGUgSUINCj4+IGRyaXZlciBmcm9tIHRoZSBjb3JlIGRyaXZlciAodG8gcmVwb3J0IGEgSFcg
ZXJyb3IgZm9yIGV4YW1wbGUpLg0KPiANCj4gQmVmb3JlIHlvdSBhcmUgdGFsa2luZyBhYm91dCBz
b2x1dGlvbnMsIHBsZWFzZSBleHBsYWluIGluIHRlY2huaWNhbA0KPiB0ZXJtcyB3aHkgeW91IGFi
c29sdXRlbHkgbmVlZCB0byBhY2Nlc3MgSUIgZnJvbSBjb3JlIGRyaXZlciBhbmQgYW55DQo+IG90
aGVyIHBvc3NpYmxlIHdheSBpcyBub3QgcG9zc2libGUuDQo+IA0KPiBUaGFua3MNCg0KRmlyc3Qg
b2YgYWxsLCBhcyBhIGdlbmVyYWwgYXNzdW1wdGlvbiwgZXZlcnl0aGluZyB3ZSBkbyB0b2RheSBj
YW4gYWxzbyBiZQ0KZG9uZSB3aXRoIHVuaWRpcmVjdGlvbmFsIGRyaXZlcnMgY29tbXVuaWNhdGlv
biBvbmx5LiBJZiB0aGUgcGFyZW50IGRyaXZlcg0KY2Fubm90IGFjY2VzcyB0aGUgc29uIGRyaXZl
ciBkaXJlY3RseSwgdGhlbiB3ZSBjYW4gaGF2ZSBhIGJsb2NraW5nIGNvbW1hbmQNCnF1ZXVlIG9u
IHRoZSBwYXJlbnQgc2lkZSB0aGF0IHRoZSBwYXJlbnQgZHJpdmVyIHdpbGwgcHVzaCB0byBpdCBh
bmQgdGhlDQpzb24gZHJpdmVyIHdpbGwgZmV0Y2ggZnJvbSBpdCwgZXhlY3V0ZSB0aGUgY29tbWFu
ZCBhbmQgdW5ibG9jayB0aGUgcGFyZW50Lg0KVGhhdCB3aWxsIHdvcmsgYnV0IGl0IGFkZHMgY29t
cGxleGl0eSB3aGljaCBJJ20gbm90IHN1cmUgdGhhdCBpcyBuZWVkZWQuDQpUaGUgc2Vjb25kIHBv
aW50IGlzIG5vdCBuZWNlc3NhcmlseSBhYm91dCB0aGUgZGlyZWN0aW9uIG9mIHRoZQ0KY29tbXVu
aWNhdGlvbiBidXQgbW9yZSBhYm91dCBnZW5lcmFsbHkgdXNpbmcgZnVuY3Rpb24gcG9pbnRlcnMg
cmF0aGVyIHRoYW4NCmV4cG9ydGVkIHN5bWJvbHMgLSB3ZSBoYXZlIDIgZmxhdm9ycyBvZiBmdW5j
dGlvbnMgZm9yIGludGVyIGRyaXZlcg0KY29tbXVuaWNhdGlvbnM6IGNvbW1vbiBmdW5jdGlvbnMg
YW5kIEFTSUMgc3BlY2lmaWMgZnVuY3Rpb25zLiBUaGUgQVNJQw0Kc3BlY2lmaWMgZnVuY3Rpb25z
IGFyZSBleHBvc2VkIGFuZCBpbml0aWFsaXplZCBwZXIgQVNJQy4gSWYgd2UgY29udmVydA0KdGhl
bSB0byBFWFBPUlRfU1lNQk9McyB0aGVuIHdlIGV4cG9zZSBBU0lDIHNwZWNpZmljIGZ1bmN0aW9u
cyByZWdhcmRsZXNzDQpvZiB0aGUgQVNJQyBpbiBhY3Rpb24uDQpBZ2FpbiwgdGhhdCB3aWxsIHdv
cmsgYnV0IHNlZW1zIHVubmVjZXNzYXJ5LiBXZSBjYW4gY2hlY2sgdGhlIEFTSUMgdHlwZQ0KdGhh
dCB3YXMgcGFzc2VkIGluIGVhY2ggZXhwb3J0ZWQgZnVuY3Rpb24gYW5kIGZhaWwgaWYgYSB3cm9u
ZyBBU0lDIHR5cGUNCndhcyB1c2VkLCBidXQgaXQgc2VlbXMgdG8gbWUgbGlrZSBhbiBpbmNvcnJl
Y3QgYXBwcm9hY2ggdG8gdXNlIGV4cG9ydGVkDQpzeW1ib2xzIGZvciBBU0lDIHNwZWNpZmljIGNv
bW11bmljYXRpb24uIEVYUE9SVF9TWU1CT0xzIHdlcmUgbWVhbnQgdG8gYmUNCnVzZWQgZm9yIGRy
aXZlciBsZXZlbCBjb21tdW5pY2F0aW9uLCBub3QgZm9yIHV0aWxpemluZyBkZXZpY2Ugc3BlY2lm
aWMNCmNhcGFiaWxpdGllcy4gRm9yIHRoYXQsIGFuIG9wcyBzdHJ1Y3Qgc2VlbXMgbW9yZSBhcHBy
b3ByaWF0ZS4NClRoYXQncyB3aHkgSSdtIHN1Z2dlc3RpbmcgdG8gY29tYmluZSBib3RoIGV4cG9y
dGVkIHN5bWJvbHMgYW5kIGZ1bmN0aW9uDQpwb2ludGVycy4NCg==
