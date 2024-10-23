Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B379F9AC203
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ECC10E79B;
	Wed, 23 Oct 2024 08:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AbkSO+bD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265410E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmIKAuNyavGQ4gRA05t9FKIxvoe8rvI+Zzta9RWoi692Z/biKp2seYAbPsw/sBUg1jUBLqwwIwIkFgcrRPFWTrMmhoBpuBB2uNMktL5/FXbW5Nmx9IOE1JhHZqeGdJx3b8UMsOl5tH0Hsuc50wJHYJhesn6sbV+PiAFx8ZyOITNT4ezFe7XGQtHrfuGRTQiVPmgcM8Nb0u94UsBDJyN6l+S+x0rAUmrrVo9+5bmtGWPt5TYE+IF0TXMjCYjgNP4tRM4+fQQvzgJ4l2ksj4o+lO5BV79ln0Zxp1pQ8IXyVdzEYgxigo9XCePIgnJRya8E+pRRrXksvWF1KH2xjUG7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3d4DQUdCyXZxRKzo7Cez+mU+DYo796HlZg9uwoqCPY=;
 b=ME+Gj3Zg9XB1ywJ4/XeAy3W3Obr3UDqzDvibmqkY+esAyriADCQzPRHNFuAcbXgkqko6NwVeZPmMomHCOSuOgMVaP2kGartoHEvoT0QyjRmdkcDjvbG3Xv67GrNwhVv7alEB6D5fADQMtRADIBIRC/vkkY8l5PVgvtWH+lSDcP9DvgJ1aM8/Aah+Zkr6Rd/+uf0P7vD+VdS2EIZhLS4gAvJcVPPYwQ7BSOO2LV45WftjpPIDT3TuEVC0b5NM7NAuYg7c/dsZqZYhkRqOBpHxu4j5PzVl9OBQKwqnIjPkVfKnM6vHUWGNH0+DX/j93EYMh1oXt09O1npsKbKFnDG98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3d4DQUdCyXZxRKzo7Cez+mU+DYo796HlZg9uwoqCPY=;
 b=AbkSO+bDKSjWEG4rPnJiSabC7YYlFBZZBoRVGDW2VCc/qClzoYrdV1FYgCbW920/woPiyWRUO7MLKOmX/P3mOXmLvuoFbyuYP6jOjosxhw+iMjepCKeuDaALwvmOOxJnkkjjYoz6lGC5huajF5Z9CZs9eo/YWMRWQYS3Zn1IcYO7e+EMD88y7xNMmWl9bwnSHWV8dRtVpcCMkNif+odD8XCc4CVEpT/WMphiyDcDqAuC6O1J6S8uVpi7dfsKzeKdG0siStoYfo0fncFe99OEEHzgi5KAFYtmEL/4Yawxdyk/KwnaQuDGVZxz+FdY1mr5TxiAPx03lxKFT7//YEYP5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 08:44:55 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 08:44:55 +0000
