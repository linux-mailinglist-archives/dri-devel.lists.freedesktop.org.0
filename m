Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B932365BF4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CA86E83E;
	Tue, 20 Apr 2021 15:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AF56E83D;
 Tue, 20 Apr 2021 15:16:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r9so58838151ejj.3;
 Tue, 20 Apr 2021 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=9XfEV9oEn1lJSaqj9TbjxEJFRAwK5iqlEPZ917AshFM=;
 b=RrmGMV7wVOUcfOC86XE+jGhImpDb6YwcTnFpdy5fzZoEhg2cUtGw3NwLQoc0vwn8oy
 mESJwiXS/Wqfxef2igoY+23JOmbpSgTkW3JL2scpjHf3JW4bxR2qQnFKDPuKcyDCYJWB
 o7qpMI9Bd5Od//MFjAuUZ3hLrcB1IzoFCdPWF1q7HCjyKqDIhXJzx3IjY5NtofI0PZv0
 6oZyh8qfVcvH6NWNCKVHXgPjpNVC1Z7fUneWHEfZRSRAeopD49PvIFniJazp0ZXsl414
 dByKUDPfrXLncbwk5q8ps2rj0LPCTtCYSRxNDdzp6wfquseaAgitdLFaJ2V8buRo6OEX
 tzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=9XfEV9oEn1lJSaqj9TbjxEJFRAwK5iqlEPZ917AshFM=;
 b=D08OCLMqVzsZ/zCZQuyRDGKriqNTtL43fyNg2f5obRIQrkqSlVccfNw+NQa+WEh7Rf
 /R6cidFwLyfBkrwMLsPk17YcUTSCMr9DU5IXpXC3fT1ayXxwLIWdyw4Y65671fq+IJDK
 dh7+DmaMnJfe03yLlpZzRgPJ1x+/Gkd6NpANaBoSoJoxIh4cs/zDzSLCLS71Vt6wbGj7
 In8HqEep6wSKG+FkhTh3OiEz91Em2a+cELF4cJQFbmTqT51w8wvTL10hDZMIrNnmDPgz
 4sdPCcklLRRm/nmj6ha8ZBJmO9NJcT14UJck50OANoAL1P2icLdNbSk8cnuRcMU9BBLA
 QP5w==
X-Gm-Message-State: AOAM533DhBSarHWCvtOG2Fg7P66VBqB4LhiBeBwrMh7QOU9vZwMKehEs
 iidBDJ3DRgf5aFqR8YBvDjE2DDi1hyY=
X-Google-Smtp-Source: ABdhPJzkgXcymjKVCC4p5fRbGNSWuEr9uBvEXnGjvkVT5Nn286KMzdowr9qPyyDUk/Auc38gaRNg6g==
X-Received: by 2002:a17:906:578a:: with SMTP id
 k10mr27941013ejq.425.1618931769119; 
 Tue, 20 Apr 2021 08:16:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3caf:a441:2498:1468?
 ([2a02:908:1252:fb60:3caf:a441:2498:1468])
 by smtp.gmail.com with ESMTPSA id go38sm12738142ejc.40.2021.04.20.08.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 08:16:08 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Stone <daniel@fooishbar.org>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
 <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
Date: Tue, 20 Apr 2021 17:16:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
Content-Language: en-US
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Type: multipart/mixed; boundary="===============2046098614=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2046098614==
Content-Type: multipart/alternative;
 boundary="------------A415D973DF76326534C8EB39"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A415D973DF76326534C8EB39
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 20.04.21 um 17:07 schrieb Daniel Stone:
> On Tue, 20 Apr 2021 at 15:58, Christian König 
> <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>
>     Am 20.04.21 um 16:53 schrieb Daniel Stone:
>>     On Mon, 19 Apr 2021 at 11:48, Marek Olšák <maraeo@gmail.com
>>     <mailto:maraeo@gmail.com>> wrote:
>>
>>         Deadlock mitigation to recover from segfaults:
>>         - The kernel knows which process is obliged to signal which
>>         fence. This information is part of the Present request and
>>         supplied by userspace.
>>         - If the producer crashes, the kernel signals the submit
>>         fence, so that the consumer can make forward progress.
>>         - If the consumer crashes, the kernel signals the return
>>         fence, so that the producer can reclaim the buffer.
>>         - A GPU hang signals all fences. Other deadlocks will be
>>         handled like GPU hangs.
>>
>>
>>     Another thought: with completely arbitrary userspace fencing,
>>     none of this is helpful either. If the compositor can't guarantee
>>     that a hostile client has submitted a fence which will never be
>>     signaled, then it won't be waiting on it, so it already needs
>>     infrastructure to handle something like this.
>
>>     That already handles the crashed-client case, because if the
>>     client crashes, then its connection will be dropped, which will
>>     trigger the compositor to destroy all its resources anyway,
>>     including any pending waits.
>
>     Exactly that's the problem. A compositor isn't immediately
>     informed that the client crashed, instead it is still referencing
>     the buffer and trying to use it for compositing.
>
>
> If the compositor no longer has a guarantee that the buffer will be 
> ready for composition in a reasonable amount of time (which dma_fence 
> gives us, and this proposal does not appear to give us), then the 
> compositor isn't trying to use the buffer for compositing, it's 
> waiting asynchronously on a notification that the fence has signaled 
> before it attempts to use the buffer.
>
> Marek's initial suggestion is that the kernel signal the fence, which 
> would unblock composition (and presumably show garbage on screen, or 
> at best jump back to old content).
>
> My position is that the compositor will know the process has crashed 
> anyway - because its socket has been closed - at which point we 
> destroy all the client's resources including its windows and buffers 
> regardless. Signaling the fence doesn't give us any value here, 
> _unless_ the compositor is just blindly waiting for the fence to 
> signal ... which it can't do because there's no guarantee the fence 
> will ever signal.

