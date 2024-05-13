Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109A8C442D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C360C10E832;
	Mon, 13 May 2024 15:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="i/wRsfVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EA910E82E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:31:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41ff5e3dc3bso21964665e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1715614276; x=1716219076;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dxmLYimTka0UK5sW5DAVxYAiCvREtrz1TArXlHydtTQ=;
 b=i/wRsfVl2b6oqtURVoF/Wh3SNkjl8XDFEQ7bRoxKVztceSJrYduoNBxf5eTlqOa9/r
 TrDE9i2nViGldXF1CQYO1lajfP0YpROyq6xiIs1PoeqvF6h7zJCGaqCmgrddyURZevh7
 ybXWPthVxWPkeYDTXWlO2ZoNO5TwmQhtItM6muZKTtOMG0DKzMj80swR3yoqEe2k0gd8
 Xje8l0LZAZkltSQjqCTZTy1EJesfJxptWg/hdF1ujvUNl9v2ab0Q9gUdFmKBZy8boGSW
 huv1c/Uf3xQOMvqDTB++aPkjYa6YLOAtHBZeTq3lTAFArclCpcOWjSMZqVIaDPRnwc8a
 Dfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715614276; x=1716219076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxmLYimTka0UK5sW5DAVxYAiCvREtrz1TArXlHydtTQ=;
 b=YkOMWMBvkAb9/PTvY+Hpgkoqi3qoteFgEb1Vfy0RwX6RkUpp1u1bTeiiP9YL3fHEoG
 ugRKG0BoMUV0CtyreQJMXt70fwMOP8XCoJSuRAW8bqoIKXqI0/A6guvDeSg0LaKlsDJT
 fc5R6Vl3B18MB88dxT8fft1Po83nLqGFnN8dCEFCRdoCwfeQqckV4Eec9JRCmnej75BZ
 PA/5MSiDCOvyg+zyPnPoaxXBHH70qntqlYRbDHHS+AAi8oCxGCUDykbcP/OVK79i2r1J
 XwAFqDX9n+4MzNyn0vc39BVP7CMUJrU/SrAnQTKka+1VZlsgwOK7Zc8YdT8m/w7PVwcO
 5dbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkI5rMQRu4vbtAf7sgjCZKRTxxVCevr4K8CLMWon2jYaMlIIjPLIx53eQRzpTel6HpERmRjpqADJa7leWu5X2L59nbuMEBN6YP9yV0m9Vr
X-Gm-Message-State: AOJu0YwoN8Pq4DuGVeQG8GxUxnyq9etIMiyH9gGkLZWJHU+2PcAhfq7f
 U3RZODWAhF18x2AipAMLX5cYDNbHLcz/ls9+Tx74OhlLjykax2Bg
X-Google-Smtp-Source: AGHT+IFb7EnW+3pnZyH0Glgdx0MzBoXAaDIlnzZ4ffNIl2p0CjkGlHYUuJB7zs16Toj4uMbxwCEHYw==
X-Received: by 2002:a05:600c:3108:b0:416:536b:683a with SMTP id
 5b1f17b1804b1-41fead65000mr68116615e9.32.1715614275921; 
 Mon, 13 May 2024 08:31:15 -0700 (PDT)
Received: from [192.168.1.10] ([94.1.72.75])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41f87b2648fsm197138905e9.7.2024.05.13.08.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 08:31:15 -0700 (PDT)
Message-ID: <3f5fbab7-13f1-4eb8-976c-882c6cff9292@googlemail.com>
Date: Mon, 13 May 2024 16:30:59 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: /sys/kernel/debug/vgaswitcheroo directory missing
To: Jani Nikula <jani.nikula@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
References: <199a1636-2cd1-4d66-b2b2-1b64c5af4f2d@googlemail.com>
 <ZjugHVX1WIgjbAH1@phenom.ffwll.local>
 <b77cb343-1ea8-4cfd-ac77-b7e8d1c5e078@googlemail.com>
 <b25a0ca3-e1bd-4457-8283-6878493b864f@googlemail.com>
 <87cypqgnro.fsf@intel.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <87cypqgnro.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Revert "drm/nouveau/firmware: Fix SG_DEBUG error with nvkm_firmware_ctor()"
a222a6470d7eea91193946e8162066fa88da64c2

The errors I reported are the same as those quoted in the pull request for the revert.

On 13/05/2024 08:43, Jani Nikula wrote:
> On Sat, 11 May 2024, Chris Clayton <chris2553@googlemail.com> wrote:
>> Mmm, I see a patch has made it's way to mainline and can confirm that
>> it fixes the problems I tbothered you with in this thread.
> 
> Which patch? Might be interesting for posterity.
> 
> BR,
> Jani.
> 
> 