Message-ID: <f62e1271-926c-458f-84a0-35ebb530f731@nvidia.com>
Date: Wed, 23 Oct 2024 09:44:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/43] drm/fbdev-generic: Convert to fbdev-ttm
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-43-tzimmermann@suse.de>
 <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
 <279c7b9b-9973-4eab-8321-a3bc23c97550@suse.de>
 <8b1059d8-7f28-4f97-9fb6-1d3c66cc3713@nvidia.com>
 <c33af9e5-35c0-43f3-8967-3e5a8505653b@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <c33af9e5-35c0-43f3-8967-3e5a8505653b@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: e702a4d3-8abf-4ad0-679e-08dcf33ef7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXlEUXRVeVRGQTlXQXEzdkRtU0o5Nm1ycSt1Y3FFVjgrRXFsV0grOFpuZlJW?=
 =?utf-8?B?WFlYOGhscXJDdXZ6N2pLL3hFc1lIcjE4Y1hhWUc4aFRXTEtWd3FyNzJsZE5y?=
 =?utf-8?B?endWNkNKMm9rNTR0d2lCamZUbThaYmZiZ01rdGt6QWt5MVZmWk1iM2xuV1or?=
 =?utf-8?B?SXp6Z0NBVWk5NHNkeTc3bVprOE4vMDZGT3hhOFVWc2lla0NWVHdhb1lyRC9h?=
 =?utf-8?B?R0s5OHJjUDBVUThZSlkwTkZXSnZ1NjBVREl0MVlZekNYdFJlTXo3c2RJalha?=
 =?utf-8?B?dDBiUlI1eE9FWkFoNHlGK2JqeTZVWFZFMVZLMXZCYlZpd2Y1VXE3ZFFBeGlB?=
 =?utf-8?B?alUzMXFJVU85a1NtT3NseTNoclBxVDJFUVcyTVZMek5MRTlieXExNktBeTRm?=
 =?utf-8?B?VzJsMmY3UVl4dmNleDVDdlJxRzJMYUNpcW5wZTJXRWhxSXhDaUlDM2ZORGRH?=
 =?utf-8?B?TERSRS9aSzBFTmVucWFla0E3R3I3NkszVytHdEMyN0lWa3BEQVZ6bG90ckNm?=
 =?utf-8?B?TGlYZWgwTFdNcTA4OVhKcW1qRUQyUDNvWEMwKzFSaGVjV2M1cXhGQ2JrL2tQ?=
 =?utf-8?B?eXc0UE5ETndPMmlRSmdqQTFXRis4NWNtUmhtZG53SXkzVEdzYzVNNmRJa01T?=
 =?utf-8?B?eS9udytJdnpqdnBjcHgzNHdzR1NBN2F3b1NtbW5XYUcwc0d5VEl1Y09vSmhI?=
 =?utf-8?B?OFFuU3dIc3lUYmJpTnI5OGNFWEdENzdmQTdVWVpRNnBxd3g5MHdnU3M5Tm0v?=
 =?utf-8?B?K3UvVHhuM0dXNnRITkRveGdMdzU3blNmWUhidElCdDlaUys0cWt1RHhVMGJi?=
 =?utf-8?B?V3pQS2h4SUxDV0orV09vUlhVaW9ZUzdTMUxHb2RtRmEvVWdaSU1rblI0N1RW?=
 =?utf-8?B?aGw0YnRUSnJYay81VXhXWTF4bkhsLzVKSVZhcHNTVnN6c1NoSkJaOEVoMDVE?=
 =?utf-8?B?b2JwQzN3bEpMOFV5NTBLM0FGTVliVWxRMHFsamtzc0NudVF5azZ1UUxPNWlC?=
 =?utf-8?B?MndhQW51b0FRQWZrWlRib0hYTEhKREVwakJwN2VyNWdnY3VQZGphSmpXSk1k?=
 =?utf-8?B?UkUxaGc4dHBWOWtmUkUxVGthbU1zUGlweDRMNG0wRk9yRHhMRGdSVlJDbUYw?=
 =?utf-8?B?KzBJVThGdVovMG8yd3M2VnE2WHpwWlVTcmI3ekRQZS92N1d6SlFtTmFWa25h?=
 =?utf-8?B?VmxCRWVheThxenBUNXZ0N2xlbVF5SmpOTkkrODV3SHJQb2VwRUlEUXYyVHdW?=
 =?utf-8?B?SktzOXQxbTRGSEdtSWRqaGI0QWZaZVFGRkRDU1JNYSs3NmprTSt3WmdGZnJP?=
 =?utf-8?B?a0lVRVAxcnB4MHBUV0xuZng4WTRQb0xyWldHQ2lCY1IxMmxINFhPMnZQNFFP?=
 =?utf-8?B?cnlWR1dkUVg2aTRGemVFMStUTTdBN2dSRlowd0lMa00zNlcwNlZ4YjJ0eGF3?=
 =?utf-8?B?Yjc2cGFUMGFxODBMZFo1cUZvSW81T05XWVRqQ0l2V2puM003STc4ckVuRksx?=
 =?utf-8?B?ZmhoZUhzc0RYTmhlSjVQTmJ2VFZZZEIvWjhFemlHM1ptN0pkTGlJdWxFWTRo?=
 =?utf-8?B?ZUlQMEZ4K0xtd0o0cC9DSGR6bVdEL2FqbWN1WWdRZlMwdmJxdHJhRHBteGZP?=
 =?utf-8?B?NFJLV2FYaG93Vm5qdE9jNnNhdkw0aXF1d2duc2kzTmpZWHpCOHlzQnVjc2V3?=
 =?utf-8?B?UFB0Wms3UHQrRGVDaEJ2STdpTnJPemlJOUZoOTRqSHlkZVdISXlsWnNWWFZ6?=
 =?utf-8?Q?O3PbcZrr4bYDL7Asbda2cskDexc8RFnsaqaRon6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c25wTDdNL0xFcGFHQnJzR3grMWZITEpRdzhDc1FldTM4VVY0WUc3eEtNWE5P?=
 =?utf-8?B?MEp2eWFEY2NBV0NlcjludTJyNDFuNU9qQlVvUkJEVFdlejZ1RlVMMkZEY0xH?=
 =?utf-8?B?aUhCZlRnRUprdmdrVkdTcTZ0elJSalRxZEZRU0h6MVRReUJYdHI5c21jUE9Q?=
 =?utf-8?B?QzRCelk0WCt5WjFhR1hzQW1tMFc3OHJIOUJpQkZOL2g1WkJYR3dRRkdocjVa?=
 =?utf-8?B?bWh3YVVSVTlYTU1zM00zZ2V2OFEzVW11UVozaDFzTm5ybWU5ZWIyanpSZmc4?=
 =?utf-8?B?SmswRm9yeDFPdE5NQzBZNCs2dElNZE5NcHRUUEpScm04a0wreDNIVEswTGxq?=
 =?utf-8?B?SlVnQzh6U1BDR2Z6b1lBbktDWlZ3UjhWWUtJR3hZQmw0REZGcTFTVVg4TkN1?=
 =?utf-8?B?NS9kN0lkbFV3ZHZSais1WHVpdFBPcnA3RGJYeVI1TDNYTXJnQW5WTW16QkUx?=
 =?utf-8?B?Q0cwMFB4cyswVUJUNEF3UlpUVVpmc1lyZGIvd3VnckdPNXZHdzJteUlEUk0x?=
 =?utf-8?B?SmlHdVZYT2twemVaalBxUUpMcHMvRFhreVhxcXRXM09PSE5sQ09KU3BWNHpV?=
 =?utf-8?B?WklaOFJRcGl1Q0N2cmJleU5aVlRYQWlucWtSSGI5anRwUVgwOUllWXFpRmtY?=
 =?utf-8?B?ZHFGWXk5Q1lxTk5Gdk9UT1BscFVwRk9jd0ZzSXJhZ1ZSeTZjZnpFdzArMzBn?=
 =?utf-8?B?ZkxvMk9QTnRtbTBNMTRLMklDT1ZuSG5CUDRWZXE2QXpIakFtL0RpZnIydnkx?=
 =?utf-8?B?NTRSSWZQVHJiVEJ6SXk0cHR5U3NsV01RdEptZElDaURiK3EveC9JM3QwYWxQ?=
 =?utf-8?B?eTFGUFJ3VUZlK08rRjVNR1hicGJWREVNOWxyL2dCL3lrNjBpMEJ5S0UrTEFk?=
 =?utf-8?B?aWR4b1g1Wno1NlNJdXJqNEFIbDUvT0dDSlpKQUZOdTc5dnJuRDl0djBDMWRK?=
 =?utf-8?B?QmdjQm9CWG54MEZ1aFB6Q0tMc2RPZnZ0eW1SOFNuT0tnYzd1dHhKK1B0STA0?=
 =?utf-8?B?dG83Q2c1Y0N6UUpPVTNSYTAwK2VhaXgrbnhLbzVybU54V25Oa0JsYmI2WnBC?=
 =?utf-8?B?Wk9wbWFkWDc2Q0xsMjBxeHVjTE5pR1NPZThaMHdnWTdmd1o5amlFTnVWNmFM?=
 =?utf-8?B?RGZEQzl2L3N6UHd2VzYvSElBd0RqQUl4Y3FZeUZrbGJBcldRVkR2U0ZEbERj?=
 =?utf-8?B?K0trNkpFSHFrWEtBOWdlL2JHQTlBbDEyTVlEZDZrRTg5SWt5endNbXdYZVJj?=
 =?utf-8?B?bnV1UzMxWURKbUlGd2xxODdIakdtbEpCYTY1YVpRWTdDdlplY2NVZHZuc2FD?=
 =?utf-8?B?dUJaNzgvMXRscXhjZWRwckJtVG1RZEJvZGtFTUYwd3dPUStYek5rMEU2WVNN?=
 =?utf-8?B?eFJmZjY4UEljU0EwaDcrSmJqcHZsdko1Nkp4QjNDWlpSREdXUCt1WkljWG1y?=
 =?utf-8?B?djk4Sjdhejg0U3BTSUJyN0k4SnpuYVdVNDlwR2tIUkE5bnB4L3l5ZzJCa3Vv?=
 =?utf-8?B?d1lTNW1rWVRReDAyQ2pTVjg4WDNHck9reWxNWmlZYmg0MEZnYVNyMVpqMjIr?=
 =?utf-8?B?czVsR3B6L0dIdi96bnptZElLckZUY3VxcmpjTEJ2VCtWKzNhcS9xaXR1eFRK?=
 =?utf-8?B?MUk4S2xtMDM4OFMyQ2Q4RW96UnlvUUVDS3pJNms3TnhNUWw0dW5TamlwTlh4?=
 =?utf-8?B?SmJaZlZnTmNCTUYxT2QweVBnM21rYVdSWUYvRTZNYUZXNXF5SjljNWV5eE1a?=
 =?utf-8?B?Nmd1TGdLcDNlT3VSOWNmUmJaS0JCdVA2cSs4cm5pRGlrck9YZ0lCOGRnRlFs?=
 =?utf-8?B?UzVxemE0UjZNZUk0V3hGMjl3UDcxbmVFUDA0aUU5dERla1gzTnU2UzJBWmVk?=
 =?utf-8?B?a0orOERoUjc1UkVEUGdjTkdoNWZUZ1dEaW9SQjV5aVZpOFFGcGFPZmZMYjZO?=
 =?utf-8?B?UFJMKzRVNHYrOHdWZDZxOWI2c2x1dDdmTEpkUThObzBNNXJxWk0rN3IrZWVY?=
 =?utf-8?B?YmlIcURXWGNqQmFTMXpaUzErT2tPWTFhbS9TQnQ4Zi9zTUxteEtZRy9YYkIr?=
 =?utf-8?B?ZkwvM0VuUFd2dFpidlViWnlsMmlaRC9Sc0lla2xGQVZudDFWSStBUVo0Wk9D?=
 =?utf-8?B?MnhQSWZRUmlSYTJuZlppVVNlNnM4eEtNa0tXb2s1dzg1ZHluTXlrcGp3aTBX?=
 =?utf-8?Q?7mYVtAhbDITvodri5MwQbzhve5qaqq5pZ7fo87AZzbA4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e702a4d3-8abf-4ad0-679e-08dcf33ef7cd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:44:55.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAghZlQZIpQKqGzdIhDQmiMnqvmu1GcfAxwfKMaaXjEDDgW3+EjddQibA6h3kqHklBN08xE1yudgaHNjcutKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
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


