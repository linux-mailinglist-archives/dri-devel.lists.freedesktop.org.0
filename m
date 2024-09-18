Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7B97B6E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5DB10E515;
	Wed, 18 Sep 2024 02:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bQ2CIOqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2066.outbound.protection.outlook.com [40.107.117.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B09110E514
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTFG3A5B50wLmWTe9P3haZYK7QPcxBMo9DL90LWPwWfwN7dx3yKlKkX/g63ohveODZ34E62h+Jg7pkV0jixtqupLki15z1/ez/n8AJk9VSFSxRj5N4OvhzsYdXebND9Mx/wSDJfTYSwdxwFib1bwvAIrtuGEe2xwCb0sTEoNRfLdDXWmj0YJm0RIVrLDcwC+KbQuefoLjA9i8g9r7WcsBLGasSy8cqgA8kWhipYaorcxVn2z6345IeirW3JJeY8rrIGUNHcXatqIe6rX7BpjkaYkW9YfEr5dqlLPO/S+HT2zBGysYpeMQBgFxjG3Z6lq6mHXrzwcdkN+iTFYEWpZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLKPo1EheqMI5ggviZniCHFiZAO5fXmoSEx1z0ZNRBs=;
 b=zOzOz4BSGz76N5W37JLRAO0K+xpKEvK0uMmd93iikhjAgJMjsDzZaxGbrz7t+1bxOACIYkv3aH+iKD3iwZh04kMiwRVCMdK61xUjUdiIAgO1UnNLbEXCOYOYUhW51ce2MRm6ClVmFGepnFqgGeCQqrYdDMsMi/QnRxr4eyPqqRrGKr2yNjYmH4PaWxPwVgagwv0yhcFr8bReqaeGsFuDrlhBJ3fEsqDo7Rntv1/I3jH1QIYdJ8RXGecEB05v0SqtL0OG33stweTQb5nLO1OlGUm3CwTpA6OmcjlKMUnplB6NEnH9Nz6uCuTLJExRcGfTlNiCanbjY8oF1yoAMhWzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLKPo1EheqMI5ggviZniCHFiZAO5fXmoSEx1z0ZNRBs=;
 b=bQ2CIOqfiSaMe6J2TK5RIqjdP1FHOH0Ji+sk/ZgHAzWoE8UoeIiLT6QpBFGSHpqSKgr0mIQfPGwYCHKqROXe8fLRXGuMpIqB8ntwLxYAC7uRv17ljeGEwPmrLpnMD8rz0ylbj29iJtOuRdI9JLvN1MgRUbqp4TBaUKWSIy3e3R01t08k7TDBF4BX3v0IyxvLaDTpFedpYcYvPnO823lfTIKKZY5wiy1ebdQDlF0HTNI7GP69B7uGR1ul/vV2TSdMGNcByKVVz8TFqDqy6Z73RHqtgq7HyVTmvh15mLXxG9N84Z6zkh4aYLMYbs0bKdK8hfBWMkrZPupuSJljK/aJ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:52:50 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:52:49 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 0/7] udmabuf bug fix and some improvements