Yeah, but that assumes that the compositor has change to not blindly 
wait for the client to finish rendering and as Daniel explained that is 
rather unrealistic.

What we need is a fallback mechanism which signals the fence after a 
timeout and gives a penalty to the one causing the timeout.

That gives us the same functionality we have today with the in software 
scheduler inside the kernel.

Regards,
Christian.

> Cheers,
> Daniel


--------------A415D973DF76326534C8EB39
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 20.04.21 um 17:07 schrieb Daniel
      Stone:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><span style="">On Tue, 20 Apr 2021 at 15:58,
            Christian König &lt;<a
              href="mailto:ckoenig.leichtzumerken@gmail.com"
              moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
            wrote:</span></div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Am 20.04.21 um 16:53 schrieb Daniel Stone:</div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Mon, 19 Apr
                      2021 at 11:48, Marek Olšák &lt;<a
                        href="mailto:maraeo@gmail.com" target="_blank"
                        moz-do-not-send="true">maraeo@gmail.com</a>&gt;
                      wrote:</div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">
                      <div dir="ltr">
                        <div><span>Deadlock mitigation to recover from
                            segfaults:</span><br>
                        </div>
                        <div>- The kernel knows which process is obliged
                          to signal which fence. This information is
                          part of the Present request and supplied by
                          userspace.<br>
                        </div>
                        <div>- If the producer crashes, the kernel
                          signals the submit fence, so that the consumer
                          can make forward progress.</div>
                        <div>- If the consumer crashes, the kernel
                          signals the return fence, so that the producer
                          can reclaim the buffer.</div>
                        <div>- A GPU hang signals all fences. Other
                          deadlocks will be handled like GPU hangs.</div>
                      </div>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>Another thought: with completely arbitrary
                      userspace fencing, none of this is helpful either.
                      If the compositor can't guarantee that a hostile
                      client has submitted a fence which will never be
                      signaled, then it won't be waiting on it, so it
                      already needs infrastructure to handle something
                      like this. </div>
                  </div>
                </div>
              </blockquote>
              <br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div>That already handles the crashed-client case,
                      because if the client crashes, then its connection
                      will be dropped, which will trigger the compositor
                      to destroy all its resources anyway, including any
                      pending waits.</div>
                  </div>
                </div>
              </blockquote>
              <br>
              Exactly that's the problem. A compositor isn't immediately
              informed that the client crashed, instead it is still
              referencing the buffer and trying to use it for
              compositing.<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>If the compositor no longer has a guarantee that the
            buffer will be ready for composition in a reasonable amount
            of time (which dma_fence gives us, and this proposal does
            not appear to give us), then the compositor isn't trying to
            use the buffer for compositing, it's waiting asynchronously
            on a notification that the fence has signaled before it
            attempts to use the buffer.</div>
          <div><br>
          </div>
          <div>Marek's initial suggestion is that the kernel signal the
            fence, which would unblock composition (and presumably show
            garbage on screen, or at best jump back to old content).</div>
          <div><br>
          </div>
          <div>My position is that the compositor will know the process
            has crashed anyway - because its socket has been closed - at
            which point we destroy all the client's resources including
            its windows and buffers regardless. Signaling the fence
            doesn't give us any value here, _unless_ the compositor is
            just blindly waiting for the fence to signal ... which it
            can't do because there's no guarantee the fence will ever
            signal.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, but that assumes that the compositor has change to not blindly
    wait for the client to finish rendering and as Daniel explained that
    is rather unrealistic.<br>
    <br>
    What we need is a fallback mechanism which signals the fence after a
    timeout and gives a penalty to the one causing the timeout.<br>
    <br>
    That gives us the same functionality we have today with the in
    software scheduler inside the kernel.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <div>Cheers,</div>
          <div>Daniel</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A415D973DF76326534C8EB39--

--===============2046098614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2046098614==--