On 23/10/2024 07:43, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.10.24 um 17:36 schrieb Jon Hunter:
>>
>>> We'd turn a linker/modpost error into a compiler error. Likely makes 
>>> no difference. And AFAICT every driver that selects TTM also selects 
>>> TTM_HELPER. Drivers without TTM should not use this header.
>>
>>
>> Yes I also noted that all the current drivers select TTM_HELPER and so 
>> we don't run into this. However, it still seems a bit odd that we 
>> don't expose a proper stub if TTM_HELPER is disabled (especially 
>> seeing as there is a stub defined).
> 
> It's not different from other headers AFAICT. For example, the TTM 
> headers don't guard any of their interfaces or provide stubs. The guards 
> and stubs only make sense if an interface really is optional wrt some 
> config token. That's not the case here wrt DRM_TTM_HELPER.


Just to be clear, there is a stub for this case which was added by this
patch ...

#ifdef CONFIG_DRM_FBDEV_EMULATION
void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
#else
static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
{ }
#endif

The point I am trying to make is that this stub is only defined if
!CONFIG_DRM_FBDEV_EMULATION. However, the problem is that if
CONFIG_DRM_FBDEV_EMULATION is enabled, but CONFIG_DRM_TTM_HELPER is not
the stub is not defined, when it should be. Yes as we discussed this
does not impact any current users and so may be that is fine, but it
seems it would be better to have no stub at all, rather than one that is
defined for some configurations but not all cases where the actual
drm_fbdev_ttm_setup() function is not available. Again this whole thing
could be moot anyway, because this is going away completely from looking
at -next.

Cheers!
Jon

-- 
nvpublic