Date: Wed, 18 Sep 2024 10:52:23 +0800
Message-ID: <20240918025238.2957823-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b667b7-545d-4086-9b90-08dcd78cfb72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dStGWk1heWNPcVF6UVVuMlBXV1AvNjg1RDRYd0ttckNIN1NTRVRCeExyMjVR?=
 =?utf-8?B?MHFSTDl1VHlTaTNnK0t1cWhMSlF4N091TG8rbU9IRjdPWHM3Rm84VGxLODF5?=
 =?utf-8?B?OE1ZMW9ZWGIxNG5mcldpdVR6L0xDWGF6MVlvNlFncHJiL2laelV0WkQ5TU5N?=
 =?utf-8?B?Vk4vbk9UOGgweEFLVUxVUCtsMDdpZkQwd2xBMlBIUUlvMXlLSXB6eVpFeUxV?=
 =?utf-8?B?YUw2THRmYUcrbU9uaTdHQU1kbWpMZlJKV3BiYzdNTjEyOUZsc2MzdkNXVnRO?=
 =?utf-8?B?R3lIaWU4NE03aDBCS1JDZTZsOE9LaUdyb1R1RHM3NW1NSlYwc01iRjlGUERv?=
 =?utf-8?B?NU5CQ24wU25jQi9SS1ZYSUVYcTU3U2tKdnNCT0gxOXZUOFFHaUVZeHNtTHdI?=
 =?utf-8?B?VXZGWVVSOEFsejN6MzJ6QjNlb3JmdFhmazJqNkw4LytLbmc1VWR6RTg3Mkxy?=
 =?utf-8?B?L3dQc3lTWVkzMkFOM3gzUXU2QjBZQVdqSUU1OVhFRjBUN05FK2FhNnNqZ1hC?=
 =?utf-8?B?Y0NVckRJZzdpQ1dubHVDK0dxeTBvYmcxY1NIcUlCNStoTVN2ei9wQzBmU0wv?=
 =?utf-8?B?MldLQnM2bzNmRzJ2c2RUNDZucHJjbms1MnZYMUJ3WDc0SGlYSXR5V1NKR2xm?=
 =?utf-8?B?OURGMW53WEV4RGIvZkl1TE5vTmplU3lxQWZKNmVyV2ZSMnV4OEcrSjN3eE53?=
 =?utf-8?B?QzZtM1NSUGw1em1pZVpxNjFsOEJkUjRtNG1wV0crSkdwbUQvOXNDSXIybzFr?=
 =?utf-8?B?ZmVxaUtMU3VrcVhnbnBiNWtKUWNybFJJNnZjc2tXZlVIaXArUXo5OXFtWnM2?=
 =?utf-8?B?ZmZuUS9ESm54d0lpeERzcDl4UnBMMks0aVh6UmlXa1dxM2tINFMyWXMxdjdC?=
 =?utf-8?B?b2ZsbEgwbWptWnpkUktCQS9ESlNTalVzQ01kQ2RJOGx0aFVLSU1JZFVwZFhM?=
 =?utf-8?B?UmlaR0M2K1hiZnc0UEt0RURnSWVzQzZvUHY2WW4wQStXcXlrV0JFUy9PeGFW?=
 =?utf-8?B?N1hHc2xWYmpQeUM5WDIvRzdESEJpMElyQ3Zwa2lMNG9ZOSt3akppRFZJSWJl?=
 =?utf-8?B?VVZ1NHQ0ZEYrNDJhaldMY2RjbkQ1T2E3SEo0ZldjQnMzMjI4Z0ZaRmFZZFda?=
 =?utf-8?B?a20vOW16UHJBMU4raUhKcnVxb3VVVU1aZjZVK1IraUhNK2VnMXJGUmZDVm01?=
 =?utf-8?B?YWZISTNPRThIWWNMVjdqcVFhanUwL1FMMFVTSWluS0RtRGl5NWdvVmF3dENC?=
 =?utf-8?B?TGJVTUQzRUhOV1I4Q2VpbUZURVlZQms4bnZMck9MOXBDK0ltU21ZRkE0VXRr?=
 =?utf-8?B?ZTdBaXlGYlI5K0l6alJOUGY2M2FWQ1V2dGppbWQ2dHUxT1Y0ZVRYc0NiOTNF?=
 =?utf-8?B?QmxoM0lKbEJIS1Q2dFhCQ2VCdW5va1RCVlZVVXdsenBWK0lQWCt2eGpTNWU5?=
 =?utf-8?B?VmhQZlZuaFBPWG9xQjVSTE4vY0ZiQUoyRlhwb1Y5cTY1U3h5cDdsNDN2U2c3?=
 =?utf-8?B?ZEpRSjlhaEZ0U2N3aWQ5NkJOS3Uxd3Q1QmpsT2dGcGM3bmJOK29VM01IdnFB?=
 =?utf-8?B?QngzWVlyUjVRMEprQTVBUTRuS3RQN1p6RlpQTllMMGFaWkJLa0J4cHZwSHVn?=
 =?utf-8?B?LzNJRU5rejN2TzEvUjFxSHF6RUd1WWoxMjdvRno4bWRnaFZLODl5dVRVa2xu?=
 =?utf-8?B?ZGg1dVR4eEJjYnNnREd6OW1kclk5aHAvVnh3KzJHR3JGQzBPdTRGTWZUelNz?=
 =?utf-8?B?RW5RZndvSThPLzlYVmxVQzRsM2w0WVh5QzRQV0JlWHZWcm1GM2tGVFBDdHBq?=
 =?utf-8?B?ZFBMQ2VUN09oTWNiTXI4L0pSa1gveWU1SS9ld0p3ME8vU1hQVnZnYy9hVXRj?=
 =?utf-8?B?cHV1dy8xeUZGc2M5WWlEQ0Q1Ukl3eGZxOXhLWlZxVXFXSHVRbTNCZVRhbGNX?=
 =?utf-8?Q?gkGSfrAF2ZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnY4TXRhM05kb1RsTGxmUFNvcVpISU95ekJsR2VKTjRRQy9OaHRHN3RGbFJm?=
 =?utf-8?B?eTAyTU16UzRDenBSL1gvNldqcER6cmFjS0R3NmJycFk4a1lOMUtXWnNacFVn?=
 =?utf-8?B?eWRaRDFwT2FRcFVyOWNzUm5sNDBJdGIrUUIvblg1UHQ4ME1RK2VXSjJOeEVz?=
 =?utf-8?B?TmVFcUNXaWwrcWJWK25IRjEwMG92dklxS1RhbTJ0Ly94Vk5paFQvRzFrK2pI?=
 =?utf-8?B?eGZ2MUkrYW8rQ09kSkt4VlNqR2xmOGd4UmorZ21VRzBhZ2NycHBIaXRhSlNN?=
 =?utf-8?B?eGZSVVFaTVowYWxwLzNFNjJhNWFwRG5kSFpqU2xIckY1Q2MrWUU3VGJxa0cr?=
 =?utf-8?B?cWdtWTd3RUpyRnlNVmJGWmo1dDgzZGV4QXZsMXQvV1hFUW5WR3h0UEt5VzNh?=
 =?utf-8?B?VHJjeUR2bzNBQnl3ekswQi9LY1VzTFdqbmdJTE02YnFYdFhXV3FBNkFSa0NB?=
 =?utf-8?B?U3ZoOUVMQkN4czd1Rkw4emg0OG83UzNiRDg2NmNGNU92N1hLTkNHRm52SHg1?=
 =?utf-8?B?Wk5VVnNUYUVRVlNpbEFJbk16eDFNVE1EZXMvUVlVbXZqQ044c201OE1IQkJy?=
 =?utf-8?B?ZTdBdFR3cTJ3V3Y5VW1QVFlEZ2V3djB5VkdMQTdnL09vYmNtak9lNjlWTjhk?=
 =?utf-8?B?U0RqT1RKTEFpMUR2SEdCVkQ4dmlsWkEyNDlTQVBMRXU3RnhGZEpCaEJIaU15?=
 =?utf-8?B?cFNYMCtJNDVOVEtHdGtGaVl5TUF5TXp1aHVtczRxNk40aVE2SjlpdlJVa0Rl?=
 =?utf-8?B?SzNjUkgxZVZVdVF2dU13NFY0dVhnckZQNlFQMXBaS3BjVkhjZHJpODFtSlBw?=
 =?utf-8?B?ekRVVmtjQVlsajFHQlRRZlJWcnlkNlZMQ3N3b1JJeVhMMy92NCtxWDFsenkv?=
 =?utf-8?B?VVJYVWtPSVYrWmdJbVNhSlhKOWlNY0pWZHM4OVhpWEhkYloxbHl5Z3VrVmpy?=
 =?utf-8?B?UXN6ZGlMa2VqSGgvWjJvQnFpSnhVT2JjYUxIYlpqOEVBdTNUNmpLOU1LeHdQ?=
 =?utf-8?B?L2wzVXF6ZUlhWCt3dG5jME83TkNDcXhrNFc3UmIzT08wSnJoNkNxeCs4enRr?=
 =?utf-8?B?MVhka25MSzlTZVc2Qk4zVThJY1I5SFNFWFZkZlhvZDZtOXBSbkpsUkdnVGtU?=
 =?utf-8?B?SVVNaDh3TjJVL0MydlJhT2ZCd2V1R0lLYW1EVmkvd0w4RWMrbFFRQWJML1V0?=
 =?utf-8?B?UnZobjJOMU52T05pL3d5OERDOVVWSXVWTEhlOUo2bkREcW1WR3hqN0w2SFp3?=
 =?utf-8?B?bEFkWWtLT2R3OFlRaTR0WEVra1p1c29Wem1peEJhcTlSOS9ab3N0T2tVaEd3?=
 =?utf-8?B?RTVwc3dsNkRvYU5iZENCVUNoK1U4VDVSaktpQlZzcmNTMU9acHlYMHdxc0dZ?=
 =?utf-8?B?WXFDV1VlM1hUdGg5RlBPNUxTRVI1Z01mbmg5ZWhNMUtpdStlN0h3eDZFWEFZ?=
 =?utf-8?B?TGpuUnVJM0pyUzF1N0Jrc2VJdFpaV2dTZHREbmJaTmMyWDF1OE5DZk1Rbk9t?=
 =?utf-8?B?eUpyRHJTbWhHQkR0eWpXMzdXKzM5dFpkTFhBY29UdmdCSG84SHhLMXZJeUpq?=
 =?utf-8?B?ajR0WWY4Nlc1S2FvMG55NDRlU3JoY3BVRS9EdzdVUFpzWWxFa1d2ZEdKNDJZ?=
 =?utf-8?B?aDhmZVpzdkw0Lzh2SmFFZ1JWWlBiS3ViaFlEQUN0WHpBNm15cW1NcStieGJr?=
 =?utf-8?B?THhDbUIzY05uRVIxMk1lazlWYTlQcWFXcW9LZkJEODFGdGJCRkl0NjNFcllE?=
 =?utf-8?B?Ujg0OGE4ZS90NHNib3RiUWNlR3FndlU3TWc5VnI4bkloL1llaE13Mm1aaUx1?=
 =?utf-8?B?SXJmajFMT2FLdWIrbS9uNG9waVIzcFNuL3B5Q3JMN3FZLzF3V21teHVvVllC?=
 =?utf-8?B?V3pQUW9IN2ZoVjkyMnROTERUZFp6R0ZzNlQ5S2Q0cjU4YXgvRHhvN3ZQall5?=
 =?utf-8?B?U1hCaHowVkdrQnpFMVdlR29ZZ0ozK20yMWYydUhiaGMrdUE0d3RubDVGeGFD?=
 =?utf-8?B?bXhzMmJsQnIxNkhjdTNpUExnRi9qNnhHRGRLd1BzVXNOaEFjN2pmUVF3ekxr?=
 =?utf-8?B?Q3QyanlaZFQyTHFBNk1TenIrRWZBWVU4TDV5MFlvY1dSMW15VkhaVGxKd1Vo?=
 =?utf-8?Q?ddEwVYzjN/LauzH+fcG4dYcW6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b667b7-545d-4086-9b90-08dcd78cfb72
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:52:49.6318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bklQZjpiWwQC8/iavZgLHevSQEFRqmKzjlEfSnCADZOg1VkNyTNkTtEM/VWm8ikkdzt2tPnZIBFBpfQrFYTmcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

This patchset attempts to fix some errors in udmabuf and remove the
upin_list structure, also try clean up code.

By this patchset, udmabuf remove page struct relay, only use
pfn and folios.

Some of this fix just gather the patches which I upload before.

Any patch has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Patch6 modified the unpin function, therefore running the udmabuf
self-test program in a loop did not reveal any memory leaks.

Notice: Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Changelog
===
  v6 - > v7:
    A little change, update some commit message.
    Patch3: add fixes tag.
    Patch4: update ack tag, remove the redundant if (!memfd) check from
            check_memfd_seals(). update commit message.
    Patch6: update commit message to describe how unpin array worked.
    Patch7: update commit message to describe why need reuse the folios
            array.
  v5 -> v6:
    Patch1 use Vivek's comments(thank you), fix code style, update ack-tag.
    Patch2, 3 no change.
    Patch4 fix memfd miss fput, use Vivek's comments(thank you),
           fix code style, update suggested-by.
    Patch5 update ack-tag, fix error word in commit message.
    Patch6 update ack-tag, use xmas style.
    Patch7 update ack-tag, remove unused ret variable.

---
  v4 -> v5:
    Patch1 doc why pre-fault failed not report error.
    Patch2 no change
    Patch3 update ack tag marked in v4
    Patch4 split some change into patch5 and patch7, this only contains
           udmabuf pin folio's function
    Patch5 add helper init/deini to clean udmabuf struct initialized
    Patch6 remove unnecessary code
    Patch7 remove reuse folio remove v4 patch4

---
  v3 -> v4:
    Patch1 fill vma area with pfn only when true access.
    Patch2 no change
    Patch3 select VMAP_PFN
    Patch4 use function pin each item.
    Patch5 use pinned folio array instead udmabuf_folio struct.

---
  v2 -> v3:
    Patch1, avoid use page, instead, use pfn, and use vmf_insert_pfn map
    suggested-by Kasireddy, Vivek <vivek.kasireddy@intel.com>

    Patch2, update acked-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
    And keep the kvcalloc on the same line.

    Patch3, avoid use page, instead, use pfn, then use vmap_pfn map

    Patch4, split v2 patch4, single update codestyle to keep review
    easy.

    Patch5, another way to remove udmabuf_folio
    
---
  v1 -> v2:
    Patch1, 3 Rectify the improper use of the sg table.
    suggested-by Christian König <christian.koenig@amd.com>
    
    Patch2 add acked-by Christian K�nig <christian.koenig@amd.com> which
    marked in v1

    Patch4
    Modify the data structure to restore the use of pages and
    correct the misunderstanding of loop conditions such as "pgcnt".
    make sure pass self test.

    remove v1's patch4
v6
  https://lore.kernel.org/all/20240909091851.1165742-1-link@vivo.com/
v5
  https://lore.kernel.org/all/20240903083818.3071759-1-link@vivo.com/
v4
  https://lore.kernel.org/all/20240822084342.1574914-1-link@vivo.com/
v3
  https://lore.kernel.org/all/20240813090518.3252469-1-link@vivo.com/
v2
  https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (7):
  udmabuf: pre-fault when first page fault
  udmabuf: change folios array from kmalloc to kvmalloc
  udmabuf: fix vmap_udmabuf error page set
  udmabuf: udmabuf_create pin folio codestyle cleanup
  udmabuf: introduce udmabuf init and deinit helper
  udmabuf: remove udmabuf_folio
  udmabuf: reuse folio array when pin folios

 drivers/dma-buf/Kconfig   |   1 +
 drivers/dma-buf/udmabuf.c | 275 +++++++++++++++++++++++---------------
 2 files changed, 169 insertions(+), 107 deletions(-)


base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
-- 
2.45.2

